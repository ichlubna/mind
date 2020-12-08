import QtQuick 2.4
import io.qt.UserDataProvider 1.0

MoodForm {
    property var moods;
    property var arrayName : "moods";
    property var headerText : "";
    property var titleText : "";
    property var helpPopup : true;

    UserDataProvider {
        id: dataProvider
    }

    function markChoice(choice)
    {
        const inactiveOpacity = 0.6;
        for(var i=0; i<5; i++)
            emoticons.itemAt(i).opacity = (choice === 5-i) ? 1.0 : inactiveOpacity;
    }

    function draw()
    {
        if(moods.length <= 1)
        {
            chartView.visible = false;
            noData.visible = true;
            return;
        }
        else
        {
            chartView.visible = true;
            noData.visible = false;
        }

        chart.clear();

        for(var i=range.first.value; i<=range.second.value; i++)
        {
            var moodString = moods[i];
            var mood = moodString.split('|');
            chart.append(new Date(mood[0]), parseInt(mood[1]));
        }
        chart.axisX.min = new Date(moods[range.first.value].split('|')[0]);
        chart.axisX.max = new Date(moods[range.second.value].split('|')[0]);
    }

    function init()
    {
        moods = dataProvider.loadArrayInput(arrayName);

        if(moods.length === 0)
            return;
        var lastMood = moods[moods.length-1].split('|');
        var now = new Date();
        now.setHours(0);
        now.setMinutes(0);
        now.setSeconds(0);
        now.setMilliseconds(0);
        if(new Date(lastMood[0]).getTime() === now.getTime())
        {
            markChoice(parseInt(lastMood[1]));
        }

        range.to = moods.length-1;
        range.second.value = moods.length-1;
        draw();
    }

    function save(value)
    {
        markChoice(value);
        var now = new Date();
        now.setHours(0);
        now.setMinutes(0);
        now.setSeconds(0);
        now.setMilliseconds(0);
        if(moods.length !== 0)
        {
            var lastMood = moods[moods.length-1].split('|');
            if((new Date(lastMood[0])).getTime() === now.getTime())
                moods[moods.length-1] = lastMood[0] + "|" + value;
            else
            {
               moods.push(now + "|" + value);
               range.to = moods.length-1;
               range.second.value = moods.length-1;
            }
        }
        else
            moods.push(now + "|" + value);
        dataProvider.saveArrayInput(arrayName, moods);

        draw();

        for(var i=moods.length-1; i>moods.length-4; i--)
            if(parseInt(moods[i].split('|')[1]) > 1)
                return;
        if(helpPopup)
            popup.open();
    }

    Connections {
        target: chart
        Component.onCompleted: {
            init()
        }}

    popup.yes.onClicked: {popup.close(); stackView.push("../Contacts/Contacts.qml");}
    popup.no.onClicked: popup.close()

    range.first.onMoved: draw()
    range.second.onMoved: draw()
}

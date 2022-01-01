import QtQuick
import io.qt.UserDataProvider

MoodForm {
    property var moods;
    property string arrayName : "moods";
    property string headerText : "";
    property string titleText : "";
    property bool helpPopup : true;
    property bool dataAvailable: true
    property int length: 0

    function sliderToLast(count)
    {
        range.first.value = (count > 0) ? length-count : 0;
        draw();
    }

    weekButton.onClicked: {
        sliderToLast(7);
    }

    monthButton.onClicked: {
        sliderToLast(30);
    }

    allButton.onClicked: {
        sliderToLast(-1);
    }

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
        length = moods.length
        dataAvailable = moods.length > 1;
        chart.clear();

        var start = Math.floor(range.first.value);
        var end = Math.floor(range.second.value);

        for(var i=start; i<=end; i++)
        {
            var moodString = moods[i];
            var mood = moodString.split('|');
            chart.append(new Date(mood[0]), parseInt(mood[1]));
        }
        chart.axisX.min = new Date(moods[start].split('|')[0]);
        chart.axisX.max = new Date(moods[end].split('|')[0]);
    }

    function init()
    {
        moods = []; //dataProvider.loadArrayInput(arrayName);
        for(var i=100; i>0; i--)
        {
             moods.push(new Date());
             moods[moods.length-1].setDate(moods[moods.length-1].getDate() - i);
             moods[moods.length-1] += "|" + (1+Math.floor(Math.random()*5)-1);
        }


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

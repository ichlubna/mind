import QtQuick 2.4
import io.qt.UserDataProvider 1.0

DepressionMoodForm {
    property var moods;

    UserDataProvider {
        id: dataProvider
    }

    function markChoice(choice)
    {
        var inactiveOpacity = 0.6;
        emoticon5Img.opacity = inactiveOpacity;
        emoticon4Img.opacity = inactiveOpacity;
        emoticon3Img.opacity = inactiveOpacity;
        emoticon2Img.opacity = inactiveOpacity;
        emoticon1Img.opacity = inactiveOpacity;

        if(choice === 1)
            emoticon5Img.opacity=1.0;
        else if(choice === 2)
            emoticon4Img.opacity=1.0;
        else if(choice === 3)
            emoticon3Img.opacity=1.0;
        else if(choice === 4)
            emoticon2Img.opacity=1.0;
        else if(choice === 5)
            emoticon1Img.opacity=1.0;
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

        console.log(moods.length);
        for(var i=range.first.value; i<=range.second.value; i++)
        {
            var moodString = moods[i];
            var mood = moodString.split('|');
            chart.append(new Date(mood[0]), parseInt(mood[1]));

            console.log(moodString);
        }
        chart.axisX.min = new Date(moods[range.first.value].split('|')[0]);
        chart.axisX.max = new Date(moods[range.second.value].split('|')[0]);
        console.log(moods[range.second.value]);

        //dataProvider.saveIntInput("moodsRangeStart", range.first.value);
        //dataProvider.loadIntInput("moodsRangeStart", range.second.value);
    }

    function init()
    {
        moods = dataProvider.loadArrayInput("moods");
        moods = [];
        var d = new Date("Fri Feb 1 00:00:00 2019 GMT+0200") + "|1";
                moods.push(d);
        d = new Date("Fri Feb 7 00:00:00 2019 GMT+0200") + "|2";
                moods.push(d);
        d = new Date("Fri Mar 5 00:00:00 2019 GMT+0200") + "|3";
                moods.push(d);
        d = new Date("Fri Mar 20 00:00:00 2019 GMT+0200") + "|1";
                moods.push(d);
        d = new Date("Fri Mar 21 00:00:00 2019 GMT+0200") + "|1";
                moods.push(d);
        d = new Date("Fri May 30 00:00:00 2019 GMT+0200") + "|1";
        moods.push(d);

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

        /*if(dataProvider.exists("moodsRangeStart"))
            range.first.value = dataProvider.loadIntInput("moodsRangeStart");
        if(dataProvider.exists("moodsRangeEnd"))
            range.second.value = dataProvider.loadIntInput("moodsRangeEnd");*/

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
        dataProvider.saveArrayInput("moods", moods);

        draw();

        for(var i=moods.length-1; i>moods.length-4; i--)
            if(parseInt(moods[i].split('|')[1]) > 1)
                return;
        popup.open();
    }

    Connections {
        target: chart
        Component.onCompleted: {
            init()
        }}

    emoticon1.onClicked: save(5)
    emoticon2.onClicked: save(4)
    emoticon3.onClicked: save(3)
    emoticon4.onClicked: save(2)
    emoticon5.onClicked: save(1)

    yes.onClicked: {popup.close(); stackView.push("Contacts.qml");}
    no.onClicked: popup.close()

    range.first.onMoved: draw()
    range.second.onMoved: draw()
}

import QtQuick 2.4

DepressionMoodForm {
    property var moods;

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

    function init()
    {
        moods = dataProvider.loadArrayInput("moods");
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

        for(const moodString of moods)
        {
            var mood = moodString.split('|');
            chart.append(new Date(mood[0]), parseInt(mood[1]));
            console.log(new Date(mood[0]) + " " + mood[1]);
        }

        chart.axisX.min = new Date(2019,4,15);
        chart.axisX.max = new Date(2019,4,20);
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
                moods[0] = lastMood[0] + "|" + value;
            else
                 moods.push(now + "|" + value);
        }
        else
            moods.push(now + "|" + value);
        dataProvider.saveArrayInput("moods", moods);
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
}

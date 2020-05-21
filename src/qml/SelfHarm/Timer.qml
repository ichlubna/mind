import QtQuick 2.4
import io.qt.UserDataProvider 1.0

TimerForm {
    title: qsTrId("self-harm-timer")

    UserDataProvider {
        id: dataProvider
    }

    property var running : dataProvider.loadBoolInput("selfHarmTimer")
    property var format : "d.M.yyy-h:m:s"
    property var lastDate : new Date(dataProvider.loadInput("selfHarmTimerDate"));
    property var record : dataProvider.loadIntInput("selfHarmTimerRecord");
    property var difference : 0

    function printTime(seconds)
    {
        const monthDivisor = 30*24*60*60;
        const dayDivisor = 24*60*60;
        const hourDivisor = 60*60;
        var months = Math.floor(seconds/monthDivisor);
        var remainder = seconds%monthDivisor;
        var days = Math.floor(remainder/dayDivisor);
        remainder = remainder%dayDivisor;
        var hours = Math.floor(remainder/hourDivisor);
        remainder = remainder%hourDivisor;
        var minutes = Math.floor(remainder/60);
        return months+":"+days+":"+hours+":"+minutes;
    }

    function update()
    {
        if(running)
        {
            difference = (new Date().getTime()-lastDate.getTime())/1000;
            timeText.text = printTime(difference);
        }
    }

    button.onClicked: {
        if(running)
        {
            running = false;
            button.text = qsTrId("start");
            if(difference > record)
            {
                record = difference;
                recordText.text = printTime(record);
            }
            timeText.text = printTime(0);
        }
        else
        {
            running = true;
            button.text = qsTrId("stop");
            lastDate = new Date();
        }
    }

    timeText.onVisibleChanged: {
        dataProvider.saveInput("selfHarmTimerDate", lastDate.toString());
        dataProvider.saveIntInput("selfHarmTimerRecord", record);
        dataProvider.saveBoolInput("selfHarmTimer", running);
    }

    Connections {
        target: timeText
        Component.onCompleted:{timeText.text=printTime(0); update();}
    }

    Connections {
        target: button
        Component.onCompleted:{button.text = (running) ? qsTrId("stop") : qsTrId("start");}
    }

    Connections {
        target: recordText
        Component.onCompleted: {recordText.text = printTime(record);}
    }

    Timer {
           interval: 10000; running: true; repeat: true
           onTriggered: update()
       }
}

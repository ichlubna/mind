import QtQuick
import io.qt.UserDataProvider

CountdownForm {
    title: qsTrId("self-harm-timer")

    UserDataProvider {
        id: dataProvider
    }

    property var running : dataProvider.loadBoolInput("selfHarmTimer")
    property var lastDate : new Date(dataProvider.loadInput("selfHarmTimerDate"));
    property var record : dataProvider.loadIntInput("selfHarmTimerRecord");
    property var difference : 0

    function convertTime(seconds)
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
        return {months: months, days: days, hours: hours, minutes: minutes};
    }

    function printTime(seconds, current)
    {
        var elapsed = convertTime(seconds)
        if(current)
        {
            currentTime.monthText.text = elapsed.months;
            currentTime.daysBar.value = elapsed.days/30;
            currentTime.hoursBar.value = elapsed.hours/24;
            currentTime.minutesBar.value = elapsed.minutes/60;
        }
        else
        {
            recordTime.monthText.text = elapsed.months;
            recordTime.daysBar.value = elapsed.days/30;
            recordTime.hoursBar.value = elapsed.hours/24;
            recordTime.minutesBar.value = elapsed.minutes/60;
        }
    }

   /* function printTimeText(seconds)
    {
        var elapsed = convertTime(seconds)
        return elapsed.months+":"+elapsed.days+":"+elapsed.hours+":"+elapsed.minutes
    }*/

    function update()
    {
        if(running)
        {
            difference = (new Date().getTime()-lastDate.getTime())/1000;
            printTime(difference, true);
        }
    }

    button.onClicked: {
        if(running)
        {
            popup.open();
        }
        else
        {
            stackView.replace("CountdownDate.qml");
        }
    }

    currentTime.onVisibleChanged: {
        dataProvider.saveInput("selfHarmTimerDate", lastDate.toString());
        dataProvider.saveIntInput("selfHarmTimerRecord", record);
        dataProvider.saveBoolInput("selfHarmTimer", running);
    }

    Connections {
        target: currentTime
        Component.onCompleted:{printTime(0, true); update();}
    }

    Connections {
        target: button
        Component.onCompleted:{button.text = (running) ? qsTrId("stop") : qsTrId("start");}
    }

    Connections {
        target: recordTime
        Component.onCompleted: {printTime(record, false);}
    }

    Timer {
           interval: 10000; running: true; repeat: true
           onTriggered: update()
       }


    function isEmpty(value){
        return parseInt(value) === -1;
    }

    popup.yes.onClicked:{
        popup.close()
        running = false;
        button.text = qsTrId("start");
        if(difference > record)
        {
            record = difference;
            printTime(record, false);
        }
        printTime(0, true);
        popupHelp.open();
    }

    popup.no.onClicked: popup.close()

    popupHelp.yes.onClicked: {popupHelp.close(); stackView.push("../Contacts/Contacts.qml");}

    popupHelp.no.onClicked: popupHelp.close()

}

import QtQuick 2.12
import QtQuick.Controls 2.12

Row {
    property var firstYear: 2000
    property var futureYears: 5
    property alias dayTumbler: dayTumbler
    property alias monthTumbler: monthTumbler
    property alias yearTumbler: yearTumbler

    DateTumbler {
        id: dayTumbler
        height: parent.height
     }

    DateTumbler {
        id: monthTumbler
        height: parent.height
        model: 12
        onCurrentIndexChanged: {
            var today = new Date();
            var d = new Date(today.getFullYear(), currentIndex+1, 0);
            dayTumbler.model = d.getDate();
        }
    }

    DateTumbler {
        id: yearTumbler
        height: parent.height
        incrementItems: false
    }

        function setDate(date)
        {
            var dateElements = date.split(".");
            dayTumbler.currentIndex = dateElements[0]-1;
            monthTumbler.currentIndex = dateElements[1];
            yearTumbler.currentIndex = dateElements[2]-firstYear;
        }

        Connections{
        Component.onCompleted:{
            var today = new Date();
            dayTumbler.currentIndex = today.getDate()-1;
            monthTumbler.currentIndex = today.getMonth();
            var year = today.getFullYear();
            var historyYears = year-firstYear
            var years = [];
            var count = historyYears+futureYears;
            for (var i=0; i<=count; i++)
                years[i] = year+i-historyYears;

            yearTumbler.model = years;
            yearTumbler.currentIndex = count-futureYears;
        }
    }

     function getDate()
     {
        return (dayTumbler.currentIndex+1).toString() + "." + (monthTumbler.currentIndex+1).toString() + "." + (yearTumbler.currentIndex+firstYear).toString();
     }
}

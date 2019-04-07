import QtQuick 2.4
import io.qt.UserDataProvider 1.0

Item {
    property int count: 0
    property var values: []
    property var valuesC: []
    //name of the array in data provider
    property string arrayName: ""
    property string tickArrayName: ""
    //use checkboxes in the list
    property bool hasTicks: false

    UserDataProvider {
        id: dataProvider
    }

    //works repeaters, itemList, itemListR (objectName: "rm"+index) and itemListC and viewContainer containing them
    function fill() {
        values = dataProvider.loadArrayInput(arrayName)
        count = values.length
        itemList.model = count
        itemListR.model = count
        if (hasTicks) {
            valuesC = dataProvider.loadArrayInput(tickArrayName)
            itemListC.model = count
        }
        for (var i = 0; i < count; i++) {
            itemList.itemAt(i).text = values[i]
            if (hasTicks)
                itemListC.itemAt(i).checked = valuesC[i] === "t"
        }
    }

    function updateValues() {
        for (var i = 0; i < count; i++) {
            values[i] = itemList.itemAt(i).text
            if (hasTicks)
                valuesC[i] = (itemListC.itemAt(i).checked) ? "t" : "f"
        }
    }

    function save() {
        dataProvider.saveArrayInput(arrayName, values)
        if (hasTicks)
            dataProvider.saveArrayInput(tickArrayName, valuesC)
    }

    function remove(index) {
        updateValues()
        values.splice(index, 1)
        if (hasTicks)
            valuesC.splice(index, 1)
        save()
        fill()
    }

    Connections {
        target: itemList
        Component.onCompleted: {
            fill()
        }
        onVisibleChanged: {
            updateValues()
            dataProvider.saveArrayInput(arrayName, values)
            if (hasTicks)
                dataProvider.saveArrayInput(tickArrayName, valuesC)
        }
    }

    Connections {
        target: addButton
        onClicked: {
            updateValues()
            values[count] = ""
            valuesC[count] = "f"
            save()
            fill()
            if (viewContainer.contentHeight > viewContainer.height)
                viewContainer.contentItem.contentY = viewContainer.contentHeight
                        - viewContainer.height
        }
    }
}

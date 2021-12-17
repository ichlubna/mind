import QtQuick
import io.qt.UserDataProvider 1.0

ArrayUpdaterForm {
    property int count: 0
    property var values: []
    property var values2: []
    property var valuesC: []
    //name of the array in data provider, order according to type
    property var arrayNames: []
    //L - list, LC - list and checkbox, C - contacts
    property var type: "L"
    property var headerText: ""
    property var titleText: ""
    property var textItem: null
    property var checkBoxItem: null
    property var removeItem: null

    OpacityAnimator {
           id: textItemAnim
           target: textItem;
           from: 0;
           to: 1;
           duration: 500
       }
    ScaleAnimator {
           id: checkBoxItemAnim
           target: checkBoxItem;
           from: 0;
           to: 1;
           duration: 500
       }
    ScaleAnimator {
           id: removeItemAnim
           target: removeItem;
           from: 0;
           to: 1;
           duration: 500
       }

    UserDataProvider {
        id: dataProvider
    }
    function fill() {
        values = dataProvider.loadArrayInput(arrayNames[0])
        count = values.length
        itemList.model = count
        itemListR.model = count
        if(type === "LC")
        {
            valuesC = dataProvider.loadArrayInput(arrayNames[1])
            itemListC.model = count
            itemListC.visible = true
        }
        else if(type === "C")
        {
            twoInputs = true;
            colHRatioM = 2;
            itemListC.model = count
            itemListC.visible = true
            values2 = dataProvider.loadArrayInput(arrayNames[1])
        }

        for (var i = 0; i < count; i++) {
            itemList.itemAt(i).children[0].text = values[i]
            if(type === "LC")
                itemListC.itemAt(i).children[0].checked = valuesC[i] === "t"
            else if(type === "C")
            {    itemList.itemAt(i).children[1].text = values2[i];
                 checkContact(i);
            }
        }
    }

    function updateValues() {
        for (var i = 0; i < count; i++) {
            values[i] = itemList.itemAt(i).children[0].text
       if(type === "LC")
                valuesC[i] = (itemListC.itemAt(i).children[0].checked) ? "t" : "f"
        else if(type === "C")
        values2[i] = itemList.itemAt(i).children[1].text
        }

    }

    function save() {
        dataProvider.saveArrayInput(arrayNames[0], values)
        if(type === "LC")
            dataProvider.saveArrayInput(arrayNames[1], valuesC)
        if(type === "C")
            dataProvider.saveArrayInput(arrayNames[1], values2)
    }

    function remove(index) {
        updateValues()
        values.splice(index, 1)
        if(type === "LC")
            valuesC.splice(index, 1)
        save()
        fill()
    }

    function call(index){
         Qt.openUrlExternally("tel:"+itemList.itemAt(index).children[1].text)
    }

    function sms(index){
         var inputText = itemList.itemAt(index).children[1].text;
         if(inputText.includes('@'))
            Qt.openUrlExternally("mailto:"+inputText);
         else
            Qt.openUrlExternally("sms:"+inputText);
    }

    function checkContact(index){
         var inputText = itemList.itemAt(index).children[1].text;
         if(inputText.includes('@'))
            itemListC.itemAt(index).children[1].visible = false
         else
             itemListC.itemAt(index).children[1].visible = true
    }

    Connections {
        target: itemList
        Component.onCompleted: {
            fill()
        }
        function onVisibleChanged () {
            updateValues()
            dataProvider.saveArrayInput(arrayNames[0], values)
        if(type === "LC")
                dataProvider.saveArrayInput(arrayNames[1], valuesC)
        else if(type === "C")
                        dataProvider.saveArrayInput(arrayNames[1], values2)
        }
    }

    function loadItem(i)
    {
        textItem = itemList.itemAt(i);
        if(type === "LC")
            checkBoxItem = itemListC.itemAt(i);
        removeItem = itemListR.itemAt(i);
    }

    Connections {
        target: addButton
        function onClicked () {
            updateValues()
            values[count] = ""
            values2[count] = ""
            valuesC[count] = "f"
            save()
            fill()
            if (viewContainer.contentHeight > viewContainer.height)
                viewContainer.contentItem.contentY = viewContainer.contentHeight
                        - viewContainer.height
            loadItem(count-1);
            textItemAnim.start();
            if(type === "LC")
                checkBoxItemAnim.start();
            removeItemAnim.start();
        }
    }
}

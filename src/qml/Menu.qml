import QtQuick 2.4

MenuForm {
    Connections {
        target: itemsList
        Component.onCompleted: {
            itemsList.model = items.length;
            for (var i = 0; i < items.length; i++)
            {
                    if(items[i].hasOwnProperty("excluded"))
                        if(items[i].excluded.includes(dataProvider.loadLanguage()))
                        {
                            itemsList.itemAt(i).visible = false;
                            continue;
                        }
                        itemsList.itemAt(i).text = items[i].text;
                        itemsList.itemAt(i).target = items[i].file;
            }
        }
}
}

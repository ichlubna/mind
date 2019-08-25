import QtQuick 2.4

PlanForm {

    customWrite {
        onVisibleChanged: dataProvider.saveInput("customWrite", customWrite.text)
        text: dataProvider.loadInput("customWrite")
    }

    customDo {
        onVisibleChanged: dataProvider.saveInput("customDo", customDo.text)
        text: dataProvider.loadInput("customDo")
    }

    customGo {
        onVisibleChanged: dataProvider.saveInput("customGo", customGo.text)
        text: dataProvider.loadInput("customGo")
    }

    customPpl {
        onVisibleChanged: dataProvider.saveInput("customPpl", customPpl.text)
        text: dataProvider.loadInput("customPpl")
    }

    customWriteBody {
        onVisibleChanged: dataProvider.saveInput("customWriteBody", customWriteBody.text)
        text: dataProvider.loadInput("customWriteBody")
    }
}

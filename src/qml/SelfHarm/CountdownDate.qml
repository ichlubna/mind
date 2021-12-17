import QtQuick
import io.qt.UserDataProvider

CountdownDateForm {
    UserDataProvider {
        id: dataProvider
    }

    okButton.onClicked: {
        var currentDate = new Date();
        var date = Date.fromLocaleString(Qt.locale(), recordDate.getDate()+" "+currentDate.getHours().toString()+":"+currentDate.getMinutes().toString(), "d.M.yyyy h:m");
        dataProvider.saveInput("selfHarmTimerDate", date.toString());
        dataProvider.saveBoolInput("selfHarmTimer", true);
        stackView.replace("Countdown.qml");
    }

    okButton.enabled: {
        var currentDate = new Date();
        var date = Date.fromLocaleString(Qt.locale(), recordDate.getDate()+" "+currentDate.getHours().toString()+":"+currentDate.getMinutes().toString(), "d.M.yyyy h:m");
        return (new Date() >= date)
    }
}

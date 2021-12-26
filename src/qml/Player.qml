import QtQuick
import QtQuick.Controls
import QtMultimedia
import io.qt.NativeInterface
import io.qt.UserDataProvider
import "."

PlayerForm {
    property var durationTime: ""

    NativeInterface {
        id: nativeInterface
    }

    function msToTime(ms)
    {
        var seconds = ms/1000
        var secondsRemainder = parseInt(seconds%60)
        var minutes = parseInt(seconds/60)
        return minutes.toString()+":"+secondsRemainder.toString().padStart(2,0)
    }

    playButton.onClicked: {
        if (mediaPlayer.playbackState === MediaPlayer.PlayingState)
            mediaPlayer.pause();
        else
            mediaPlayer.play();
    }

    mediaPlayer.onPlaybackStateChanged: {bckg.source = (mediaPlayer.playbackState === MediaPlayer.PlayingState) ? "qrc:/images/pause.svg" : "qrc:/images/play.svg"}
    playButton.onPressed: {bckg.opacity = 1.0}
    playButton.onPressedChanged: {bckg.opacity = 0.7}
    timeSlider.onPressedChanged: {mediaPlayer.position = timeSlider.value*mediaPlayer.duration}
    timeSlider.onValueChanged: {timeText.text = msToTime(timeSlider.value*mediaPlayer.duration)+"/"+durationTime}
    mediaPlayer.onMediaStatusChanged: {
        if(mediaPlayer.mediaStatus === MediaPlayer.LoadedMedia)
        {
            nativeInterface.setScreenLock(false);
            durationTime = msToTime(mediaPlayer.duration)
        }
    }


    StackView.onDeactivating:{
        nativeInterface.setScreenLock(true);
    }

    Timer {
            interval: 500; running: true; repeat: true
            onTriggered: {
                if(!timeSlider.pressed)
                    timeSlider.value = mediaPlayer.position/mediaPlayer.duration}
        }


    UserDataProvider {
        id: dataProvider
    }
    warning.visible: (dataProvider.loadLanguage() === "SK")
}

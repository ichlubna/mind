import QtQuick 2.13

Breath3Form {
    property int initNumberLength: 1000
    property int numberLength: 1000
    property int currentNumber: 0
    property int phase: 0
    property int numbersCount: 4
    property variant path1: [0.1, 0.3, 0.9, 0.3]
    property variant path2: [0.9, 0.3, 0.5, 0.8]
    property variant path3: [0.5, 0.8, 0.1, 0.3]
    property variant breathText: [qsTrId("breathe-in"), qsTrId("breathe-hold"), qsTrId("breathe-out")]


    breathSlider.onValueChanged: {numberLength = initNumberLength*(2.0-breathSlider.value); anim.restart(); phase=0; breathElement.opacity=1.0;
                                  path1AnimX.restart(); path2AnimX.stop(); path2AnimY.stop(); path3AnimX.stop(); path3AnimY.stop();
                                   path2AnimXR.stop(); path2AnimYR.stop(); path3AnimXR.stop(); path3AnimYR.stop();}
    onPhaseChanged: {phase=(phase > 5) ? 0 : phase;
                    if(phase==0){path1AnimX.start(); shape2.strokeColor="transparent"; shape3.strokeColor="transparent";}
                    else if(phase==1){path2AnimX.start(); path2AnimY.start();shape2.strokeColor="white";}
                    else if(phase==2){path3AnimX.start(); path3AnimY.start();shape3.strokeColor="white";}
                    else if(phase==3){path3AnimXR.start(); path3AnimYR.start();}
                    else if(phase==4){path2AnimXR.start(); path2AnimYR.start();}
                    else if(phase==5){path1AnimXR.start();}
                    breathElement.text = breathText[phase%3]; anim.restart();}


    NumberAnimation {running: true; id: path1AnimX; target: path1Element; property: "x"; from: path1[0]*sprite.width; to: path1[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path1AnimXR; target: path1Element; property: "x"; to: path1[0]*sprite.width; from: path1[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimX; target: path2Element; property: "x"; from: path2[0]*sprite.width; to: path2[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimY; target: path2Element; property: "y"; from: path2[1]*sprite.height; to: path2[3]*sprite.height; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimXR; target: path2Element; property: "x"; to: path2[0]*sprite.width; from: path2[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimYR; target: path2Element; property: "y"; to: path2[1]*sprite.height; from: path2[3]*sprite.height; duration: numberLength*numbersCount}
    NumberAnimation {id: path3AnimX; target: path3Element; property: "x"; from: path3[0]*sprite.width; to: path3[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path3AnimY; target: path3Element; property: "y"; from: path3[1]*sprite.height; to: path3[3]*sprite.height; duration: numberLength*numbersCount}
    NumberAnimation {id: path3AnimXR; target: path3Element; property: "x"; to: path3[0]*sprite.width; from: path3[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path3AnimYR; target: path3Element; property: "y"; to: path3[1]*sprite.height; from: path3[3]*sprite.height; duration: numberLength*numbersCount}
        SequentialAnimation {id: anim; loops: Animation.Infinite; running: true
                ScriptAction{script: {currentNumber=0;}}
                ParallelAnimation{ loops: 1
                    ScaleAnimator {target: breathElement; from: 0.7; to: 1.0; duration: numberLength*numbersCount}
                    SequentialAnimation{ loops: numbersCount
                        ScriptAction{script: {currentNumber++; number.text=currentNumber.toString();}}
                        ParallelAnimation{
                            ScaleAnimator {target: number; from: 1.0; to: 0.0; duration: numberLength}
                            OpacityAnimator {target: number; from: 0.5; to: 0.0; duration: numberLength; }
                    }}
                }
                ScriptAction{script: {phase++;}}
}}

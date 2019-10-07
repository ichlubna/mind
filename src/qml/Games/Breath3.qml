import QtQuick 2.12

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
                                  path1AnimX.stop(); path2AnimX.stop(); path2AnimY.stop(); path3AnimX.restart(); path3AnimY.restart();
                                   path2AnimXR.stop(); path2AnimYR.stop(); path3AnimXR.stop(); path3AnimYR.stop();}
    onPhaseChanged: {phase=(phase > 5) ? 0 : phase;
                    if(phase==0){path3AnimX.start(); path3AnimY.start(); shape1.strokeColor="transparent"; shape2.strokeColor="transparent";
                                shape1.startX=path1[0]*sprite.width; shape2.startX=path2[0]*sprite.width; shape2.startY=path2[1]*sprite.height; shape3.startX=path3[0]*sprite.width; shape3.startY=path3[1]*sprite.height;}
                    else if(phase==1){path1AnimX.start(); shape1.strokeColor="white";}
                    else if(phase==2){path2AnimX.start(); path2AnimY.start();shape2.strokeColor="white";}
                    else if(phase==3){path3AnimXR.start(); path3AnimYR.start();}
                    else if(phase==4){path1AnimXR.start(); }
                    else if(phase==5){path2AnimXR.start(); path2AnimYR.start();}
                    breathElement.text = breathText[phase%3];}


    NumberAnimation {id: path1AnimX; target: path1Element; property: "x"; from: path1[0]*sprite.width; to: path1[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path1AnimXR; target: shape1; property: "startX"; from: path1[0]*sprite.width; to: path1[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimX; target: path2Element; property: "x"; from: path2[0]*sprite.width; to: path2[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimY; target: path2Element; property: "y"; from: path2[1]*sprite.height; to: path2[3]*sprite.height; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimXR; target: shape2; property: "startX"; from: path2[0]*sprite.width; to: path2[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path2AnimYR; target: shape2; property: "startY"; from: path2[1]*sprite.height; to: path2[3]*sprite.height; duration: numberLength*numbersCount}
    NumberAnimation {running: true; id: path3AnimX; target: path3Element; property: "x"; from: path3[0]*sprite.width; to: path3[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {running: true; id: path3AnimY; target: path3Element; property: "y"; from: path3[1]*sprite.height; to: path3[3]*sprite.height; duration: numberLength*numbersCount}
    NumberAnimation {id: path3AnimXR; target: shape3; property: "startX"; from: path3[0]*sprite.width; to: path3[2]*sprite.width; duration: numberLength*numbersCount}
    NumberAnimation {id: path3AnimYR; target: shape3; property: "startY"; from: path3[1]*sprite.height; to: path3[3]*sprite.height; duration: numberLength*numbersCount}
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

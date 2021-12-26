import QtQuick

NumbersExerciseForm {
    submitButton.onClicked: {currentID++; if(currentID >= exercises.length) {currentID=0; end=true;}}
}

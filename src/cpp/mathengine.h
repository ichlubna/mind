#ifndef MATHENGINE_H
#define MATHENGINE_H

#include <QObject>
#include <QString>
#include <math.h>

class MathEngine : public QObject
{
    Q_OBJECT
public:
    explicit MathEngine(QObject *parent = nullptr);
    Q_INVOKABLE QString getNewExercise();
    Q_INVOKABLE bool submitResult(QString answer);
    Q_INVOKABLE float mathSin(float x) {return sin(x);}
    Q_INVOKABLE float mathRandom() {return static_cast<float>(rand()) / RAND_MAX;}

private:
    int a;
    int b;
    int result;
    enum Operation {ADD = 0, SUB, MUL, DIV};
    Operation operation;
};

#endif // MATHENGINE_H

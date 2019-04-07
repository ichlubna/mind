#ifndef MATHENGINE_H
#define MATHENGINE_H

#include <QObject>
#include <QString>

class MathEngine : public QObject
{
    Q_OBJECT
public:
    explicit MathEngine(QObject *parent = nullptr);
    Q_INVOKABLE QString getNewExercise();
    Q_INVOKABLE bool submitResult(QString answer);

private:
    int a;
    int b;
    int result;
    enum Operation {ADD = 0, SUB, MUL, DIV};
    Operation operation;
};

#endif // MATHENGINE_H

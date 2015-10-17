#ifndef DECLARATIVE_THEME_H
#define DECLARATIVE_THEME_H

#include <QObject>

class QQmlEngine;
class QJSEngine;

class DeclarativeTheme : public QObject {
  Q_OBJECT

public:
  static QObject *instance(QQmlEngine *engine, QJSEngine *scriptEngine);
  DeclarativeTheme(QObject *parent = 0);
};

#endif /* DECLARATIVE_THEME_H */

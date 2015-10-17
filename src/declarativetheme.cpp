#include "declarativetheme.h"

DeclarativeTheme::DeclarativeTheme(QObject *parent) :
  QObject(parent) {

}

QObject *DeclarativeTheme::instance(QQmlEngine *engine, QJSEngine *scriptEngine) {
  Q_UNUSED(engine);
  Q_UNUSED(scriptEngine);

  return new DeclarativeTheme;
}

#include "declarativetheme.h"

DeclarativeTheme::DeclarativeTheme(QObject *parent) :
  QObject(parent) {

}

QObject *DeclarativeTheme::instance(QQmlEngine *engine, QJSEngine *scriptEngine) {
  Q_UNUSED(engine);
  Q_UNUSED(scriptEngine);

  return new DeclarativeTheme;
}

QColor DeclarativeTheme::textColor() const {
  return Qt::gray;
}

QColor DeclarativeTheme::highlightTextColor() const {
  return Qt::darkGray;
}

QColor DeclarativeTheme::backgroundColor() const {
  return QColor(0, 255, 255, 50);
}

QColor DeclarativeTheme::highlightBackgroundColor() const {
  return QColor(0, 255, 255, 150);
}

int DeclarativeTheme::fontSize() const {
  return 18;
}

int DeclarativeTheme::fontSizeSmall() const {
  return 14;
}

int DeclarativeTheme::fontSizeLarge() const {
  return 24;
}

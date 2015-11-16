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
  return Qt::white;
}

QColor DeclarativeTheme::highlightTextColor() const {
  return Qt::yellow;
}

QColor DeclarativeTheme::backgroundColor() const {
  return QColor(255, 255, 0, 50);
}

QColor DeclarativeTheme::highlightBackgroundColor() const {
  return QColor(0, 255, 255, 150);
}

int DeclarativeTheme::fontSize() const {
  return 26;
}

int DeclarativeTheme::fontSizeSmall() const {
  return 22;
}

int DeclarativeTheme::fontSizeLarge() const {
  return 30;
}

qreal DeclarativeTheme::iconSize() const {
  return 64;
}

qreal DeclarativeTheme::iconSizeSmall() const {
  return 48;
}

qreal DeclarativeTheme::iconSizeLarge() const {
  return 80;
}

qreal DeclarativeTheme::itemSize() const {
  return 100;
}

/*
 * itemSizeSmall is enough for a single normal sized text
 */
qreal DeclarativeTheme::itemSizeSmall() const {
  return 36;
}

qreal DeclarativeTheme::itemSizeLarge() const {
  return 120;
}

qreal DeclarativeTheme::itemSizeNonClickable() const {
  return 5;
}

qreal DeclarativeTheme::paddingSize() const {
  return 10;
}

qreal DeclarativeTheme::paddingSizeSmall() const {
  return 5;
}

qreal DeclarativeTheme::paddingSizeLarge() const {
  return 20;
}

qreal DeclarativeTheme::animationDurationFast() const {
  return 100;
}

qreal DeclarativeTheme::animationDuration() const {
  return 500;
}

qreal DeclarativeTheme::animationDurationSlow() const {
  return 1000;
}

qreal DeclarativeTheme::actionThreshold() const {
  return 100;
}

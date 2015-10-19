#ifndef DECLARATIVE_THEME_H
#define DECLARATIVE_THEME_H

#include <QObject>
#include <QColor>

class QQmlEngine;
class QJSEngine;

class DeclarativeTheme : public QObject {
  Q_OBJECT
  Q_PROPERTY(QColor textColor READ textColor NOTIFY colorsChanged);
  Q_PROPERTY(QColor highlightTextColor READ highlightTextColor NOTIFY colorsChanged);
  Q_PROPERTY(QColor backgroundColor READ backgroundColor NOTIFY colorsChanged);
  Q_PROPERTY(QColor highlightBackgroundColor READ highlightBackgroundColor NOTIFY colorsChanged);
  Q_PROPERTY(int fontSize READ fontSize NOTIFY fontSizeChanged);
  Q_PROPERTY(int fontSizeSmall READ fontSizeSmall NOTIFY fontSizeChanged);
  Q_PROPERTY(int fontSizeLarge READ fontSizeLarge NOTIFY fontSizeChanged);
  Q_PROPERTY(qreal iconSize READ iconSize NOTIFY iconSizeChanged);
  Q_PROPERTY(qreal iconSizeSmall READ iconSizeSmall NOTIFY iconSizeChanged);
  Q_PROPERTY(qreal iconSizeLarge READ iconSizeLarge NOTIFY iconSizeChanged);
  Q_PROPERTY(qreal itemSize READ itemSize NOTIFY itemSizeChanged);
  Q_PROPERTY(qreal itemSizeSmall READ itemSizeSmall NOTIFY itemSizeChanged);
  Q_PROPERTY(qreal itemSizeLarge READ itemSizeLarge NOTIFY itemSizeChanged);
  Q_PROPERTY(qreal paddingSize READ paddingSize NOTIFY paddingSizeChanged);
  Q_PROPERTY(qreal paddingSizeSmall READ paddingSizeSmall NOTIFY paddingSizeChanged);
  Q_PROPERTY(qreal paddingSizeLarge READ paddingSizeLarge NOTIFY paddingSizeChanged);
  Q_PROPERTY(qreal animationDuration READ animationDuration NOTIFY animationDurationChanged);
  Q_PROPERTY(qreal actionThreshold READ actionThreshold NOTIFY actionThresholdChanged);

public:
  static QObject *instance(QQmlEngine *engine, QJSEngine *scriptEngine);
  DeclarativeTheme(QObject *parent = 0);

  QColor textColor() const;
  QColor highlightTextColor() const;
  QColor backgroundColor() const;
  QColor highlightBackgroundColor() const;

  int fontSize() const;
  int fontSizeSmall() const;
  int fontSizeLarge() const;

  qreal iconSize() const;
  qreal iconSizeSmall() const;
  qreal iconSizeLarge() const;

  qreal itemSize() const;
  qreal itemSizeSmall() const;
  qreal itemSizeLarge() const;

  qreal paddingSize() const;
  qreal paddingSizeSmall() const;
  qreal paddingSizeLarge() const;

  qreal animationDuration() const;
  qreal actionThreshold() const;

signals:
  void colorsChanged();
  void fontSizeChanged();
  void iconSizeChanged();
  void itemSizeChanged();
  void paddingSizeChanged();
  void animationDurationChanged();
  void actionThresholdChanged();
};

#endif /* DECLARATIVE_THEME_H */

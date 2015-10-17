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
  Q_PROPERTY(qreal fontSizeSmall READ fontSizeSmall NOTIFY fontSizeChanged);
  Q_PROPERTY(qreal fontSizeLarge READ fontSizeLarge NOTIFY fontSizeChanged);

public:
  static QObject *instance(QQmlEngine *engine, QJSEngine *scriptEngine);
  DeclarativeTheme(QObject *parent = 0);

  QColor textColor() const;
  QColor highlightTextColor() const;
  QColor backgroundColor() const;
  QColor highlightBackgroundColor() const;

  int fontSize() const;
  qreal fontSizeSmall() const;
  qreal fontSizeLarge() const;

signals:
  void colorsChanged();
  void fontSizeChanged();
};

#endif /* DECLARATIVE_THEME_H */

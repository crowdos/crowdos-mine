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

public:
  static QObject *instance(QQmlEngine *engine, QJSEngine *scriptEngine);
  DeclarativeTheme(QObject *parent = 0);

  QColor textColor() const;
  QColor highlightTextColor() const;
  QColor backgroundColor() const;
  QColor highlightBackgroundColor() const;

signals:
  void colorsChanged();
};

#endif /* DECLARATIVE_THEME_H */

#ifndef DECLARATIVE_SCREEN_H
#define DECLARATIVE_SCREEN_H

#include <QObject>

class QScreen;
class QQmlEngine;
class QJSEngine;

class DeclarativeScreen : public QObject {
  Q_OBJECT
  Q_PROPERTY(int width READ width CONSTANT);
  Q_PROPERTY(int height READ height CONSTANT);
  Q_PROPERTY(qreal qpiX READ dpiX CONSTANT);
  Q_PROPERTY(qreal dpiY READ dpiY CONSTANT);

public:
  static QObject *instance(QQmlEngine *engine, QJSEngine *scriptEngine);

  DeclarativeScreen(QObject *parent = 0);
  ~DeclarativeScreen();

  int width() const;
  int height() const;
  qreal dpiX() const;
  qreal dpiY() const;

private:
  QScreen *m_screen;
};

#endif /* DECLARATIVE_SCREEN_H */

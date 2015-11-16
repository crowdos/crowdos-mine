#include "declarativescreen.h"
#include <QGuiApplication>
#include <QScreen>

QObject *DeclarativeScreen::instance(QQmlEngine *engine, QJSEngine *scriptEngine) {
  Q_UNUSED(engine);
  Q_UNUSED(scriptEngine);

  return new DeclarativeScreen;
}

DeclarativeScreen::DeclarativeScreen(QObject *parent) :
  QObject(parent),
  m_screen(QGuiApplication::primaryScreen()) {

}

DeclarativeScreen::~DeclarativeScreen() {
  m_screen = 0;
}

int DeclarativeScreen::width() const {
  return m_screen->size().width();
}

int DeclarativeScreen::height() const {
  return m_screen->size().height();
}

qreal DeclarativeScreen::dpiX() const {
  return m_screen->physicalDotsPerInchX();
}

qreal DeclarativeScreen::dpiY() const {
  return m_screen->physicalDotsPerInchY();
}

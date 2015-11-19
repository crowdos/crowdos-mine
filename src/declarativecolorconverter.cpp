#include "declarativecolorconverter.h"

DeclarativeColorConverter::DeclarativeColorConverter(QObject *parent) :
  QObject(parent) {

}

DeclarativeColorConverter::~DeclarativeColorConverter() {

}

QColor DeclarativeColorConverter::color() const {
  return m_color;
}

void DeclarativeColorConverter::setColor(const QColor& color) {
  if (m_color != color) {
    m_color = color;
    emit colorChanged();
  }
}

qreal DeclarativeColorConverter::red() const {
  return m_color.red();
}

qreal DeclarativeColorConverter::green() const {
  return m_color.green();
}

qreal DeclarativeColorConverter::blue() const {
  return m_color.blue();
}

qreal DeclarativeColorConverter::hue() const {
  return m_color.hue();
}

qreal DeclarativeColorConverter::saturation() const {
  return m_color.saturation();
}

qreal DeclarativeColorConverter::value() const {
  return m_color.value();
}

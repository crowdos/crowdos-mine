#ifndef DECLARATIVE_COLOR_CONVERTER_H
#define DECLARATIVE_COLOR_CONVERTER_H

#include <QObject>
#include <QColor>

class DeclarativeColorConverter : public QObject {
  Q_OBJECT
  Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged);
  Q_PROPERTY(qreal red READ red NOTIFY colorChanged);
  Q_PROPERTY(qreal green READ green NOTIFY colorChanged);
  Q_PROPERTY(qreal blue READ blue NOTIFY colorChanged);
  Q_PROPERTY(qreal hue READ hue NOTIFY colorChanged);
  Q_PROPERTY(qreal saturation READ saturation NOTIFY colorChanged);
  Q_PROPERTY(qreal value READ value NOTIFY colorChanged);

public:
  DeclarativeColorConverter(QObject *parent = 0);
  ~DeclarativeColorConverter();

  QColor color() const;
  void setColor(const QColor& color);

  qreal red() const;
  qreal green() const;
  qreal blue() const;
  qreal hue() const;
  qreal saturation() const;
  qreal value() const;

signals:
  void colorChanged();

private:
  QColor m_color;
};

#endif /* DECLARATIVE_COLOR_CONVERTER_H */

#ifndef DECLARATIVE_ICON_H
#define DECLARATIVE_ICON_H

#include <QQuickItem>
#include <QImage>

class DeclarativeIcon : public QQuickItem {
  Q_OBJECT
  Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged);

public:
  DeclarativeIcon(QQuickItem *parent = 0);
  ~DeclarativeIcon();

  QString source() const;
  void setSource(const QString& source);

protected:
  void componentComplete();
  void geometryChanged(const QRectF& newGeometry, const QRectF& oldGeometry);
  QSGNode *updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *updatePaintNodeData);

signals:
  void sourceChanged();

private:
  void loadImage();

  QString m_source;
  QImage m_image;
  bool m_updateImage;
};

#endif /* DECLARATIVE_ICON_H */

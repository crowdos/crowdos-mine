#include "declarativeicon.h"
#include <QImageReader>
#include <QQmlInfo>
#include <QSGSimpleTextureNode>
#include <QQuickWindow>

DeclarativeIcon::DeclarativeIcon(QQuickItem *parent) :
  QQuickItem(parent),
  m_updateImage(false) {

  setFlag(ItemHasContents, true);
}

DeclarativeIcon::~DeclarativeIcon() {

}

QString DeclarativeIcon::source() const {
  return m_source;
}

void DeclarativeIcon::setSource(const QString& source) {
  if (m_source != source) {
    m_source = source;
    emit sourceChanged();
    qDebug() << m_source;
    loadImage();
  }
}

void DeclarativeIcon::loadImage() {
  if (!isComponentComplete()) {
    return;
  }

  if (width() <= 0 || height() <= 0) {
    return;
  }

  if (m_source.isEmpty()) {
    m_image = QImage();
    m_updateImage = true;
    update();
    return;
  }

  // TODO: thene lookup
  QImageReader r(m_source);
  r.setScaledSize(QSize(width(), height()));

  m_image = r.read();
  if (m_image.isNull()) {
    qmlInfo(this) << "Failed to load " << m_source << ": " << r.errorString();
    m_image = QImage(width(), height(), QImage::Format_RGB16);
    m_image.fill(Qt::red);
  }

  m_updateImage = true;

  update();
}

void DeclarativeIcon::componentComplete() {
  QQuickItem::componentComplete();

  loadImage();
}

void DeclarativeIcon::geometryChanged(const QRectF& newGeometry, const QRectF& oldGeometry) {
  QQuickItem::geometryChanged(newGeometry, oldGeometry);

  loadImage();
}

QSGNode *DeclarativeIcon::updatePaintNode(QSGNode *oldNode,
					  UpdatePaintNodeData *updatePaintNodeData) {
  Q_UNUSED(updatePaintNodeData);

  delete oldNode;
  oldNode = 0;

  if (m_updateImage) {
    QSGTexture *texture = window()->createTextureFromImage(m_image);
    m_image = QImage();

    QSGSimpleTextureNode *node = new QSGSimpleTextureNode;
    node->setOwnsTexture(true);
    node->setRect(QRectF(0, 0, width(), height()));
    node->setTexture(texture);
    texture->setFiltering(QSGTexture::Nearest);
    texture->setHorizontalWrapMode(QSGTexture::ClampToEdge);
    texture->setVerticalWrapMode(QSGTexture::ClampToEdge);

    oldNode = node;
  }

  return oldNode;
}

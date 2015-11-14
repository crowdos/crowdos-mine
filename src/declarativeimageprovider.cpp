#include "declarativeimageprovider.h"
#include <QDebug>

// TODO: this is a hack for now

DeclarativeImageProvider::DeclarativeImageProvider() :
  QQuickImageProvider(QQmlImageProviderBase::Image) {

}

DeclarativeImageProvider::~DeclarativeImageProvider() {

}

QImage DeclarativeImageProvider::requestImage(const QString& id, QSize *size,
					      const QSize& requestedSize) {
  QStringList parts = id.split("?");

  if (parts.isEmpty()) {
    return QImage();
  }

  if (requestedSize.width() == 0 || requestedSize.height() == 0) {
    return QImage();
  }

  QImage img(requestedSize, QImage::Format_RGB32);

  img.fill(parts.size() > 1 ? QColor(parts[1]) : Qt::green);
  qDebug() << id << size << requestedSize;
  return img;
}

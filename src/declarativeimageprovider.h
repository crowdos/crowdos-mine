#ifndef DECLARATIVE_IMAGE_PROVIDER_H
#define DECLARATIVE_IMAGE_PROVIDER_H

#include <QQuickImageProvider>

class DeclarativeImageProvider : public QQuickImageProvider {
public:
  DeclarativeImageProvider();
  ~DeclarativeImageProvider();

  QImage requestImage(const QString& id, QSize *size, const QSize& requestedSize);
};

#endif /* DECLARATIVE_IMAGE_PROVIDER_H */

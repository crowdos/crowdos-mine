#include "declarativeplugin.h"
#include <QtQml>
#include <QQmlEngine>
#include "qrangemodel.h"
#include "pagestatus.h"
#include "declarativetheme.h"
#include "declarativeimageprovider.h"

#define URI   "Crowd.Mine"
#define MAJOR 1
#define MINOR 0

DeclarativePlugin::DeclarativePlugin(QObject *parent) :
  QQmlExtensionPlugin(parent) {

}

void DeclarativePlugin::registerTypes(const char *uri) {
  Q_ASSERT(uri == QLatin1String(URI));

  qmlRegisterType<QRangeModel>(URI, MAJOR, MINOR, "RangeModel");
  qmlRegisterUncreatableType<PageStatus>(URI, MAJOR, MINOR, "PageStatus", "");
  qmlRegisterSingletonType<DeclarativeTheme>(URI, MAJOR, MINOR, "Theme",
					     DeclarativeTheme::instance);
}

void DeclarativePlugin::initializeEngine(QQmlEngine *engine, const char *uri) {
  Q_ASSERT(uri == QLatin1String(URI));

  engine->addImageProvider("theme", new DeclarativeImageProvider);
}

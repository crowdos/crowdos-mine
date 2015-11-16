#include "declarativeplugin.h"
#include <QtQml>
#include <QQmlEngine>
#include "qrangemodel.h"
#include "pagestatus.h"
#include "declarativetheme.h"
#include "declarativeimageprovider.h"
#include "minversemousearea.h"
#include "declarativestack.h"
#include "declarativescreen.h"

#define URI   "Crowd.Mine"
#define MAJOR 1
#define MINOR 0

DeclarativePlugin::DeclarativePlugin(QObject *parent) :
  QQmlExtensionPlugin(parent) {

}

void DeclarativePlugin::registerTypes(const char *uri) {
  Q_UNUSED(uri);

  Q_ASSERT(uri == QLatin1String(URI));

  qmlRegisterType<MInverseMouseArea>(URI, MAJOR, MINOR, "InverseMouseArea");
  qmlRegisterType<DeclarativeStack>(URI, MAJOR, MINOR, "Stack");
  qmlRegisterType<QRangeModel>(URI, MAJOR, MINOR, "RangeModel");
  qmlRegisterUncreatableType<PageStatus>(URI, MAJOR, MINOR, "PageStatus", "");
  qmlRegisterSingletonType<DeclarativeTheme>(URI, MAJOR, MINOR, "Theme",
					     DeclarativeTheme::instance);
  qmlRegisterSingletonType<DeclarativeScreen>(URI, MAJOR, MINOR, "Screen",
					      DeclarativeScreen::instance);
}

void DeclarativePlugin::initializeEngine(QQmlEngine *engine, const char *uri) {
  Q_UNUSED(uri);

  Q_ASSERT(uri == QLatin1String(URI));

  engine->addImageProvider("theme", new DeclarativeImageProvider);
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>
#include <QWebChannel>
#include <QWebSocketServer>

#include <QDateTime>
#include <QDebug>

#include "ChannelObj.h"
#include "websocketclientwrapper.h"
#include "websockettransport.h"

// key
// 53c0507c269e4614d71edb3a78bc1e21
// 包含了webengine，我这配置问题需要先qmake一下
int main(int argc, char *argv[])
{
    qDebug()<<"init:"<<QDateTime::currentDateTime();

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // 因为5.13的在线文档没了，所以我没法判断，请自己查下文档
#if (QT_VERSION >= QT_VERSION_CHECK(5,14,0))
    // 有些情况可能需要soft opengl，但我用了之后样式主题不能渲染了，报gpu相关错误
    //QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    //QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    // webengine须初始化，5.12放在app构造后，5.15放在构造前
    QtWebEngine::initialize();
    QGuiApplication app(argc, argv);
#else
    // 5.12提示Attribute Qt::AA_ShareOpenGLContexts must be set before QCoreApplication is created
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    // 有些情况可能需要soft opengl
    //QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    // webengine须初始化，5.12放在app构造后，5.15放在构造前
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();
#endif

    // webchannel初始化
    // setup the QWebSocketServer
    QWebSocketServer server(QStringLiteral("QWebChannel"), QWebSocketServer::NonSecureMode);
    if (!server.listen(QHostAddress::LocalHost, 12345)) {
        qFatal("Failed to open web socket server.");
        return 1;
    }
    // wrap WebSocket clients in QWebChannelAbstractTransport objects
    WebSocketClientWrapper clientWrapper(&server);
    // setup the channel
    QWebChannel channel;
    QObject::connect(&clientWrapper, &WebSocketClientWrapper::clientConnected,
                     &channel, &QWebChannel::connectTo);
    // setup the obj and publish it to the QWebChannel
    ChannelObj chobj;
    channel.registerObject(QStringLiteral("chobj"), &chobj);

    QQmlApplicationEngine engine;
    //单例--路径
    engine.rootContext()->setContextProperty("appDirPath", QGuiApplication::applicationDirPath());
    engine.rootContext()->setContextProperty("chObj", &chobj);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    qDebug()<<"exec:"<<QDateTime::currentDateTime();

    return app.exec();
}

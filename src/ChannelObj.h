#ifndef CHANNELOBJ_H
#define CHANNELOBJ_H

#include <QObject>

//参照Qt webchannel demo
//那两个websocket类文件也是直接copy的
class ChannelObj : public QObject
{
    Q_OBJECT
public:
    explicit ChannelObj(QObject *parent = 0);

signals:
    void sendText(const QString &str);
    void consoleText(const QString &str);
    void consoleZoom(int mapZoom);

public slots:
    void recvText(const QString &str);
    void recvZoom(int mapZoom);
};

#endif // CHANNELOBJ_H

#include "ChannelObj.h"

#include <QDebug>

ChannelObj::ChannelObj(QObject *parent) : QObject(parent)
{

}

void ChannelObj::recvText(const QString &str)
{
    qDebug()<<"recv:"<<str;
    emit consoleText(str);
}

void ChannelObj::recvZoom(int mapZoom)
{
    emit consoleZoom(mapZoom);
}

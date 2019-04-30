/****************************************************************************
** Meta object code from reading C++ file 'ChannelObj.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../src/ChannelObj.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ChannelObj.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ChannelObj_t {
    QByteArrayData data[9];
    char stringdata0[75];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ChannelObj_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ChannelObj_t qt_meta_stringdata_ChannelObj = {
    {
QT_MOC_LITERAL(0, 0, 10), // "ChannelObj"
QT_MOC_LITERAL(1, 11, 8), // "sendText"
QT_MOC_LITERAL(2, 20, 0), // ""
QT_MOC_LITERAL(3, 21, 3), // "str"
QT_MOC_LITERAL(4, 25, 11), // "consoleText"
QT_MOC_LITERAL(5, 37, 11), // "consoleZoom"
QT_MOC_LITERAL(6, 49, 7), // "mapZoom"
QT_MOC_LITERAL(7, 57, 8), // "recvText"
QT_MOC_LITERAL(8, 66, 8) // "recvZoom"

    },
    "ChannelObj\0sendText\0\0str\0consoleText\0"
    "consoleZoom\0mapZoom\0recvText\0recvZoom"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ChannelObj[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x06 /* Public */,
       4,    1,   42,    2, 0x06 /* Public */,
       5,    1,   45,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       7,    1,   48,    2, 0x0a /* Public */,
       8,    1,   51,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::Int,    6,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::Int,    6,

       0        // eod
};

void ChannelObj::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ChannelObj *_t = static_cast<ChannelObj *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sendText((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->consoleText((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->consoleZoom((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->recvText((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->recvZoom((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (ChannelObj::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&ChannelObj::sendText)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (ChannelObj::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&ChannelObj::consoleText)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (ChannelObj::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&ChannelObj::consoleZoom)) {
                *result = 2;
                return;
            }
        }
    }
}

const QMetaObject ChannelObj::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ChannelObj.data,
      qt_meta_data_ChannelObj,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ChannelObj::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ChannelObj::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ChannelObj.stringdata0))
        return static_cast<void*>(const_cast< ChannelObj*>(this));
    return QObject::qt_metacast(_clname);
}

int ChannelObj::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void ChannelObj::sendText(const QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ChannelObj::consoleText(const QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void ChannelObj::consoleZoom(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_END_MOC_NAMESPACE

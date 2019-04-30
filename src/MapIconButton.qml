import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: root_myiconbutton
    property alias imgSrc:image.source ;
    property alias imgHeight:image.height ;
    property alias txt:label.text ;
    property int index: 0
    property bool selected: false;

    signal iconButtonClicked(int item_idx);

    width: 36
    height: 40
    color: selected?"#189492":"transparent"
    opacity: mouse_area.pressed? 0.5 : 1

    Image {
        id:image
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter

        height: 17
    }
    Label{
        id:label
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        anchors.horizontalCenter: image.horizontalCenter

        font.pixelSize: 12
        font.family: "Microsoft YaHei UI"
        //font.bold: true
        color: "#2adede"
    }

    MouseArea{
        id:mouse_area
        anchors.fill: parent

        onClicked: {
            iconButtonClicked(index);
            //selected=true;
        }
    }
}


/*ListView{
    anchors.fill:parent
    anchors.leftMargin: 5
    spacing: 2
    orientation:ListView.Horizontal

    model: ListModel{
        ListElement{
            ele_src: "qrc:/resource/map_icon_jiequ.png"
            ele_width: 42
            ele_txt:"街区图"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_quanlan.png"
            ele_width: 36
            ele_txt:"全览"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_manyou.png"
            ele_width: 36
            ele_txt:"漫游"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_fangda.png"
            ele_width: 36
            ele_txt:"放大"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_suoxiao.png"
            ele_width: 36
            ele_txt:"缩小"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_suofang.png"
            ele_width: 36
            ele_txt:"缩放"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_quanlan.png"
            ele_width: 42
            ele_txt:"方位角"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_manyou.png"
            ele_width: 36
            ele_txt:"距离"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_fangda.png"
            ele_width: 36
            ele_txt:"面积"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_suoxiao.png"
            ele_width: 36
            ele_txt:"点选"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_suofang.png"
            ele_width: 36
            ele_txt:"框选"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_manyou.png"
            ele_width: 60
            ele_txt:"矩形区域"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_fangda.png"
            ele_width: 65
            ele_txt:"多边形区域"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_suoxiao.png"
            ele_width: 42
            ele_txt:"点移动"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_suofang.png"
            ele_width: 36
            ele_txt:"截图"
        }
        ListElement{
            ele_src: "qrc:/resource/map_icon_quanlan.png"
            ele_width: 42
            ele_txt:"行政区"
        }
    }
    delegate: MapIconButton{
        anchors.verticalCenter: parent.verticalCenter
        imgSrc: ele_src
        width: ele_width
        txt:ele_txt
    }
}*/

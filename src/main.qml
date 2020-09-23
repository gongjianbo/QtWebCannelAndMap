import QtQuick 2.9
import QtQuick.Window 2.9

import QtQuick.Controls 2.9
import QtWebEngine 1.2

//测试webengine 以及 webchannel
Window {
    id: root_window
    visible: true
    width: 800
    height: 500
    title: qsTr("高德地图-在线（by：龚建波1992  qq群：647637553）")

    property int selectedIndex: 0
    //gaode pc zooms[3,18]
    //property int mapZoom: 10

    //背景
    Image{
        anchors.fill:parent
        source: "qrc:/resource/map_base.png"
    }

    //操作栏
    Rectangle{
        id: map_area
        anchors.fill: parent
        anchors.margins: 20
        anchors.topMargin: 50
        border.width: 1
        border.color: "green"
        color: "transparent"
        z:map_browser.z+1

        Rectangle{
            id: head_bar

            height: 50
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: parent.border.width

            color:"transparent"
            Image{
                anchors.fill:parent
                source: "qrc:/resource/map_tool_base.png"
            }

            //这里完全可以用listview之类的来完成
            Row{
                id: head_row
                anchors.fill: parent
                anchors.leftMargin: 5
                //anchors.margins: 5
                spacing: 2

                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_jiequ.png"
                    width: 42
                    txt:"街区图"

                    index: 0
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                        //mapZoom=18;
                        map_browser.runJavaScript("window.showStreet()");
                    }
                }

                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_quanlan.png"
                    txt:"全览"

                    index: 1
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                        //mapZoom=3;
                        //zoom设为最小？？
                        map_browser.runJavaScript("window.showAll()");
                    }
                }

                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_manyou.png"
                    txt:"漫游"

                    index: 2
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                        //可以拖动地图？？
                        map_browser.runJavaScript("window.setFly()");
                    }
                }

                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_fangda.png"
                    txt:"放大"

                    index: 3
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index;
                        //gaode pc zooms[3,18]
                        map_browser.runJavaScript("window.changeMapZoom('add')");
                    }
                }

                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_suoxiao.png"
                    txt:"缩小"

                    index: 4
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                        //gaode pc zooms[3,18]
                        map_browser.runJavaScript("window.changeMapZoom('sub')");
                    }
                }

                MapIconButton {
                    id: map_scale
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_suofang.png"
                    txt:"缩放"

                    index: 5
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index;
                        //手动选择zoom
                        map_scale_set.open();
                    }
                }

                Popup{
                    id: map_scale_set
                    height: 40
                    width: 200
                    x: map_scale.x
                    y: map_scale.y+map_scale.height+10
                    modal: false
                    focus: true
                    background: Rectangle{
                        anchors.fill: parent
                        color:"#189492"
                        /*color:"transparent"
                        border.width: 1
                        border.color: "#189492"
                        Image{
                            anchors.fill:parent
                            source: "qrc:/resource/map_tool_base.png"
                        }*/
                        MouseArea{
                            anchors.fill: parent
                            cursorShape:Qt.PointingHandCursor
                        }
                    }

                    Text{
                        id: map_scale_text
                        width: 40
                        height: parent.height
                        anchors.left: parent.left
                        anchors.top: parent.top
                        text: Math.round(map_scale_slider.value)
                        font.pixelSize: 12
                        font.family: "Microsoft YaHei UI"
                        //font.bold: true
                        color: "black"
                    }

                    Slider{
                        id: map_scale_slider
                        height: parent.height

                        anchors.right: parent.right
                        anchors.left: map_scale_text.right
                        anchors.top: parent.top
                        from:3
                        to:18
                        value:10
                        stepSize: 1

                        onValueChanged: {
                            map_browser.runJavaScript("window.setMapZoom("+Math.round(map_scale_slider.value)+")");
                        }
                    }

                    onVisibleChanged: {
                        //console.log("set visibility:",visible)
                        if(visible){
                            map_browser.runJavaScript("window.sendZoomToApp()");
                        }
                    }
                }

                Rectangle{
                    //分隔线
                    anchors.verticalCenter: parent.verticalCenter
                    width: 1
                    height: 34
                    color: "#2adede"
                }

                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_fangweijiao.png"
                    width: 42
                    txt:"方位角"

                    index: 6
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                    }
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_ceju.png"
                    txt:"距离"

                    index: 7
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                        map_browser.runJavaScript("window.drawLine()");
                    }
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_mianji.png"
                    txt:"面积"

                    index: 8
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                        map_browser.runJavaScript("window.drawArea()");
                    }
                }
                Rectangle{
                    anchors.verticalCenter: parent.verticalCenter
                    width: 1
                    height: 34
                    color: "#2adede"
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_dianxuan.png"
                    txt:"点选"

                    index: 9
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index;
                        map_browser.runJavaScript("window.showPoint()");
                    }
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_kuangxuan.png"
                    txt:"框选"

                    index: 10
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index;
                        map_browser.runJavaScript("window.showRect()");
                    }
                }
                Rectangle{
                    anchors.verticalCenter: parent.verticalCenter
                    width: 1
                    height: 34
                    color: "#2adede"
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_juxing.png"
                    txt:"矩形区域"
                    width: 60

                    index: 11
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                    }
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_duobian.png"
                    txt:"多边形区域"
                    width: 65

                    index: 12
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                    }
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_yidong.png"
                    width: 42
                    txt:"点移动"

                    index: 13
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                    }
                }
                Rectangle{
                    anchors.verticalCenter: parent.verticalCenter
                    width: 1
                    height: 34
                    color: "#2adede"
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_jietu.png"
                    txt:"截图"

                    index: 14
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                    }
                }
                MapIconButton {
                    anchors.verticalCenter: parent.verticalCenter
                    imgSrc: "qrc:/resource/map_icon_xingzhengqu.png"
                    width: 42
                    txt:"行政区"

                    index: 15
                    selected: root_window.selectedIndex==index
                    onIconButtonClicked: {
                        root_window.selectedIndex=index
                    }
                }
            }
        }

        Component.onCompleted: {
            /*var head_list=head_row.children;
            for(var idx in head_list){
                if(head_list[idx].width!==1){
                    head_list[idx].index=idx;
                    head_list[idx].iconButtonClicked.connect(function(item_idx){
                        selectedIndex=item_idx;
                        for(var idx2 in head_list){
                            if(head_list[idx2].width!==1){
                                head_list[idx2].selected=false;
                            }
                        }
                        head_list[item_idx].selected=true;
                    });
                }
            }*/
            chObj.consoleText.connect(function(value){
                console.log("qml recv:",value);
            }
            );
            chObj.consoleZoom.connect(function(value){
                map_scale_slider.value=value;
            }
            );
        }

        Rectangle{
            id: foot_bar

            height: 50
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: parent.border.width

            color:"transparent"
            Image{
                anchors.fill:parent
                source: "qrc:/resource/map_tool_base.png"
            }

            Row{
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10
            }
        }
    }

    //web显示高德地图
    WebEngineView{
        id: map_browser
        anchors.fill: parent
        //加载的页面地址
        url:"file:///"+appDirPath+"/GaodeMap/index.html"
        //页面跳转
        onNewViewRequested: request.openIn(webview)
        //允许加载flash等插件
        settings.pluginsEnabled:true
    }

    //重新加载-按钮
    Button{
        id: reload
        width: 90
        height: 30

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5

        text: "reload"
        onClicked: map_browser.reload();
    }
}

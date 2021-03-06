#-------------------------------------------------
#
# Project created by QtCreator 2017-11-04T22:51:29
#
#-------------------------------------------------

QT       += core gui
CONFIG += c++11 object_parallel_to_source

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = RFMTestAppGUI
TEMPLATE = app

linux {
    contains(QMAKE_CXX, .*raspbian.*arm.*):{
        LIBS += -L$$[QT_SYSROOT]/usr/local/lib/ -lbcm2835
        message("Raspberry")
    }
}


target.path = /home/pi/
INSTALLS += target


INCLUDEPATH += $$[QT_SYSROOT]/usr/local/include

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    crfmtransmitterhandler.cpp \
    cgpioevent.cpp \
    datapacketsender.cpp \
    helper.cpp \
    command.cpp \
    transmittercontrolpanel.cpp \
    applicationcontroller.cpp \
    receivercontrolpanel.cpp \
    creceiverhandler.cpp

linux {
    contains(QMAKE_CXX, .*raspbian.*arm.*):{
        SOURCES += CBroadcomPinout.cpp
    }else{
        SOURCES += CBroadcomPinoutDummy.cpp
    }
}


HEADERS += \
    ipinout.h \
    CBroadcomPinout.h \
    crfmtransmitterhandler.h \
    cgpioevent.h \
    constants.h \
    datapacketsender.h \
    helper.h \
    command.h \
    transmittercontrolpanel.h \
    applicationcontroller.h \
    receivercontrolpanel.h \
    creceiverhandler.h

FORMS += \
    transmittercontrolpanel.ui \
    receivercontrolpanel.ui

OTHER_FILES +=


include(Commands/Commands.pri)
include(Commands/Transmitter/Transmitter.pri)
include(Commands/Receiver/Receiver.pri)

DISTFILES += \
    Readme.md

#! /bin/sh

# http://lemirep.wordpress.com/2013/06/01/deploying-qt-applications-on-linux-and-windows-3/
export LD_LIBRARY_PATH=$(pwd)/qt4/i386/lib
export QT_ACCESSIBILITY=0
./peb-qt4
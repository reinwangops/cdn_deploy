#!/bin/bash

#SRC_PATH=/home/development/front
SRC_PATH=/home/development/new_h5/replace_prod
PRD_PATH=/home/nginx/web/replace
PKG_NAME=cdndist.zip
SRC_NAME=dist
tartime=`date "+%Y%m%d_%H%M%S"`

#check backup dir
if [ ! -d "$SRC_PATH/pc_backup" ]; then
  mkdir $SRC_PATH/pc_backup
fi

#check nginx dir
if [ ! -d "$PRD_PATH" ]; then
  mkdir $PRD_PATH
fi

#copy && backup
\cp -rf $SRC_PATH/$PKG_NAME $PRD_PATH
\cp -rf $SRC_PATH/$PKG_NAME $SRC_PATH/pc_backup/$PKG_NAME\_$tartime

#rollbackneed && update
cd $PRD_PATH
rm -rf bk-pc
\mv -f pc bk-pc
unzip $PKG_NAME
\mv -f $SRC_NAME pc
rm -rf  pc/index.html

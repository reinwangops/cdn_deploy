#!/bin/bash

#SRC_PATH=/home/development/front
SRC_PATH=/home/development/new_h5/replace_prod
PRD_PATH=/home/nginx/web/replace
PKG_NAME=distcdn.zip
SRC_NAME=distcdn
tartime=`date "+%Y%m%d_%H%M%S"`

#check backup dir
if [ ! -d "$SRC_PATH/h5_backup" ]; then
  mkdir $SRC_PATH/h5_backup
fi

#check nginx dir
if [ ! -d "$PRD_PATH" ]; then
  mkdir $PRD_PATH
fi

#copy && backup
\cp -rf $SRC_PATH/$PKG_NAME $PRD_PATH
\cp -rf $SRC_PATH/$PKG_NAME $SRC_PATH/h5_backup/$PKG_NAME\_$tartime

#rollbackneed && update
cd $PRD_PATH
rm -rf bk-h5
\mv -f h5 bk-h5
unzip $PKG_NAME
\mv -f $SRC_NAME h5
rm -rf  h5/index.html

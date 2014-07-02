#!/bin/sh

zerofill()
{

  FILE=$1/zerofree_deleteme
  echo "zero-ing out with FILE=${FILE}"
  echo Creating temporary file: $FILE
  dd if=/dev/zero of=$FILE
  rm -Rf $FILE
  echo $FILE created and deleted...
}

zerofill /tmp
zerofill /u01

mount -n -o ro,remount -t etx2 /dev/sdb1 /u01
/sbin/zerofree /dev/sdb1

mount -n -o ro,remount -t ext2 /dev/mapper/VolGroup-lv_root /
/sbin/zerofree /dev/mapper/VolGroup-lv_root

halt
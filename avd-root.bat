@echo off
cd /d %~dp0
adb root
adb push bb\%1\busybox /data/local/busybox
adb shell "chmod 755 /data/local/busybox"
adb shell "/data/local/busybox mount -o rw,remount /system"
adb shell "/data/local/busybox --install -s /system/xbin"
adb shell "rm -r /system/media/audio"
adb push su\%1\bin\su /system/bin/su
adb shell "chown 0:0 /system/bin/su"
adb shell "chmod 6755 /system/bin/su"
adb install su\%1\app\Superuser.apk
import 'dart:io';

enum PlatformType { android, ios, windows, linux, macos, fuchsia }

bool get isAndroid => Platform.isAndroid;
bool get isIos => Platform.isIOS;
bool get isWindows => Platform.isWindows;
bool get isLinux => Platform.isLinux;
bool get isMacOs => Platform.isMacOS;
bool get isFuchsia => Platform.isFuchsia;

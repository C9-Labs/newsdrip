lin# Newsdrip
Simple News App with ability to switch from Multiple News Sources with a Single Click.

Supported Platforms include Linux, MacOS, Windows and iOS

Supported Arch:
 - x86
 - amd64
 - armhf
 - arm64/aarch64


##   Some Screenshots
![image](https://github.com/user-attachments/assets/dcdee28b-2f01-4534-86eb-3fba79ec805b)


## Releases
Checkout Pre-Built Binary in [Releases](https://github.com/C9-Labs/newsdrip/releases)

Windows(x64): [newsdrip_windows_x64.zip ](https://github.com/C9-Labs/newsdrip/releases/download/v1.1/newsdrip_windows_x64.zip)

Windows (ARM): Have Windows for ARM? [Open Issue](https://github.com/C9-Labs/newsdrip/issues/new?body=Support%20requested%20for%20windows%20for%20ARM&title=Feat:%20arm32%20Support%20Required&labels=immediate&)

Android: [newsdrip_android.apk](https://github.com/C9-Labs/newsdrip/releases/download/v1.1/newsdrip_android.apk)

Linux: [newsdrip_linux_x64.zip](https://github.com/C9-Labs/newsdrip/releases/download/v1.1/newsdrip_linux_x64.zip)

Linux (arm64): [newsdrip_linux_arm64.zip](https://github.com/C9-Labs/newsdrip/releases/download/v1.1/newsdrip_linux_arm64.zip)

Linux(armv6/armv7): Have armv6/armv7? [Open Issue](https://github.com/C9-Labs/newsdrip/issues/new?body=Support%20requested%20for%20armv6/armv7&title=Feat:%20arm32%20Support%20Required&labels=immediate&)

MacOS: [Help Required]

iOS: [Help Required]

## Development Status (Rolling)
[![Linux CI](https://github.com/C9-Labs/newsdrip/actions/workflows/linux.yml/badge.svg)](https://github.com/C9-Labs/newsdrip/actions/workflows/linux.yml)
[![Linux ARM CI](https://github.com/C9-Labs/newsdrip/actions/workflows/linux-arm.yml/badge.svg)](https://github.com/C9-Labs/newsdrip/actions/workflows/linux-arm.yml)
[![Android CI](https://github.com/C9-Labs/newsdrip/actions/workflows/android.yml/badge.svg)](https://github.com/C9-Labs/newsdrip/actions/workflows/android.yml)
[![Windows CI](https://github.com/C9-Labs/newsdrip/actions/workflows/windows.yml/badge.svg)](https://github.com/C9-Labs/newsdrip/actions/workflows/windows.yml)

## Getting Started with Developmet
Clone This Git Repo Into Your Directory

``` 
git clone https://github.com/c9-labs/newsdrip.git
```

Install Dependencices ```* Required for Linux ```
```
apt install cmake clang ninja-build libgtk-3-dev
```

Run Project by Attaching Device
``` 
flutter run <device name>
```
## New to Flutter ?
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

Newsdrip utilises [api2.news](https://api2.news) API to retrive various headlines.

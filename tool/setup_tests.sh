#!/bin/bash

wget "https://raw.githubusercontent.com/isar/isar/main/CORE_VERSION" -O .dart_tool/ISAR_VERSION
core_version=$(cat .dart_tool/ISAR_VERSION)
github="https://github.com/isar/isar-core/releases/download/${core_version:5}"

wget "${github}/isar_windows_x64.dll" -O .dart_tool/isar_windows_x64.dll
wget "${github}/libisar_macos_x64.dylib" -O .dart_tool/libisar_macos_x64.dylib
wget "${github}/libisar_linux_x64.so" -O .dart_tool/libisar_linux_x64.so

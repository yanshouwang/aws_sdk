#include "include/aws_sdk_windows/aws_sdk_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "aws_sdk_windows_plugin.h"

void AwsSdkWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  aws_sdk_windows::AwsSdkWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

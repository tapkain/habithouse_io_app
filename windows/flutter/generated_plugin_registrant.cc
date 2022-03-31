//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <catcher/catcher_plugin.h>
#include <isar_flutter_libs/isar_flutter_libs_plugin.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <sentry_flutter/sentry_flutter_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CatcherPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CatcherPlugin"));
  IsarFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("IsarFlutterLibsPlugin"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
  SentryFlutterPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SentryFlutterPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}

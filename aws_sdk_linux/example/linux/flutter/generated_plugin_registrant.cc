//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <aws_sdk_linux/aws_sdk_linux_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) aws_sdk_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AwsSdkLinuxPlugin");
  aws_sdk_linux_plugin_register_with_registrar(aws_sdk_linux_registrar);
}

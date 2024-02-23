//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <encrypto_flutter/encrypto_flutter_plugin_c_api.h>
#include <local_auth_windows/local_auth_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  EncryptoFlutterPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("EncryptoFlutterPluginCApi"));
  LocalAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("LocalAuthPlugin"));
}

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aws_sdk_linux_method_channel.dart';

abstract class AwsSdkLinuxPlatform extends PlatformInterface {
  /// Constructs a AwsSdkLinuxPlatform.
  AwsSdkLinuxPlatform() : super(token: _token);

  static final Object _token = Object();

  static AwsSdkLinuxPlatform _instance = MethodChannelAwsSdkLinux();

  /// The default instance of [AwsSdkLinuxPlatform] to use.
  ///
  /// Defaults to [MethodChannelAwsSdkLinux].
  static AwsSdkLinuxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AwsSdkLinuxPlatform] when
  /// they register themselves.
  static set instance(AwsSdkLinuxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

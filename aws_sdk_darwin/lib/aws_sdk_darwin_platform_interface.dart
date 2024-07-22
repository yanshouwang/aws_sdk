import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aws_sdk_darwin_method_channel.dart';

abstract class AwsSdkDarwinPlatform extends PlatformInterface {
  /// Constructs a AwsSdkDarwinPlatform.
  AwsSdkDarwinPlatform() : super(token: _token);

  static final Object _token = Object();

  static AwsSdkDarwinPlatform _instance = MethodChannelAwsSdkDarwin();

  /// The default instance of [AwsSdkDarwinPlatform] to use.
  ///
  /// Defaults to [MethodChannelAwsSdkDarwin].
  static AwsSdkDarwinPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AwsSdkDarwinPlatform] when
  /// they register themselves.
  static set instance(AwsSdkDarwinPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

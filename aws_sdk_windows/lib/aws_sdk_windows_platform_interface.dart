import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aws_sdk_windows_method_channel.dart';

abstract class AwsSdkWindowsPlatform extends PlatformInterface {
  /// Constructs a AwsSdkWindowsPlatform.
  AwsSdkWindowsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AwsSdkWindowsPlatform _instance = MethodChannelAwsSdkWindows();

  /// The default instance of [AwsSdkWindowsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAwsSdkWindows].
  static AwsSdkWindowsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AwsSdkWindowsPlatform] when
  /// they register themselves.
  static set instance(AwsSdkWindowsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

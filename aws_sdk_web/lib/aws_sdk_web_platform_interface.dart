import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aws_sdk_web_method_channel.dart';

abstract class AwsSdkWebPlatform extends PlatformInterface {
  /// Constructs a AwsSdkWebPlatform.
  AwsSdkWebPlatform() : super(token: _token);

  static final Object _token = Object();

  static AwsSdkWebPlatform _instance = MethodChannelAwsSdkWeb();

  /// The default instance of [AwsSdkWebPlatform] to use.
  ///
  /// Defaults to [MethodChannelAwsSdkWeb].
  static AwsSdkWebPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AwsSdkWebPlatform] when
  /// they register themselves.
  static set instance(AwsSdkWebPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

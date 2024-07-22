import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aws_sdk_web_platform_interface.dart';

/// An implementation of [AwsSdkWebPlatform] that uses method channels.
class MethodChannelAwsSdkWeb extends AwsSdkWebPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('aws_sdk_web');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

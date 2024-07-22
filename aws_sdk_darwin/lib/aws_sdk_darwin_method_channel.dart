import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aws_sdk_darwin_platform_interface.dart';

/// An implementation of [AwsSdkDarwinPlatform] that uses method channels.
class MethodChannelAwsSdkDarwin extends AwsSdkDarwinPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('aws_sdk_darwin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

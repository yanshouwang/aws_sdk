import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aws_sdk_windows_platform_interface.dart';

/// An implementation of [AwsSdkWindowsPlatform] that uses method channels.
class MethodChannelAwsSdkWindows extends AwsSdkWindowsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('aws_sdk_windows');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

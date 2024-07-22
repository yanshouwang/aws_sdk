import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aws_sdk_linux_platform_interface.dart';

/// An implementation of [AwsSdkLinuxPlatform] that uses method channels.
class MethodChannelAwsSdkLinux extends AwsSdkLinuxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('aws_sdk_linux');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

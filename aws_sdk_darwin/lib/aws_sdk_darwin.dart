
import 'aws_sdk_darwin_platform_interface.dart';

class AwsSdkDarwin {
  Future<String?> getPlatformVersion() {
    return AwsSdkDarwinPlatform.instance.getPlatformVersion();
  }
}

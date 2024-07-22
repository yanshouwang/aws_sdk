
import 'aws_sdk_windows_platform_interface.dart';

class AwsSdkWindows {
  Future<String?> getPlatformVersion() {
    return AwsSdkWindowsPlatform.instance.getPlatformVersion();
  }
}

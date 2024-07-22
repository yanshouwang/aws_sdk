
import 'aws_sdk_linux_platform_interface.dart';

class AwsSdkLinux {
  Future<String?> getPlatformVersion() {
    return AwsSdkLinuxPlatform.instance.getPlatformVersion();
  }
}

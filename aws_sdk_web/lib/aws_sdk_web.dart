
import 'aws_sdk_web_platform_interface.dart';

class AwsSdkWeb {
  Future<String?> getPlatformVersion() {
    return AwsSdkWebPlatform.instance.getPlatformVersion();
  }
}

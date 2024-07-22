import 'package:flutter_test/flutter_test.dart';
import 'package:aws_sdk_linux/aws_sdk_linux.dart';
import 'package:aws_sdk_linux/aws_sdk_linux_platform_interface.dart';
import 'package:aws_sdk_linux/aws_sdk_linux_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAwsSdkLinuxPlatform
    with MockPlatformInterfaceMixin
    implements AwsSdkLinuxPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AwsSdkLinuxPlatform initialPlatform = AwsSdkLinuxPlatform.instance;

  test('$MethodChannelAwsSdkLinux is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAwsSdkLinux>());
  });

  test('getPlatformVersion', () async {
    AwsSdkLinux awsSdkLinuxPlugin = AwsSdkLinux();
    MockAwsSdkLinuxPlatform fakePlatform = MockAwsSdkLinuxPlatform();
    AwsSdkLinuxPlatform.instance = fakePlatform;

    expect(await awsSdkLinuxPlugin.getPlatformVersion(), '42');
  });
}

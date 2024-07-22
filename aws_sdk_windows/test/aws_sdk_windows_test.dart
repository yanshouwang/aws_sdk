import 'package:flutter_test/flutter_test.dart';
import 'package:aws_sdk_windows/aws_sdk_windows.dart';
import 'package:aws_sdk_windows/aws_sdk_windows_platform_interface.dart';
import 'package:aws_sdk_windows/aws_sdk_windows_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAwsSdkWindowsPlatform
    with MockPlatformInterfaceMixin
    implements AwsSdkWindowsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AwsSdkWindowsPlatform initialPlatform = AwsSdkWindowsPlatform.instance;

  test('$MethodChannelAwsSdkWindows is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAwsSdkWindows>());
  });

  test('getPlatformVersion', () async {
    AwsSdkWindows awsSdkWindowsPlugin = AwsSdkWindows();
    MockAwsSdkWindowsPlatform fakePlatform = MockAwsSdkWindowsPlatform();
    AwsSdkWindowsPlatform.instance = fakePlatform;

    expect(await awsSdkWindowsPlugin.getPlatformVersion(), '42');
  });
}

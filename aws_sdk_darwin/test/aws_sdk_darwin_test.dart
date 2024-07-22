import 'package:flutter_test/flutter_test.dart';
import 'package:aws_sdk_darwin/aws_sdk_darwin.dart';
import 'package:aws_sdk_darwin/aws_sdk_darwin_platform_interface.dart';
import 'package:aws_sdk_darwin/aws_sdk_darwin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAwsSdkDarwinPlatform
    with MockPlatformInterfaceMixin
    implements AwsSdkDarwinPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AwsSdkDarwinPlatform initialPlatform = AwsSdkDarwinPlatform.instance;

  test('$MethodChannelAwsSdkDarwin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAwsSdkDarwin>());
  });

  test('getPlatformVersion', () async {
    AwsSdkDarwin awsSdkDarwinPlugin = AwsSdkDarwin();
    MockAwsSdkDarwinPlatform fakePlatform = MockAwsSdkDarwinPlatform();
    AwsSdkDarwinPlatform.instance = fakePlatform;

    expect(await awsSdkDarwinPlugin.getPlatformVersion(), '42');
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:aws_sdk_web/aws_sdk_web.dart';
import 'package:aws_sdk_web/aws_sdk_web_platform_interface.dart';
import 'package:aws_sdk_web/aws_sdk_web_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAwsSdkWebPlatform
    with MockPlatformInterfaceMixin
    implements AwsSdkWebPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AwsSdkWebPlatform initialPlatform = AwsSdkWebPlatform.instance;

  test('$MethodChannelAwsSdkWeb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAwsSdkWeb>());
  });

  test('getPlatformVersion', () async {
    AwsSdkWeb awsSdkWebPlugin = AwsSdkWeb();
    MockAwsSdkWebPlatform fakePlatform = MockAwsSdkWebPlatform();
    AwsSdkWebPlatform.instance = fakePlatform;

    expect(await awsSdkWebPlugin.getPlatformVersion(), '42');
  });
}

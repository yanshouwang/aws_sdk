import 'package:aws_sdk_platform_interface/aws_sdk_platform_interface.dart';

import 'aws_client.dart';

final class AWSSDKAndroidPlugin extends AWSSDKPlugin {
  static void registerWith() {
    AWSSDKPlugin.instance = AWSSDKAndroidPlugin();
  }

  @override
  AWSClient createClient({
    required String endpoint,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  }) {
    return JAWSClient(
      endpoint: endpoint,
      region: region,
      credentialsProvider: credentialsProvider,
    );
  }
}

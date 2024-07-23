import 'package:aws_sdk_platform_interface/aws_sdk_platform_interface.dart';

import 'aws_client.dart';
import 'aws_credentials_provider.dart';

final class AWSSDKAndroidPlugin extends AWSSDKPlugin {
  static void registerWith() {
    AWSSDKPlugin.instance = AWSSDKAndroidPlugin();
  }

  @override
  AWSClient createClient({
    required Uri endpointUri,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  }) {
    return JAWSClient(
      endpointUri: endpointUri,
      region: region,
      credentialsProvider: credentialsProvider,
    );
  }

  @override
  AWSCredentialsProvider createStaticCredentialsProvider({
    required String accessKeyId,
    required String secretAccessKey,
    String? sessionToken,
  }) {
    return JAWSCredentialsProvider.static(
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      sessionToken: sessionToken,
    );
  }
}

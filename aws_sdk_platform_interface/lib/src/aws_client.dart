import 'aws_credentials_provider.dart';
import 'aws_sdk_plugin.dart';

abstract interface class AWSClient {
  Future<String> putObject({
    required String bucket,
    required String key,
    required String filePath,
  });

  factory AWSClient({
    required String endpoint,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  }) {
    return AWSSDKPlugin.instance.createClient(
      endpoint: endpoint,
      region: region,
      credentialsProvider: credentialsProvider,
    );
  }
}

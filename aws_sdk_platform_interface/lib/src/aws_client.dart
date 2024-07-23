import 'aws_credentials_provider.dart';
import 'aws_sdk_plugin.dart';

abstract interface class AWSClient {
  Future<String> putObject({
    required String bucket,
    required String key,
    required String filePath,
  });

  factory AWSClient({
    required Uri endpointUri,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  }) {
    return AWSSDKPlugin.instance.createClient(
      endpointUri: endpointUri,
      region: region,
      credentialsProvider: credentialsProvider,
    );
  }
}

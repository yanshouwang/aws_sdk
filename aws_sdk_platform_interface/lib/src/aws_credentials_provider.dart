import 'aws_sdk_plugin.dart';

abstract interface class AWSCredentialsProvider {
  factory AWSCredentialsProvider.static({
    required String accessKeyId,
    required String secretAccessKey,
    String? sessionToken,
  }) {
    return AWSSDKPlugin.instance.createStaticCredentialsProvider(
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      sessionToken: sessionToken,
    );
  }
}

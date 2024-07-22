import 'package:aws_sdk/aws_sdk.dart';

import 'oss_service.dart';

final class AWSService implements OSSService {
  final AWSClient _client;

  AWSService({
    required String endpoint,
    required String region,
    required String accessKeyId,
    required String secretAccessKey,
    String? sessioinToken,
  }) : _client = AWSClient(
          endpoint: endpoint,
          region: region,
          credentialsProvider: AWSCredentialsProvider(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            sessionToken: sessioinToken,
          ),
        );

  @override
  Future<String> upload({
    required String bucketName,
    required String filePath,
  }) async {
    final eTag = await _client.putObject(
      bucket: bucketName,
      key: filePath,
      filePath: filePath,
    );
    return eTag;
  }
}

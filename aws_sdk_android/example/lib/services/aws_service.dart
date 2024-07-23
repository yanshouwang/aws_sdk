import 'package:aws_sdk_platform_interface/aws_sdk_platform_interface.dart';

import 'oss_service.dart';

final class AWSService implements OSSService {
  final AWSClient _client;

  AWSService({
    required Uri endpointUri,
    required String region,
    required String accessKeyId,
    required String secretAccessKey,
    String? sessioinToken,
  }) : _client = AWSClient(
          endpointUri: endpointUri,
          region: region,
          credentialsProvider: AWSCredentialsProvider.static(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            sessionToken: sessioinToken,
          ),
        );

  @override
  Future<String> upload({
    required String bucket,
    required String key,
    required String filePath,
  }) async {
    final eTag = await _client.putObject(
      bucket: bucket,
      key: key,
      filePath: filePath,
    );
    return eTag;
  }
}

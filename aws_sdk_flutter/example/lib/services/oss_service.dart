import 'aws_service.dart';

abstract interface class OSSService {
  Future<String> upload({
    required String bucket,
    required String key,
    required String filePath,
  });

  factory OSSService.aws({
    required Uri endpointUri,
    required String region,
    required String accessKeyId,
    required String secretAccessKey,
    String? sessioinToken,
  }) {
    return AWSService(
      endpointUri: endpointUri,
      region: region,
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      sessioinToken: sessioinToken,
    );
  }
}

import 'aws_service.dart';

abstract interface class OSSService {
  Future<String> upload({
    required String bucketName,
    required String filePath,
  });

  factory OSSService.aws({
    required String endpoint,
    required String region,
    required String accessKeyId,
    required String secretAccessKey,
    String? sessioinToken,
  }) {
    return AWSService(
      endpoint: endpoint,
      region: region,
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      sessioinToken: sessioinToken,
    );
  }
}

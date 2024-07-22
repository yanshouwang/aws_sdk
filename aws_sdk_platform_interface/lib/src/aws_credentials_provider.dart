final class AWSCredentialsProvider {
  final String accessKeyId;
  final String secretAccessKey;
  final String? sessionToken;

  AWSCredentialsProvider({
    required this.accessKeyId,
    required this.secretAccessKey,
    this.sessionToken,
  });
}

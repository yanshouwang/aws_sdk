import 'package:aws_sdk_platform_interface/aws_sdk_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni/aws/sdk/kotlin/runtime/auth/credentials/_package.dart' as jni;
import 'jni/aws/sdk/kotlin/services/s3/_package.dart' as jni;
import 'jni/aws/sdk/kotlin/services/s3/model/_package.dart' as jni;
import 'jni/aws/smithy/kotlin/runtime/auth/awscredentials/_package.dart' as jni;
import 'jni/aws/smithy/kotlin/runtime/net/url/_package.dart' as jni;
import 'jni/java/io/_package.dart' as jni;
import 'jni.dart';

class JAWSClient implements AWSClient {
  late final jni.S3Client jniValue;

  JAWSClient({
    required String endpoint,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  }) : jniValue = _createS3Client(
          endpoint: endpoint,
          region: region,
          credentialsProvider: credentialsProvider,
        );

  @override
  Future<String> putObject({
    required String bucket,
    required String key,
    required String filePath,
  }) async {
    final requestBuilder = jni.PutObjectRequest_Builder()
      ..setBucket(bucket.toJString())
      ..setKey(key.toJString())
      ..setBody(jni.File(filePath.toJString()).asByteStream());
    final response = await jniValue.putObject(requestBuilder.build());
    final eTag = response.getETag();
    return eTag.toDartString();
  }
}

jni.S3Client _createS3Client({
  required String endpoint,
  required String region,
  required AWSCredentialsProvider credentialsProvider,
}) {
  final credentialsProviderBuilder = jni.StaticCredentialsProvider_Builder()
    ..setAccessKeyId(credentialsProvider.accessKeyId.toJString())
    ..setSecretAccessKey(credentialsProvider.secretAccessKey.toJString())
    ..setSessionToken(credentialsProvider.sessionToken?.toJString() ??
        JString.fromReference(jNullReference));
  final configBuilder = jni.S3Client_Config_Builder()
    ..setEndpointUrl(jni.Url.Companion.parse(
      endpoint.toJString(),
      jni.UrlEncoding.Companion.getAll(),
    ))
    ..setRegion(region.toJString())
    ..setCredentialsProvider(credentialsProviderBuilder
        .build()
        .castTo(jni.CredentialsProvider.type));
  final client = jni.S3Client_Builder().newClient(configBuilder.build());
  return client;
}

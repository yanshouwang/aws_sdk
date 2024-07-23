import 'package:aws_sdk_platform_interface/aws_sdk_platform_interface.dart';
import 'package:jni/jni.dart';

import 'aws_credentials_provider.dart';
import 'jni/aws/sdk/kotlin/services/s3/_package.dart' as jni;
import 'jni/aws/smithy/kotlin/runtime/net/url/_package.dart' as jni;
import 'jni/java/io/_package.dart' as jni;
import 'jni.dart';

class JAWSClient implements AWSClient {
  late final jni.S3Client jniValue;

  JAWSClient({
    required Uri endpointUri,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  }) : jniValue = buildS3Client(
          endpointUrl: jni.Url.Companion.parse(
            '$endpointUri'.toJString(),
            jni.UrlEncoding.Companion.getAll(),
          ),
          region: region.toJString(),
          credentialsProvider: credentialsProvider is JAWSCredentialsProvider
              ? credentialsProvider.jniValue
              : throw TypeError(),
        );

  @override
  Future<String> putObject({
    required String bucket,
    required String key,
    required String filePath,
  }) async {
    final request = buildPutObjectRequest(
      bucket: bucket.toJString(),
      key: key.toJString(),
      body: jni.File(filePath.toJString()).asByteStream(),
    );
    final response = await jniValue.putObject(request);
    final eTag = response.getETag();
    return eTag.toDartString();
  }
}

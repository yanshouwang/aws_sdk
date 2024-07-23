import 'package:jni/jni.dart';

import 'jni/aws/sdk/kotlin/runtime/auth/credentials/_package.dart' as jni;
import 'jni/aws/sdk/kotlin/services/s3/_package.dart' as jni;
import 'jni/aws/sdk/kotlin/services/s3/model/_package.dart' as jni;
import 'jni/aws/smithy/kotlin/runtime/auth/awscredentials/_package.dart' as jni;
import 'jni/aws/smithy/kotlin/runtime/content/_package.dart' as jni;
import 'jni/aws/smithy/kotlin/runtime/net/url/_package.dart' as jni;
import 'jni/java/io/_package.dart' as jni;

extension JFileX on jni.File {
  jni.ByteStream asByteStream() {
    return jni.asByteStream(this, 0, length() - 1);
  }
}

jni.CredentialsProvider buildStaticCredentialsProvider({
  required JString accessKeyId,
  required JString secretAccessKey,
  required JString sessionToken,
}) {
  final builder = jni.StaticCredentialsProvider_Builder()
    ..setAccessKeyId(accessKeyId)
    ..setSecretAccessKey(secretAccessKey)
    ..setSessionToken(sessionToken);
  return builder.build().castTo(jni.CredentialsProvider.type);
}

jni.S3Client_Config buildS3ClientConfig({
  required jni.Url endpointUrl,
  required JString region,
  required jni.CredentialsProvider credentialsProvider,
}) {
  final builder = jni.S3Client_Config_Builder()
    ..setEndpointUrl(endpointUrl)
    ..setRegion(region)
    ..setCredentialsProvider(credentialsProvider);
  final config = builder.build();
  return config;
}

jni.S3Client buildS3Client({
  required jni.Url endpointUrl,
  required JString region,
  required jni.CredentialsProvider credentialsProvider,
}) {
  final builder = jni.S3Client_Builder();
  final config = buildS3ClientConfig(
    endpointUrl: endpointUrl,
    region: region,
    credentialsProvider: credentialsProvider,
  );
  final client = builder.newClient(config);
  return client;
}

jni.PutObjectRequest buildPutObjectRequest({
  required JString bucket,
  required JString key,
  required jni.ByteStream body,
}) {
  final builder = jni.PutObjectRequest_Builder()
    ..setBucket(bucket)
    ..setKey(key)
    ..setBody(body);
  final request = builder.build();
  return request;
}

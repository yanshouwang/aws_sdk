import 'package:aws_sdk_platform_interface/aws_sdk_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.dart';
import 'jni/aws/smithy/kotlin/runtime/auth/awscredentials/_package.dart' as jni;

class JAWSCredentialsProvider implements AWSCredentialsProvider {
  final jni.CredentialsProvider jniValue;

  JAWSCredentialsProvider.static({
    required String accessKeyId,
    required String secretAccessKey,
    String? sessionToken,
  }) : jniValue = buildStaticCredentialsProvider(
          accessKeyId: accessKeyId.toJString(),
          secretAccessKey: secretAccessKey.toJString(),
          sessionToken: sessionToken?.toJString() ??
              JString.fromReference(jNullReference),
        );
}

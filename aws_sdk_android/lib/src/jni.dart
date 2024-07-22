import 'jni/aws/smithy/kotlin/runtime/content/_package.dart' as jni;
import 'jni/java/io/_package.dart' as jni;

extension JFileX on jni.File {
  jni.ByteStream asByteStream() {
    return jni.asByteStream(this, 0, length() - 1);
  }
}

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aws_client.dart';
import 'aws_credentials_provider.dart';

abstract base class AWSSDKPlugin extends PlatformInterface {
  /// Constructs a [AWSSDKPlugin].
  AWSSDKPlugin() : super(token: _token);

  static final Object _token = Object();

  static AWSSDKPlugin? _instance;

  /// The default instance of [AWSSDKPlugin] to use.
  ///
  /// Defaults to [MethodChannelAwsSdkAndroid].
  static AWSSDKPlugin get instance {
    final instance = _instance;
    if (instance == null) {
      throw UnimplementedError(
          'AWSSDKPlugin is not implemented on this platform.');
    }
    return instance;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AWSSDKPlugin] when
  /// they register themselves.
  static set instance(AWSSDKPlugin instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  AWSClient createClient({
    required String endpoint,
    required String region,
    required AWSCredentialsProvider credentialsProvider,
  });
}

import 'package:aws_sdk_example/services.dart';
import 'package:clover/clover.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';

class PutObjectViewModel extends ViewModel {
  final OSSService _ossService;
  bool _uploading;
  String? _uploadFilePath;

  PutObjectViewModel()
      : _ossService = OSSService.aws(
          endpoint: 'http://192.168.4.109:9010',
          region: 'us-east-1',
          accessKeyId: 'user_test',
          secretAccessKey: '12345678',
        ),
        _uploading = false,
        _uploadFilePath = null;

  String? get uploadFilePath => _uploadFilePath;
  bool get uploading => _uploading;

  void selectFile() async {
    if (uploading) {
      throw StateError('Can not select file when uploading.');
    }
    final file = await openFile();
    _uploadFilePath = file?.path;
    notifyListeners();
  }

  void uploadFile() async {
    final uploadFilePath = this.uploadFilePath;
    if (uploadFilePath == null) {
      throw ArgumentError.notNull('uploadFilePath');
    }
    if (uploading) {
      throw StateError('Can not upload file when uploading.');
    }
    _uploading = true;
    notifyListeners();
    try {
      final eTag = await _ossService.upload(
        bucketName: 'link-tenant',
        filePath: uploadFilePath,
      );
      debugPrint('uploaded: $eTag.');
    } finally {
      _uploading = false;
      notifyListeners();
    }
  }
}

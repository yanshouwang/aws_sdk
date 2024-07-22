import 'package:aws_sdk_example/view_models.dart';
import 'package:clover/clover.dart';
import 'package:flutter/material.dart';

class PutObjectView extends StatelessWidget {
  const PutObjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<PutObjectViewModel>(context);
    final uploading = viewModel.uploading;
    final uploadFilePath = viewModel.uploadFilePath;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Put Object'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('uploadFilePath: $uploadFilePath'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: uploading ? null : () => viewModel.selectFile(),
              child: const Text('Select'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: uploadFilePath == null || uploading
                  ? null
                  : () => viewModel.uploadFile(),
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, library_private_types_in_public_api, avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ButtonUpload extends StatefulWidget {
  const ButtonUpload({super.key});

  @override
  _ButtonUploadState createState() => _ButtonUploadState();
}

class _ButtonUploadState extends State<ButtonUpload> {
  String _fileText = "No file selected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text("Pick File"),
            ),
            Text(_fileText),
          ],
        ),
      ),
    );
  }

  void _pickFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        _fileText = "Selected File: ${file.path}";
      });
    } else {
      // User canceled the picker
      print("User canceled file picking");
    }
  } catch (e) {
    print("Error picking file: $e");
  }
}
}
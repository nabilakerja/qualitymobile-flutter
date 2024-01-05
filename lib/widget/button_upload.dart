// ignore_for_file: must_be_immutable, library_private_types_in_public_api, avoid_print, unused_field, prefer_final_fields

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ButtonUpload extends StatefulWidget {
  const ButtonUpload({super.key});

  @override
  _ButtonUploadState createState() => _ButtonUploadState();
}

class _ButtonUploadState extends State<ButtonUpload> {
  String _fileText = "No file selected";
  List<String> _filePaths = [];

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Upload a file",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                    ),
                    const Text("Image upload description",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            ),
                            textAlign: TextAlign.left,),
                            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(bottom: 15,right: 15,left: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,     
                ),
                borderRadius: BorderRadius.circular(12.0), 
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  _buildFilePickerButton(),
                  const SizedBox(height: 10,),
                  _buildSelectedFilesText(),
                ],
              ),
            )
          ],
        );
  }

  Widget _buildFilePickerButton() {
    return MaterialButton(
      height:40,
                onPressed: _pickFile,
                color: const Color.fromARGB(255, 219, 11, 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 219, 11, 11),
                        ),
                      ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_rounded,color: Color.fromARGB(255, 255, 255, 255)),
                    SizedBox(width: 15,),
                    Text("Select your files here",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  ],
                ),
    );
  }

  Widget _buildSelectedFilesText() {
    return Column(
      children: _filePaths.map((filePath) {
        return Text(
          "Selected File: $filePath",
          style: const TextStyle(color: Colors.black),
        );
      }).toList(),
    );
  }

  void _pickFile() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        List<String> filePaths =
            result.files.map((file) => file.path!).toList();
        setState(() {
          _filePaths = filePaths;
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
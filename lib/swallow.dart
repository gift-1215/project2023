import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Swallow extends StatefulWidget {
  const Swallow({super.key});

  @override
  State<Swallow> createState() => _SwallowState();
}

class _SwallowState extends State<Swallow> {
  String timeRemain = "2";
  bool isRecorded = false;

  PlatformFile? pickupFile;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickupFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'file/${pickupFile!.name}';
    final file = File(pickupFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '吞嚥聲錄音',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: selectFile,
            child: const Text("選擇檔案"),
          ),
          if (pickupFile != null)
            SizedBox(
              height: 50,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(pickupFile!.name),
                ),
              ),
            ),
          if (pickupFile != null)
            ElevatedButton(
              onPressed: uploadFile,
              child: const Text("吞嚥分析"),
            ),
          const Text("吞嚥指示"),
        ],
      )),
    );
  }
}

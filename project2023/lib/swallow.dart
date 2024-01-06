import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:project2023/main.dart';

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

  void _set() async {
    var x = int.parse(timeRemain);
    if (x != 0) {
      x = x - 1;
      timeRemain = x.toString();
      setState(() {});
      _count_down();
    } else {
      timeRemain = '2';
      isRecorded = true;
      setState(() {});
    }
  }

  Future _count_down() async {
    Timer(const Duration(seconds: 1), () {
      _set();
    });
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
            onPressed: () {},
            child: const Text("選擇檔案"),
          ),
          if (pickupFile != null)
            Expanded(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(pickupFile!.name),
                ),
              ),
            ),
          const Text("吞嚥指示"),
        ],
      )),
    );
  }
}

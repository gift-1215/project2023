import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'get_user_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2023/main.dart';
import 'dart:async';
import 'login.dart';

class PersonalInfoShow extends StatefulWidget {
  const PersonalInfoShow({super.key});

  @override
  State<PersonalInfoShow> createState() => _PersonalInfoShowState();
}

class _PersonalInfoShowState extends State<PersonalInfoShow> {
  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('$userEmail')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.id);
            }));
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$userEmail已登入',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 230,
            child: Column(
              children: [
                Expanded(
                    child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return GetUserName(documentId: docIDs[0],);

                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

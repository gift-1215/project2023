import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project2023/main.dart';

Future<bool> check_personal_info() async {
  await FirebaseFirestore.instance
      .collection('$userEmail')
      .get()
      .then((snapshot) => snapshot.docs.forEach((document) {
            if (document.exists)
              personalInfo = true;
            else
              personalInfo = false;

          }));
  ;
  print('personal info:');
  print(personalInfo);
  return personalInfo;
}

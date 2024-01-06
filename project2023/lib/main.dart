import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project2023/personal_info_show.dart';
import 'login.dart';
import 'other_resource.dart';
import 'personal_info.dart';
import 'swallow.dart';
import 'app_description.dart';
import 'videos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'check_personal_info.dart';

//global
bool login = false;
bool personalInfo = false;
String userEmail = 'user';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDYXhx90NcxKW2CQO1tQaxzM0MPMb4b8X0",
            appId: "1:102377783501:web:2eb9e31a643bd41f002984",
            messagingSenderId: "102377783501",
            projectId: "project2023-a3ac5"));
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swallow App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Swallow App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (login == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        } else {
                          personalInfo = await check_personal_info();

                          if (personalInfo == false) {
                            print('Login, without personal info');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PersonalInfo(),
                              ),
                            );
                          } else {
                            print('have personal info');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PersonalInfoShow(),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("個人資料"),
                    )),
                SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppDescription()),
                        );
                      },
                      child: const Text("App 簡介"),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("量表"),
                    )),
                SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (login == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Swallow(),
                            ),
                          );
                        }
                      },
                      child: const Text("吞嚥錄音"),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Videos()),
                        );
                      },
                      child: const Text("衛教影片"),
                    )),
                SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtherResource()),
                        );
                      },
                      child: const Text("其他資源"),
                    )),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

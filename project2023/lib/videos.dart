import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURLApp() async {
  var url = Uri.parse(
      "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Videos extends StatelessWidget {
  const Videos({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '衛教影片',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: _launchURLApp, child: Text("影片")),
          TextButton(onPressed: _launchURLApp, child: Text("影片2"))
        ],
      )),
    );
  }
}

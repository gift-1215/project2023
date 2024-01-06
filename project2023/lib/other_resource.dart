import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_TainanHealth() async {
  var url = Uri.parse(
      "https://health.tainan.gov.tw/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class OtherResource extends StatelessWidget {
  const OtherResource({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('其他資源連結',style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: _TainanHealth, child: Text("台南市衛生局")),
              TextButton(onPressed: _TainanHealth, child: Text("影片2"))
            ],
          )),
    );
  }
}

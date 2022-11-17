import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl() async {
  String _url_f = 'https://www.facebook.com/7oseiiny';

  if (!await launchUrl(Uri.parse(_url_f,),mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url_f';
  }
}//////////////////////////////////////////////////////////////////////////////
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Made By Ahmed Elhoseiny',style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*.07
            )),
            SizedBox(height: 30,),
            IconButton(onPressed: _launchUrl, icon: Icon(Icons.facebook,color: Colors.blue,size: 30,))
          ],
        ),
      ),
    );
  }
}

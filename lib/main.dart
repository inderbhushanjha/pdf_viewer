import 'package:flutter/material.dart';
import 'agreement_viewer.dart';
import 'appbar.dart';
import 'download.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                // Read agreement button logic
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Agreement(
                                path: 'assets/agreements/dummy.pdf',
                                location: 'assets',
                              )))
                },
                child: const Text('Read Agreement'),
              ),
              ElevatedButton(
                // Download button logic
                onPressed: () => {
                  print("download clicked"),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DownloadFile()))
                },
                child: const Text('Download Agreement'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

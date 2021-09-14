import 'package:agreement/appbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// I've used SfPdfViewer library to view pdf

class Agreement extends StatelessWidget {
  final String path;
  final String location;
  const Agreement({required this.path, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        //TODO : logic to use different location
        child: SfPdfViewer.asset('assets/agreements/dummy.pdf'),
      ),
    );
  }
}

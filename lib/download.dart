import 'package:agreement/appbar.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFile extends StatelessWidget {
  var imageUrl =
      "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
  bool downloading = true;
  String downloadingStr = "No data";
  String savePath = "";

  Future downloadFile() async {
    try {
      Dio dio = Dio();

      String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);

      savePath = await getFilePath(fileName);
      await dio.download(imageUrl, savePath,
          onReceiveProgress: (rec, total) {});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: downloading
            ? Container(
                height: 250,
                width: 250,
                child: Card(
                  color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        downloadingStr,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: 250,
                width: 250,
                child: Center(
                  child: Image.file(
                    File(savePath),
                    height: 200,
                  ),
                ),
              ),
      ),
    );
  }
}

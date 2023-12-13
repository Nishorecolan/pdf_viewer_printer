
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_example/safe_area_bg_color_example.dart';

class SafeAreaWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return
      SafeArea(
        top: false,
        bottom: false,
      child:
      Scaffold(
        appBar: AppBar(
          title: const Text('Safe Area - POC'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        // body: Image.network('https://hotpot.ai/designs/thumbnails/splash-screen/10.jpg'),
        // body: Image.network('https://googleflutter.com/sample_image.jpg'),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/bulb.jpg"),
        fit: BoxFit.cover,
        ),
        ),
      )
    ));
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_example/safe_area_image_example.dart';

class SafeAreaWithBGColor extends StatelessWidget{

  Widget build(BuildContext context){
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.yellow, // Status bar background color
    //     statusBarIconBrightness: Brightness.light, // Status bar icon color (light for white)
    //   ),
    // );
    // return AnnotatedRegion<SystemUiOverlayStyle>(
    //     value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.orange),
    //     child: SafeArea(
    //     top: false,
    //     bottom: false,
    //     child:
    //     Scaffold(
    //       backgroundColor: Colors.blue,
    //       appBar: AppBar(
    //         title: const Text('Safe Area - POC'),
    //         leading: IconButton(
    //           icon: Icon(Icons.arrow_back, color: Colors.white),
    //           onPressed: () => Navigator.of(context).pop(),
    //         ),
    //
    //       ),
    //       body:  Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             ElevatedButton(
    //
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) =>  SafeAreaWithImage()));
    //                 },
    //                 child: const Text('Safe area with background Images', style: TextStyle(color: Colors.white), )),
    //
    //           ],
    //         ),
    //       ),
    //     )
    // )
    // );
    return
      SafeArea(
          // top: true,
          bottom: false,
      child:
      Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Safe Area - POC'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // SystemChrome.setSystemUIOverlayStyle(
            //   SystemUiOverlayStyle(
            //     statusBarColor: Colors.transparent, // Status bar background color
            //     statusBarIconBrightness: Brightness.dark, // Status bar icon color (light for white)
            //   ),
            // );

            Future.delayed(Duration(milliseconds: 1)).then(
                    (value) => SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent, // Status bar background color
                        statusBarIconBrightness: Brightness.dark, // Status bar icon color (light for white)
                      ),
                    ));
            Navigator.of(context).pop();
          } ,
        ),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SafeAreaWithImage()));
                },
                child: const Text('Safe area with background Images', style: TextStyle(color: Colors.white), )),

          ],
        ),
      ),
    )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_example/safe_area_bg_color_example.dart';
import 'package:pdf_example/safe_area_image_example.dart';
import 'package:pdf_example/timer_example.dart';
import 'pdf_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return const MaterialApp(
      title: 'POC',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   title: const Text('POC'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {


                  SystemChrome.setSystemUIOverlayStyle(
                    const SystemUiOverlayStyle(
                      statusBarColor: Colors.orange,
                      statusBarIconBrightness:
                      Brightness.light, // Change to Brightness.light if needed
                    ),
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PdfExample()));
                },
                child: const Text('PDF Viewer')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CountDownTimer()));
                },
                child: const Text('Timer')),

            ElevatedButton(
                onPressed: () {

                  // SystemChrome.setSystemUIOverlayStyle(
                  //   const SystemUiOverlayStyle(
                  //     statusBarColor: Colors.green,
                  //     statusBarIconBrightness:
                  //     Brightness.dark, // Change to Brightness.light if needed
                  //   ),
                  // );

                  Future.delayed(Duration(milliseconds: 1)).then(
                          (value) =>   SystemChrome.setSystemUIOverlayStyle(
                            const SystemUiOverlayStyle(
                              statusBarColor: Colors.green,
                              statusBarIconBrightness:
                              Brightness.dark, // Change to Brightness.light if needed
                            ),
                          ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SafeAreaWithBGColor()));
                },
                child: const Text('Safe Area')),
          ],
        ),
      ),
    );
  }
}


//Balloon tool tip

class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  // Path? getInnerPath(Rect rect, { TextDirection? textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx + x / 2, rect.bottomCenter.dy)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(-x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  // void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }
}





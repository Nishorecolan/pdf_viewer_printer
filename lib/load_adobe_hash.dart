import 'package:flutter/material.dart';

class LoadAdobeHashView extends StatefulWidget {
  const LoadAdobeHashView({super.key});

  @override
  State<LoadAdobeHashView> createState() => _LoadAdobeHashViewState();
}

class _LoadAdobeHashViewState extends State<LoadAdobeHashView> {
  static const API_KEY = String.fromEnvironment('API_KEY');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Load Adobe Hash Id'),
          automaticallyImplyLeading: true,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
        ),
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Adobe Hash value from flutter : $API_KEY'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

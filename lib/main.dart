import 'dart:convert';
import 'dart:io';

import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_example/pdf_viewer.dart';
import 'package:pdf_example/safe_area_bg_color_example.dart';
import 'package:pdf_example/safe_area_image_example.dart';
import 'package:pdf_example/timer_example.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:printing/printing.dart';
import 'pdf_example.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyAppPDF());
}


class MyAppBG1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'PDF viewer with Zoom',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            flexibleSpace: Container(decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(205, 193, 255, 1.0),
                  Color.fromARGB(255, 252, 99, 99),
                  Color.fromARGB(255, 173, 41, 1),
                ],
              ),
            ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(Icons.close),
              ),

            ],
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: 250,
                  // color: Colors.transparent,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(205, 193, 255, 1.0),
                        Color.fromARGB(255, 252, 99, 99),
                        Color.fromARGB(255, 173, 41, 1),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                      10,
                      AppBar().preferredSize.height +
                          MediaQuery.of(context).viewPadding.top,
                      10,
                      0),
                  child: Center(
                    child: Column(
                      children: [

                        ///Header
                        Column(
                          children: [
                            Text(
                              "NYL Header Title",
                              style: TextStyle(color: Colors.white, fontSize: 32),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.orange,
                ),

                Container(
                  height: 100,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ));
  }
}


class MyAppCollapsingToolBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Center(
            child: Text("Sample Text"),
          ),
        ),
      ),
    );

  }
}


class SliverAppBarInitiallyTried extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Material(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: MySliverAppBar(expandedHeight: 250),
                pinned: true,
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container( height: MediaQuery.of(context).size.height, )),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [

        Container(decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(205, 193, 255, 1.0),
              Color.fromARGB(255, 252, 99, 99),
              Color.fromARGB(255, 173, 41, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              leading: Icon(Icons.arrow_back),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'App Bar Gradient BG',
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              flexibleSpace: Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(205, 193, 255, 1.0),
                    Color.fromARGB(255, 252, 99, 99),
                    Color.fromARGB(255, 173, 41, 1),
                  ],
                ),
              ),),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.close),
                ),

              ],
            ),

          ],
        ),
        ),
        Center(
          child: Opacity(
           // opacity: shrinkOffset / expandedHeight,
            opacity: 0.8,
            child: Text(
              "My Sliver AppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),

      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}


//////////////
////////////////////// PLUGINS //////////////////////
///////////// DraggableHome plugin //////////////////
class DraggableHome1 extends StatelessWidget {
  const DraggableHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: "Draggable Home",
    home: HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Draggable Home"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        listView(),
      ],
      fullyStretchable: false,
    //  expandedBody: Container(),
      backgroundColor: Colors.white,
      appBarColor: Colors.teal,

    );
  }

  Row headerBottomBarWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
        ),
      ),
    );
  }
}

///////////// DraggableHome plugin //////////////////


/////PDF ////
class MyAppPDF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title:  Text(
            'PDF viewer with Zoom',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
            centerTitle: true,
            flexibleSpace: Container(decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(205, 193, 255, 1.0),
                  Color.fromARGB(255, 252, 99, 99),
                  Color.fromARGB(255, 173, 41, 1),
                ],
              ),
            ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.print,color: Colors.white, ),
                onPressed: () {
                  printPdf();
                },
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Padding(
            padding: const EdgeInsets.only(top:  100.0),
            child: MainPage(),
          )
        ));
  }
  Future<void> printPdf() async {
    String base64String = "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IDY2NiA1MDAgXQovRm9udERlc2NyaXB0b3IgNTQgMCBSCi9Ub1VuaWNvZGUgNTUgMCBSCj4+CmVuZG9iagoKNTcgMCBvYmoKPDwvRjEgNTYgMCBSCj4+CmVuZG9iagoKNTggMCBvYmoKPDwvRm9udCA1NyAwIFIKL1hPYmplY3Q8PC9UcjE0IDE0IDAgUi9UcjE5IDE5IDAgUi9UcjI0IDI0IDAgUi9UcjI5IDI5IDAgUi9UcjM0IDM0IDAgUi9UcjM5IDM5IDAgUi9UcjQgNCAwIFIvVHI0NCA0NCAwIFIKL1RyNDkgNDkgMCBSL1RyOSA5IDAgUj4+Ci9FeHRHU3RhdGU8PC9FR1MxMCAxMCAwIFIvRUdTMTUgMTUgMCBSL0VHUzIwIDIwIDAgUi9FR1MyNSAyNSAwIFIvRUdTMzAgMzAgMCBSL0VHUzM1IDM1IDAgUi9FR1M0MCA0MCAwIFIvRUdTNDUgNDUgMCBSCi9FR1M1IDUgMCBSL0VHUzUwIDUwIDAgUj4+Ci9Qcm9jU2V0Wy9QREYvVGV4dC9JbWFnZUMvSW1hZ2VJL0ltYWdlQl0KPj4KZW5kb2JqCgoxIDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDIgMCBSPj4KZW5kb2JqCgo2IDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDcgMCBSPj4KZW5kb2JqCgoxMSAwIG9iago8PC9UeXBlL1BhZ2UvUGFyZW50IDUxIDAgUi9SZXNvdXJjZXMgNTggMCBSL01lZGlhQm94WzAgMCAyODMgNDMyXS9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQi9JIHRydWU+Pi9Db250ZW50cyAxMiAwIFI+PgplbmRvYmoKCjE2IDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDE3IDAgUj4+CmVuZG9iagoKMjEgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCA1MSAwIFIvUmVzb3VyY2VzIDU4IDAgUi9NZWRpYUJveFswIDAgMjgzIDQzMl0vR3JvdXA8PC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VSR0IvSSB0cnVlPj4vQ29udGVudHMgMjIgMCBSPj4KZW5kb2JqCgoyNiAwIG9iago8PC9UeXBlL1BhZ2UvUGFyZW50IDUxIDAgUi9SZXNvdXJjZXMgNTggMCBSL01lZGlhQm94WzAgMCAyODMgNDMyXS9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQi9JIHRydWU+Pi9Db250ZW50cyAyNyAwIFI+PgplbmRvYmoKCjMxIDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDMyIDAgUj4+CmVuZG9iagoKMzYgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCA1MSAwIFIvUmVzb3VyY2VzIDU4IDAgUi9NZWRpYUJveFswIDAgMjgzIDQzMl0vR3JvdXA8PC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VSR0IvSSB0cnVlPj4vQ29udGVudHMgMzcgMCBSPj4KZW5kb2JqCgo0MSAwIG9iago8PC9UeXBlL1BhZ2UvUGFyZW50IDUxIDAgUi9SZXNvdXJjZXMgNTggMCBSL01lZGlhQm94WzAgMCAyODMgNDMyXS9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQi9JIHRydWU+Pi9Db250ZW50cyA0MiAwIFI+PgplbmRvYmoKCjQ2IDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDQ3IDAgUj4+CmVuZG9iagoKNTEgMCBvYmoKPDwvVHlwZS9QYWdlcwovUmVzb3VyY2VzIDU4IDAgUgovTWVkaWFCb3hbIDAgMCAyODMgNDMyIF0KL0tpZHNbIDEgMCBSIDYgMCBSIDExIDAgUiAxNiAwIFIgMjEgMCBSIDI2IDAgUiAzMSAwIFIgMzYgMCBSIDQxIDAgUiA0NiAwIFIgXQovQ291bnQgMTA+PgplbmRvYmoKCjU5IDAgb2JqCjw8L1R5cGUvQ2F0YWxvZy9QYWdlcyA1MSAwIFIKL09wZW5BY3Rpb25bMSAwIFIgL1hZWiBudWxsIG51bGwgMF0KL0xhbmcoZW4tR0IpCj4+CmVuZG9iagoKNjAgMCBvYmoKPDwvQ3JlYXRvcjxGRUZGMDA1NzAwNzIwMDY5MDA3NDAwNjUwMDcyPgovUHJvZHVjZXI8RkVGRjAwNEMwMDY5MDA2MjAwNzIwMDY1MDA0RjAwNjYwMDY2MDA2OTAwNjMwMDY1MDAyMDAwMzQwMDJFMDAzMT4KL0NyZWF0aW9uRGF0ZShEOjIwMTQwNzAzMTUyNDA0KzAxJzAwJyk+PgplbmRvYmoKCnhyZWYKMCA2MQowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAwMTQ4NDYgMDAwMDAgbiAKMDAwMDAwMDAxOSAwMDAwMCBuIAowMDAwMDAwMjc5IDAwMDAwIG4gCjAwMDAwMDAyOTkgMDAwMDAgbiAKMDAwMDAwMDQ3NyAwMDAwMCBuIAowMDAwMDE0OTkwIDAwMDAwIG4gCjAwMDAwMDA1MTcgMDAwMDAgbiAKMDAwMDAwMDY5MSAwMDAwMCBuIAowMDAwMDAwNzExIDAwMDAwIG4gCjAwMDAwMDA4ODkgMDAwMDAgbiAKMDAwMDAxNTEzNCAwMDAwMCBuIAowMDAwMDAwOTMwIDAwMDAwIG4gCjAwMDAwMDExMDYgMDAwMDAgbiAKMDAwMDAwMTEyNyAwMDAwMCBuIAowMDAwMDAxMzA2IDAwMDAwIG4gCjAwMDAwMTUyODAgMDAwMDAgbiAKMDAwMDAwMTM0NyAwMDAwMCBuIAowMDAwMDAxNTE5IDAwMDAwIG4gCjAwMDAwMDE1MzkgMDAwMDAgbiAKMDAwMDAwMTcxOCAwMDAwMCBuIAowMDAwMDE1NDI2IDAwMDAwIG4gCjAwMDAwMDE3NTkgMDAwMDAgbiAKMDAwMDAwMTkzNSAwMDAwMCBuIAowMDAwMDAxOTU2IDAwMDAwIG4gCjAwMDAwMDIxMzUgMDAwMDAgbiAKMDAwMDAxNTU3MiAwMDAwMCBuIAowMDAwMDAyMTc2IDAwMDAwIG4gCjAwMDAwMDIzNTIgMDAwMDAgbiAKMDAwMDAwMjM3MyAwMDAwMCBuIAowMDAwMDAyNTUyIDAwMDAwIG4gCjAwMDAwMTU3MTggMDAwMDAgbiAKMDAwMDAwMjU5MyAwMDAwMCBuIAowMDAwMDAyNzY5IDAwMDAwIG4gCjAwMDAwMDI3OTAgMDAwMDAgbiAKMDAwMDAwMjk2OSAwMDAwMCBuIAowMDAwMDE1ODY0IDAwMDAwIG4gCjAwMDAwMDMwMTAgMDAwMDAgbiAKMDAwMDAwMzE4NyAwMDAwMCBuIAowMDAwMDAzMjA4IDAwMDAwIG4gCjAwMDAwMDMzODcgMDAwMDAgbiAKMDAwMDAxNjAxMCAwMDAwMCBuIAowMDAwMDAzNDI4IDAwMDAwIG4gCjAwMDAwMDM2MDMgMDAwMDAgbiAKMDAwMDAwMzYyNCAwMDAwMCBuIAowMDAwMDAzODAzIDAwMDAwIG4gCjAwMDAwMTYxNTYgMDAwMDAgbiAKMDAwMDAwMzg0NCAwMDAwMCBuIAowMDAwMDA0MTExIDAwMDAwIG4gCjAwMDAwMDQxMzIgMDAwMDAgbiAKMDAwMDAwNDMxMSAwMDAwMCBuIAowMDAwMDE2MzAyIDAwMDAwIG4gCjAwMDAwMDQzNTIgMDAwMDAgbiAKMDAwMDAxMzUyMiAwMDAwMCBuIAowMDAwMDEzNTQ0IDAwMDAwIG4gCjAwMDAwMTM3NDggMDAwMDAgbiAKMDAwMDAxNDE3NSAwMDAwMCBuIAowMDAwMDE0NDYzIDAwMDAwIG4gCjAwMDAwMTQ0OTYgMDAwMDAgbiAKMDAwMDAxNjQ2NSAwMDAwMCBuIAowMDAwMDE2NTYzIDAwMDAwIG4gCnRyYWlsZXIKPDwvU2l6ZSA2MS9Sb290IDU5IDAgUgovSW5mbyA2MCAwIFIKL0lEIFsgPDI2QzZBMjA4N0U3RUFGMjE0MDE5QjVCQzI4MEFEODEyPgo8MjZDNkEyMDg3RTdFQUYyMTQwMTlCNUJDMjgwQUQ4MTI+IF0KL0RvY0NoZWNrc3VtIC81RTEwNjlGNDJEM0UyREQ1NEU4NjU3QUM2MzZDMTQxRgo+PgpzdGFydHhyZWYKMTY3MzgKJSVFT0YK";

    //String pdfUrl = 'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
  //  final pdfData = await fetchPdfBytes(pdfUrl);
    await Printing.layoutPdf(onLayout: (format) async {
      //return pdfData;
      var bytes = base64Decode(base64String.replaceAll('\n', ''));
      //var bytes = null;
      return bytes;
    });
  }

  Future<Uint8List> fetchPdfBytes(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('response bytes ${response.bodyBytes}');
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load PDF');
    }
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final documentRef = ValueNotifier<PdfDocumentRef?>(null);
  final controller = PdfViewerController();
  final showLeftPane = ValueNotifier<bool>(false);
  final outline = ValueNotifier<List<PdfOutlineNode>?>(null);
  late final textSearcher = PdfTextSearcher(controller)..addListener(_update);
  PdfTextRanges? _selectedText;
  late File file;
  bool isLoading = true;
  String base64String = "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IDY2NiA1MDAgXQovRm9udERlc2NyaXB0b3IgNTQgMCBSCi9Ub1VuaWNvZGUgNTUgMCBSCj4+CmVuZG9iagoKNTcgMCBvYmoKPDwvRjEgNTYgMCBSCj4+CmVuZG9iagoKNTggMCBvYmoKPDwvRm9udCA1NyAwIFIKL1hPYmplY3Q8PC9UcjE0IDE0IDAgUi9UcjE5IDE5IDAgUi9UcjI0IDI0IDAgUi9UcjI5IDI5IDAgUi9UcjM0IDM0IDAgUi9UcjM5IDM5IDAgUi9UcjQgNCAwIFIvVHI0NCA0NCAwIFIKL1RyNDkgNDkgMCBSL1RyOSA5IDAgUj4+Ci9FeHRHU3RhdGU8PC9FR1MxMCAxMCAwIFIvRUdTMTUgMTUgMCBSL0VHUzIwIDIwIDAgUi9FR1MyNSAyNSAwIFIvRUdTMzAgMzAgMCBSL0VHUzM1IDM1IDAgUi9FR1M0MCA0MCAwIFIvRUdTNDUgNDUgMCBSCi9FR1M1IDUgMCBSL0VHUzUwIDUwIDAgUj4+Ci9Qcm9jU2V0Wy9QREYvVGV4dC9JbWFnZUMvSW1hZ2VJL0ltYWdlQl0KPj4KZW5kb2JqCgoxIDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDIgMCBSPj4KZW5kb2JqCgo2IDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDcgMCBSPj4KZW5kb2JqCgoxMSAwIG9iago8PC9UeXBlL1BhZ2UvUGFyZW50IDUxIDAgUi9SZXNvdXJjZXMgNTggMCBSL01lZGlhQm94WzAgMCAyODMgNDMyXS9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQi9JIHRydWU+Pi9Db250ZW50cyAxMiAwIFI+PgplbmRvYmoKCjE2IDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDE3IDAgUj4+CmVuZG9iagoKMjEgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCA1MSAwIFIvUmVzb3VyY2VzIDU4IDAgUi9NZWRpYUJveFswIDAgMjgzIDQzMl0vR3JvdXA8PC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VSR0IvSSB0cnVlPj4vQ29udGVudHMgMjIgMCBSPj4KZW5kb2JqCgoyNiAwIG9iago8PC9UeXBlL1BhZ2UvUGFyZW50IDUxIDAgUi9SZXNvdXJjZXMgNTggMCBSL01lZGlhQm94WzAgMCAyODMgNDMyXS9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQi9JIHRydWU+Pi9Db250ZW50cyAyNyAwIFI+PgplbmRvYmoKCjMxIDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDMyIDAgUj4+CmVuZG9iagoKMzYgMCBvYmoKPDwvVHlwZS9QYWdlL1BhcmVudCA1MSAwIFIvUmVzb3VyY2VzIDU4IDAgUi9NZWRpYUJveFswIDAgMjgzIDQzMl0vR3JvdXA8PC9TL1RyYW5zcGFyZW5jeS9DUy9EZXZpY2VSR0IvSSB0cnVlPj4vQ29udGVudHMgMzcgMCBSPj4KZW5kb2JqCgo0MSAwIG9iago8PC9UeXBlL1BhZ2UvUGFyZW50IDUxIDAgUi9SZXNvdXJjZXMgNTggMCBSL01lZGlhQm94WzAgMCAyODMgNDMyXS9Hcm91cDw8L1MvVHJhbnNwYXJlbmN5L0NTL0RldmljZVJHQi9JIHRydWU+Pi9Db250ZW50cyA0MiAwIFI+PgplbmRvYmoKCjQ2IDAgb2JqCjw8L1R5cGUvUGFnZS9QYXJlbnQgNTEgMCBSL1Jlc291cmNlcyA1OCAwIFIvTWVkaWFCb3hbMCAwIDI4MyA0MzJdL0dyb3VwPDwvUy9UcmFuc3BhcmVuY3kvQ1MvRGV2aWNlUkdCL0kgdHJ1ZT4+L0NvbnRlbnRzIDQ3IDAgUj4+CmVuZG9iagoKNTEgMCBvYmoKPDwvVHlwZS9QYWdlcwovUmVzb3VyY2VzIDU4IDAgUgovTWVkaWFCb3hbIDAgMCAyODMgNDMyIF0KL0tpZHNbIDEgMCBSIDYgMCBSIDExIDAgUiAxNiAwIFIgMjEgMCBSIDI2IDAgUiAzMSAwIFIgMzYgMCBSIDQxIDAgUiA0NiAwIFIgXQovQ291bnQgMTA+PgplbmRvYmoKCjU5IDAgb2JqCjw8L1R5cGUvQ2F0YWxvZy9QYWdlcyA1MSAwIFIKL09wZW5BY3Rpb25bMSAwIFIgL1hZWiBudWxsIG51bGwgMF0KL0xhbmcoZW4tR0IpCj4+CmVuZG9iagoKNjAgMCBvYmoKPDwvQ3JlYXRvcjxGRUZGMDA1NzAwNzIwMDY5MDA3NDAwNjUwMDcyPgovUHJvZHVjZXI8RkVGRjAwNEMwMDY5MDA2MjAwNzIwMDY1MDA0RjAwNjYwMDY2MDA2OTAwNjMwMDY1MDAyMDAwMzQwMDJFMDAzMT4KL0NyZWF0aW9uRGF0ZShEOjIwMTQwNzAzMTUyNDA0KzAxJzAwJyk+PgplbmRvYmoKCnhyZWYKMCA2MQowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAwMTQ4NDYgMDAwMDAgbiAKMDAwMDAwMDAxOSAwMDAwMCBuIAowMDAwMDAwMjc5IDAwMDAwIG4gCjAwMDAwMDAyOTkgMDAwMDAgbiAKMDAwMDAwMDQ3NyAwMDAwMCBuIAowMDAwMDE0OTkwIDAwMDAwIG4gCjAwMDAwMDA1MTcgMDAwMDAgbiAKMDAwMDAwMDY5MSAwMDAwMCBuIAowMDAwMDAwNzExIDAwMDAwIG4gCjAwMDAwMDA4ODkgMDAwMDAgbiAKMDAwMDAxNTEzNCAwMDAwMCBuIAowMDAwMDAwOTMwIDAwMDAwIG4gCjAwMDAwMDExMDYgMDAwMDAgbiAKMDAwMDAwMTEyNyAwMDAwMCBuIAowMDAwMDAxMzA2IDAwMDAwIG4gCjAwMDAwMTUyODAgMDAwMDAgbiAKMDAwMDAwMTM0NyAwMDAwMCBuIAowMDAwMDAxNTE5IDAwMDAwIG4gCjAwMDAwMDE1MzkgMDAwMDAgbiAKMDAwMDAwMTcxOCAwMDAwMCBuIAowMDAwMDE1NDI2IDAwMDAwIG4gCjAwMDAwMDE3NTkgMDAwMDAgbiAKMDAwMDAwMTkzNSAwMDAwMCBuIAowMDAwMDAxOTU2IDAwMDAwIG4gCjAwMDAwMDIxMzUgMDAwMDAgbiAKMDAwMDAxNTU3MiAwMDAwMCBuIAowMDAwMDAyMTc2IDAwMDAwIG4gCjAwMDAwMDIzNTIgMDAwMDAgbiAKMDAwMDAwMjM3MyAwMDAwMCBuIAowMDAwMDAyNTUyIDAwMDAwIG4gCjAwMDAwMTU3MTggMDAwMDAgbiAKMDAwMDAwMjU5MyAwMDAwMCBuIAowMDAwMDAyNzY5IDAwMDAwIG4gCjAwMDAwMDI3OTAgMDAwMDAgbiAKMDAwMDAwMjk2OSAwMDAwMCBuIAowMDAwMDE1ODY0IDAwMDAwIG4gCjAwMDAwMDMwMTAgMDAwMDAgbiAKMDAwMDAwMzE4NyAwMDAwMCBuIAowMDAwMDAzMjA4IDAwMDAwIG4gCjAwMDAwMDMzODcgMDAwMDAgbiAKMDAwMDAxNjAxMCAwMDAwMCBuIAowMDAwMDAzNDI4IDAwMDAwIG4gCjAwMDAwMDM2MDMgMDAwMDAgbiAKMDAwMDAwMzYyNCAwMDAwMCBuIAowMDAwMDAzODAzIDAwMDAwIG4gCjAwMDAwMTYxNTYgMDAwMDAgbiAKMDAwMDAwMzg0NCAwMDAwMCBuIAowMDAwMDA0MTExIDAwMDAwIG4gCjAwMDAwMDQxMzIgMDAwMDAgbiAKMDAwMDAwNDMxMSAwMDAwMCBuIAowMDAwMDE2MzAyIDAwMDAwIG4gCjAwMDAwMDQzNTIgMDAwMDAgbiAKMDAwMDAxMzUyMiAwMDAwMCBuIAowMDAwMDEzNTQ0IDAwMDAwIG4gCjAwMDAwMTM3NDggMDAwMDAgbiAKMDAwMDAxNDE3NSAwMDAwMCBuIAowMDAwMDE0NDYzIDAwMDAwIG4gCjAwMDAwMTQ0OTYgMDAwMDAgbiAKMDAwMDAxNjQ2NSAwMDAwMCBuIAowMDAwMDE2NTYzIDAwMDAwIG4gCnRyYWlsZXIKPDwvU2l6ZSA2MS9Sb290IDU5IDAgUgovSW5mbyA2MCAwIFIKL0lEIFsgPDI2QzZBMjA4N0U3RUFGMjE0MDE5QjVCQzI4MEFEODEyPgo8MjZDNkEyMDg3RTdFQUYyMTQwMTlCNUJDMjgwQUQ4MTI+IF0KL0RvY0NoZWNrc3VtIC81RTEwNjlGNDJEM0UyREQ1NEU4NjU3QUM2MzZDMTQxRgo+PgpzdGFydHhyZWYKMTY3MzgKJSVFT0YK";


  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  void _update() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    textSearcher.removeListener(_update);
    textSearcher.dispose();
    showLeftPane.dispose();
    outline.dispose();
    documentRef.dispose();
    super.dispose();

  }

  loadDocument() async {
    var bytes = base64Decode(base64String.replaceAll('\n', ''));
    final output = await getTemporaryDirectory();
    file = File("${output.path}/example.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());

    setState(() => isLoading = false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.first_page),
            onPressed: () => controller.goToPage(pageNumber: 1),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp,size: 15),

            onPressed: () {
              print("Backward controller.pageNumber!:==>${controller.pageNumber}");
              controller.goToPage(pageNumber: (controller.pageNumber!>1)? controller.pageNumber!-1:controller.pageNumber!);},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_sharp,size: 15),
            onPressed: () {
              print("Forward controller.pageNumber!:==>${controller.pageNumber}");
              controller.goToPage(pageNumber: (controller.pageNumber!>=1)? controller.pageNumber!+1:controller.pageNumber!);},
          ),
          IconButton(
            icon: const Icon(Icons.last_page),
            onPressed: () =>
                controller.goToPage(pageNumber: controller.pageCount),
          ),
        ],
      ) ,
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    :PdfViewer.file(
                  file.path,
                  controller: controller,
                  params: PdfViewerParams(
                    backgroundColor: Colors.white,
                    loadingBannerBuilder:
                        (context, bytesDownloaded, totalBytes) => Center(
                      child: CircularProgressIndicator(
                        value: totalBytes != null
                            ? bytesDownloaded / totalBytes
                            : null,
                      ),
                    ),

                    viewerOverlayBuilder: (context, size, handleLinkTap) => [
                      PdfViewerScrollThumb(
                        controller: controller,
                        orientation: ScrollbarOrientation.right,
                        thumbSize: const Size(40, 25),
                        thumbBuilder:
                            (context, thumbSize, pageNumber, controller) =>
                            Container(
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  pageNumber.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                      ),

                    ],
                  ),


                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

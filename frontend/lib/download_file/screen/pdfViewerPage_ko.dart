// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import '../service/ApiServiceProvider_ko.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
//
// class PdfViewerPage_ko extends StatefulWidget {
//   const PdfViewerPage_ko({Key? key}) : super(key: key);
//
//   @override
//   _PdfViewerPageState createState() => _PdfViewerPageState();
// }
//
// class _PdfViewerPageState extends State<PdfViewerPage_ko > {
//   // String? localPath;
//   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
//
//   Future<void> listExample() async {
//     firebase_storage.ListResult result =
//     await firebase_storage.FirebaseStorage.instance.ref().child('notes').listAll();
//
//     result.items.forEach((firebase_storage.Reference ref) {
//       print('Found file: $ref');
//     });
//
//     result.prefixes.forEach((firebase_storage.Reference ref) {
//       print('Found directory: $ref');
//     });
//   }
//
//   Future<void> downloadURLExample() async {
//     String downloadURL = await firebase_storage.FirebaseStorage.instance
//         .ref('note_ko')
//         .getDownloadURL();
//     print(downloadURL);
//     PDFView doc = await PDFView.fromURL(downloadURL);
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPDF(doc)));  //Notice the Push Route once this is done.
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // ApiServiceProvider.loadPDF().then((value) {
//     //   setState(() {
//     //     localPath = value;
//     //   });
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("이주노동자권리수첩",style: TextStyle(fontWeight: FontWeight.bold),),
//       ),
//       body: localPath != null
//           ? PDFView(
//         filePath: localPath,
//       )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: pages >= 2
            ? [
          Center(child: Text(text)),
          IconButton(
            icon: Icon(Icons.chevron_left, size: 32),
            onPressed: () {
              final page = indexPage == 0 ? pages : indexPage - 1;
              controller!.setPage(page);
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, size: 32),
            onPressed: () {
              final page = indexPage == pages - 1 ? 0 : indexPage + 1;
              controller!.setPage(page);
            },
          ),
        ]
            : null,
      ),
      body: PDFView(
        filePath: widget.file.path,
        // autoSpacing: false,
        // swipeHorizontal: true,
        // pageSnap: false,
        // pageFling: false,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }
}

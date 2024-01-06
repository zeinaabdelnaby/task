import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:task/models/home_page_model.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key, required this.homePageModel});

  final HomePageModel homePageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.network(
      homePageModel.data!.classes![0].exams![0].answerPdfFile.toString(),
    ));
  }
}

import 'package:task/helper/api.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/models/pdf_model.dart';

class AllPdfs {
  static PdfModel pdfModel = PdfModel();
  Future<PdfModel> getAllHomePage() async {
    Map<String, dynamic> data = await Api().get(
        url: 'https://elmazone.topbusiness.io/api/guide/sources_references/all',
        token:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2VsbWF6b25lLnRvcGJ1c2luZXNzLmlvL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk4NTc5MDk1LCJleHAiOjE3MzAxMTUwOTUsIm5iZiI6MTY5ODU3OTA5NSwianRpIjoiNFZ6STFwYzRCeVREWTBWZCIsInN1YiI6IjIzNTciLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ed-3abF9AJ_OL31oeFpk7-7SgBaVZFlHzmZq0prGWn0');
    List<PdfModel> pdfList = [];
    for (int i = 0; i < data["data"].length; i++) {
      pdfList.add(PdfModel.fromJson(data["data"][i]));
    }

    return pdfModel;
  }
}

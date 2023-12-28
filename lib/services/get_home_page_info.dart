import 'package:task/helper/api.dart';
import 'package:task/models/home_page_model.dart';

class AllHomePageService {
  Future<List<HomePageModel>> getAllHomePage() async {
    Map<String, dynamic> data = await Api().get(
        url: 'https://elmazone.topbusiness.io/api/auth/home-page',
        token:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2VsbWF6b25lLnRvcGJ1c2luZXNzLmlvL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk4NTc5MDk1LCJleHAiOjE3MzAxMTUwOTUsIm5iZiI6MTY5ODU3OTA5NSwianRpIjoiNFZ6STFwYzRCeVREWTBWZCIsInN1YiI6IjIzNTciLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ed-3abF9AJ_OL31oeFpk7-7SgBaVZFlHzmZq0prGWn0');

    List<HomePageModel> homePageList = [];
    for (int i = 0; i < data["data"].length; i++) {
      homePageList.add(HomePageModel.fromJson(data["data"][i]));
    }
    return homePageList;
  }
}

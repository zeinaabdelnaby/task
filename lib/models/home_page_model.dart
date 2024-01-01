import 'dart:ffi';

class HomePageModel {
  Data? data;
  String? message;
  int? code;

  HomePageModel({this.data, this.message, this.code});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }
}

class Data {
  // Null? lifeExam;
  // Null? liveModel;
  int? notificationCount;
  String? centerStatus;
  String? languageActive;
  List<Sliders>? sliders;
  List<VideosBasics>? videosBasics;
  List<Classes>? classes;
  // List<Null>? videosResources;

  Data(
      {
      //   this.lifeExam,
      // this.liveModel,
      this.notificationCount,
      this.centerStatus,
      this.languageActive,
      this.sliders,
      this.videosBasics,
      this.classes,
      // this.videosResources
      });

  Data.fromJson(Map<String, dynamic> json) {
    // lifeExam = json['life_exam'];
    // liveModel = json['live_model'];
    notificationCount = json['notification_count'];
    centerStatus = json['center_status'];
    languageActive = json['language_active'];
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add( Sliders.fromJson(v));
      });
    }
    if (json['videos_basics'] != null) {
      videosBasics = <VideosBasics>[];
      json['videos_basics'].forEach((v) {
        videosBasics!.add( VideosBasics.fromJson(v));
      });
    }
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add( Classes.fromJson(v));
      });
    }
    // if (json['videos_resources'] != null) {
    //   videosResources = <Null>[];
    //   json['videos_resources'].forEach((v) {
    //     videosResources!.add( Null.fromJson(v));
    //   });
    // }
  }


}

class Sliders {
  int? id;
  String? file;
  String? type;
  String? link;
  String? createdAt;
  String? updatedAt;

  Sliders(
      {this.id,
      this.file,
      this.type,
      this.link,
      this.createdAt,
      this.updatedAt});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    type = json['type'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

 
}

class VideosBasics {
  int? id;
  String? name;
  String? time;
  int? size;
  String? backgroundColor;
  String? videoLink;
  int? isYoutube;
  String? createdAt;
  String? updatedAt;

  VideosBasics(
      {this.id,
      this.name,
      this.time,
      this.size,
      this.backgroundColor,
      this.videoLink,
      this.isYoutube,
      this.createdAt,
      this.updatedAt});

  VideosBasics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    size = json['size'];
    backgroundColor = json['background_color'];
    videoLink = json['video_link'];
    isYoutube = json['is_youtube'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Classes {
  int? id;
  String? status;
  String? image;
  String? backgroundColor;
  String? title;
  String? name;
  num? totalWatch;
  int? numOfLessons;
  int? numOfVideos;
  int? totalTimes;
  String? createdAt;
  String? updatedAt;
  // List<Exams>? exams;

  Classes(
      {this.id,
      this.status,
      this.image,
      this.backgroundColor,
      this.title,
      this.name,
      this.totalWatch,
      this.numOfLessons,
      this.numOfVideos,
      this.totalTimes,
      this.createdAt,
      this.updatedAt,
      // this.exams
      });

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    image = json['image'];
    backgroundColor = json['background_color'];
    title = json['title'];
    name = json['name'];
    totalWatch = json['total_watch'];
    numOfLessons = json['num_of_lessons'];
    numOfVideos = json['num_of_videos'];
    totalTimes = json['total_times'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // if (json['exams'] != null) {
    //   exams = <Exams>[];
    //   json['exams'].forEach((v) {
    //     exams!.add( Exams.fromJson(v));
    //   });
    // }
  }

}

// class Exams {
//   int? id;
//   String? name;
//   String? type;
//   String? examType;
//   String? backgroundColor;
//   String? examsFavorite;
//   String? pdfExamUpload;
//   String? answerPdfFile;
//   // Null? answerVideoFile;
//   int? answerVideoIsYoutube;
//   int? numOfQuestion;
//   int? totalTime;
//   int? examPdfSize;
//   int? answerPdfSize;
//   int? answerVideoSize;

//   Exams(
//       {this.id,
//       this.name,
//       this.type,
//       this.examType,
//       this.backgroundColor,
//       this.examsFavorite,
//       this.pdfExamUpload,
//       this.answerPdfFile,
//       // this.answerVideoFile,
//       this.answerVideoIsYoutube,
//       this.numOfQuestion,
//       this.totalTime,
//       this.examPdfSize,
//       this.answerPdfSize,
//       this.answerVideoSize});

//   Exams.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//     examType = json['exam_type'];
//     backgroundColor = json['background_color'];
//     examsFavorite = json['exams_favorite'];
//     pdfExamUpload = json['pdf_exam_upload'];
//     answerPdfFile = json['answer_pdf_file'];
//     // answerVideoFile = json['answer_video_file'];
//     answerVideoIsYoutube = json['answer_video_is_youtube'];
//     numOfQuestion = json['num_of_question'];
//     totalTime = json['total_time'];
//     examPdfSize = json['exam_pdf_size'];
//     answerPdfSize = json['answer_pdf_size'];
//     answerVideoSize = json['answer_video_size'];
//   }


// }
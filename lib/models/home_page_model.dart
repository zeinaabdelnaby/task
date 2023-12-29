// // // class HomePageModel{
// // //   Data? data;
// // //   String? message;
// // //   int? code;

// // //   HomePageModel({this.data, this.message, this.code});

// // //   HomePageModel.fromJson(Map<String, dynamic> json) {
// // //     data = json['data'] != null ? Data.fromJson(json['data']) : null;
// // //     message = json['message'];
// // //     code = json['code'];
// // //   }

// // //   Map<String, dynamic> toJson() {
// // //     final Map<String, dynamic> data = <String, dynamic>{};
// // //     if (this.data != null) {
// // //       data['data'] = this.data!.toJson();
// // //     }
// // //     data['message'] = message;
// // //     data['code'] = code;
// // //     return data;
// // //   }
// // // }

// // class HomePageModel {
// //   var lifeExam;
// //   var  liveModel;
// //   int? notificationCount;
// //   String? centerStatus;
// //   String? languageActive;
// //   List<Sliders>? sliders;
// //   List<VideosBasics>? videosBasics;
// //   List<Classes>? classes;
// //   List? videosResources;

// //   HomePageModel(
// //       {this.lifeExam,
// //       this.liveModel,
// //       this.notificationCount,
// //       this.centerStatus,
// //       this.languageActive,
// //       this.sliders,
// //       this.videosBasics,
// //       this.classes,
// //       this.videosResources});

// //   HomePageModel.fromJson(Map<String, dynamic> json) {
// //     lifeExam = json['life_exam'];
// //     liveModel = json['live_model'];
// //     notificationCount = json['notification_count'];
// //     centerStatus = json['center_status'];
// //     languageActive = json['language_active'];
// //     if (json['sliders'] != null) {
// //       sliders = <Sliders>[];
// //       json['sliders'].forEach((v) {
// //         sliders!.add(Sliders.fromJson(v));
// //       });
// //     }
// //     if (json['videos_basics'] != null) {
// //       videosBasics = <VideosBasics>[];
// //       json['videos_basics'].forEach((v) {
// //         videosBasics!.add(VideosBasics.fromJson(v));
// //       });
// //     }
// //     if (json['classes'] != null) {
// //       classes = <Classes>[];
// //       json['classes'].forEach((v) {
// //         classes!.add(Classes.fromJson(v));
// //       });
// //     }
// //     if (json['videos_resources'] != null) {
// //       videosResources = <Null>[];
// //       json['videos_resources'].forEach((v) {
// //         videosResources!.add(v.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['life_exam'] = lifeExam;
// //     data['live_model'] = liveModel;
// //     data['notification_count'] = notificationCount;
// //     data['center_status'] = centerStatus;
// //     data['language_active'] = languageActive;
// //     if (sliders != null) {
// //       data['sliders'] = sliders!.map((v) => v.toJson()).toList();
// //     }
// //     if (videosBasics != null) {
// //       data['videos_basics'] =
// //           videosBasics!.map((v) => v.toJson()).toList();
// //     }
// //     if (classes != null) {
// //       data['classes'] = classes!.map((v) => v.toJson()).toList();
// //     }
// //     if (videosResources != null) {
// //       data['videos_resources'] =
// //           videosResources!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Sliders {
// //   int? id;
// //   String? file;
// //   String? type;
// //   String? link;
// //   String? createdAt;
// //   String? updatedAt;

// //   Sliders(
// //       {this.id,
// //       this.file,
// //       this.type,
// //       this.link,
// //       this.createdAt,
// //       this.updatedAt});

// //   Sliders.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     file = json['file'];
// //     type = json['type'];
// //     link = json['link'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['file'] = file;
// //     data['type'] = type;
// //     data['link'] = link;
// //     data['created_at'] = createdAt;
// //     data['updated_at'] = updatedAt;
// //     return data;
// //   }
// // }

// // class VideosBasics {
// //   int? id;
// //   String? name;
// //   String? time;
// //   int? size;
// //   String? backgroundColor;
// //   String? videoLink;
// //   int? isYoutube;
// //   String? createdAt;
// //   String? updatedAt;

// //   VideosBasics(
// //       {this.id,
// //       this.name,
// //       this.time,
// //       this.size,
// //       this.backgroundColor,
// //       this.videoLink,
// //       this.isYoutube,
// //       this.createdAt,
// //       this.updatedAt});

// //   VideosBasics.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //     time = json['time'];
// //     size = json['size'];
// //     backgroundColor = json['background_color'];
// //     videoLink = json['video_link'];
// //     isYoutube = json['is_youtube'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['name'] = name;
// //     data['time'] = time;
// //     data['size'] = size;
// //     data['background_color'] = backgroundColor;
// //     data['video_link'] = videoLink;
// //     data['is_youtube'] = isYoutube;
// //     data['created_at'] = createdAt;
// //     data['updated_at'] = updatedAt;
// //     return data;
// //   }
// // }

// // class Classes {
// //   int? id;
// //   String? status;
// //   String? image;
// //   String? backgroundColor;
// //   String? title;
// //   String? name;
// //   double? totalWatch;
// //   int? numOfLessons;
// //   int? numOfVideos;
// //   int? totalTimes;
// //   String? createdAt;
// //   String? updatedAt;
// //   List<Exams>? exams;

// //   Classes(
// //       {this.id,
// //       this.status,
// //       this.image,
// //       this.backgroundColor,
// //       this.title,
// //       this.name,
// //       this.totalWatch,
// //       this.numOfLessons,
// //       this.numOfVideos,
// //       this.totalTimes,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.exams});

// //   Classes.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     status = json['status'];
// //     image = json['image'];
// //     backgroundColor = json['background_color'];
// //     title = json['title'];
// //     name = json['name'];
// //     totalWatch = json['total_watch'];
// //     numOfLessons = json['num_of_lessons'];
// //     numOfVideos = json['num_of_videos'];
// //     totalTimes = json['total_times'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     if (json['exams'] != null) {
// //       exams = <Exams>[];
// //       json['exams'].forEach((v) {
// //         exams!.add(Exams.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['status'] = status;
// //     data['image'] = image;
// //     data['background_color'] = backgroundColor;
// //     data['title'] = title;
// //     data['name'] = name;
// //     data['total_watch'] = totalWatch;
// //     data['num_of_lessons'] = numOfLessons;
// //     data['num_of_videos'] = numOfVideos;
// //     data['total_times'] = totalTimes;
// //     data['created_at'] = createdAt;
// //     data['updated_at'] = updatedAt;
// //     if (exams != null) {
// //       data['exams'] = exams!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Exams {
// //   int? id;
// //   String? name;
// //   String? type;
// //   String? examType;
// //   String? backgroundColor;
// //   String? examsFavorite;
// //   String? pdfExamUpload;
// //   String? answerPdfFile;
// //   void answerVideoFile;
// //   int? answerVideoIsYoutube;
// //   int? numOfQuestion;
// //   int? totalTime;
// //   int? examPdfSize;
// //   int? answerPdfSize;
// //   int? answerVideoSize;

// //   Exams(
// //       {this.id,
// //       this.name,
// //       this.type,
// //       this.examType,
// //       this.backgroundColor,
// //       this.examsFavorite,
// //       this.pdfExamUpload,
// //       this.answerPdfFile,
// //       this.answerVideoFile,
// //       this.answerVideoIsYoutube,
// //       this.numOfQuestion,
// //       this.totalTime,
// //       this.examPdfSize,
// //       this.answerPdfSize,
// //       this.answerVideoSize});

// //   Exams.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //     type = json['type'];
// //     examType = json['exam_type'];
// //     backgroundColor = json['background_color'];
// //     examsFavorite = json['exams_favorite'];
// //     pdfExamUpload = json['pdf_exam_upload'];
// //     answerPdfFile = json['answer_pdf_file'];
// //     answerVideoFile = json['answer_video_file'];
// //     answerVideoIsYoutube = json['answer_video_is_youtube'];
// //     numOfQuestion = json['num_of_question'];
// //     totalTime = json['total_time'];
// //     examPdfSize = json['exam_pdf_size'];
// //     answerPdfSize = json['answer_pdf_size'];
// //     answerVideoSize = json['answer_video_size'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['name'] = name;
// //     data['type'] = type;
// //     data['exam_type'] = examType;
// //     data['background_color'] = backgroundColor;
// //     data['exams_favorite'] = examsFavorite;
// //     data['pdf_exam_upload'] = pdfExamUpload;
// //     data['answer_pdf_file'] = answerPdfFile;
// //     // data['answer_video_file'] = answerVideoFile;
// //     data['answer_video_is_youtube'] = answerVideoIsYoutube;
// //     data['num_of_question'] = numOfQuestion;
// //     data['total_time'] = totalTime;
// //     data['exam_pdf_size'] = examPdfSize;
// //     data['answer_pdf_size'] = answerPdfSize;
// //     data['answer_video_size'] = answerVideoSize;
// //     return data;
// //   }
// // }

// class HomePageModel {
//   final int life_exam;
//   final String live_model;
//   final int notification_count;
//   bool isSelceted;
//   final String center_status;
//   final String language_active;
//   final List<videosBasicsModel> videosBasics;

//   HomePageModel(
//       {
//         required this.life_exam,
//       required this.live_model,
//       this.isSelceted = false,
//       required this.notification_count,
//       required this.center_status,
//       required this.language_active,
//       required this.videosBasics});

//   factory HomePageModel.fromJson(jsonData) {
//     return HomePageModel(
//         life_exam: jsonData['life_exam']??'',
//         live_model: jsonData['live_model']??'',
//         notification_count: jsonData['notification_count']??0,
//         center_status: jsonData['center_status']??'',
//         language_active: jsonData['language_active']??'',
//         videosBasics: videosBasicsModel.fromJsonList(
//           (jsonData['content'] as List).cast<Map<String, dynamic>>(),
//         )
//         );
//   }
// }
// // class videosBasicsModel {
// //   final String name;
// //   final int id;
// //   final String time;
// //   final String video_link;

// //   videosBasicsModel({
// //     required this.name,
// //     required this.id,
// //     required this.time,
// //     required this.video_link,
// //   });

// //   factory videosBasicsModel.fromJson(jsonData) {
// //     return videosBasicsModel(
// //         id: jsonData['id'],
// //         name: jsonData['name'],
// //         time: jsonData['time'],
// //         video_link: 'video_link,');
// //   }

// //   static List<videosBasicsModel> fromJsonList(
// //       List<Map<String, dynamic>> jsonList) {
// //     return jsonList.map((json) => videosBasicsModel.fromJson(json)).toList();
// //   }
// // }



//  VideosBasics(
//       {this.id,
//       this.name,
//       this.time,
//       this.size,
//       this.backgroundColor,
//       this.videoLink,
//       this.isYoutube,
//       this.createdAt,
//       this.updatedAt});

//   VideosBasics.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     time = json['time'];
//     size = json['size'];
//     backgroundColor = json['background_color'];
//     videoLink = json['video_link'];
//     isYoutube = json['is_youtube'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['time'] = time;
//     data['size'] = size;
//     data['background_color'] = backgroundColor;
//     data['video_link'] = videoLink;
//     data['is_youtube'] = isYoutube;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

class HomePageModel {
  Data? data;
  String? message;
  int? code;

  HomePageModel({this.data, this.message, this.code});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
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
        sliders!.add(new Sliders.fromJson(v));
      });
    }
    if (json['videos_basics'] != null) {
      videosBasics = <VideosBasics>[];
      json['videos_basics'].forEach((v) {
        videosBasics!.add(new VideosBasics.fromJson(v));
      });
    }
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    // if (json['videos_resources'] != null) {
    //   videosResources = <Null>[];
    //   json['videos_resources'].forEach((v) {
    //     videosResources!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['life_exam'] = this.lifeExam;
    // data['live_model'] = this.liveModel;
    data['notification_count'] = this.notificationCount;
    data['center_status'] = this.centerStatus;
    data['language_active'] = this.languageActive;
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    if (this.videosBasics != null) {
      data['videos_basics'] =
          this.videosBasics!.map((v) => v.toJson()).toList();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    // if (this.videosResources != null) {
    //   data['videos_resources'] =
    //       this.videosResources!.map((v) => v.toJson()).toList();
    // }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    data['type'] = this.type;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['size'] = this.size;
    data['background_color'] = this.backgroundColor;
    data['video_link'] = this.videoLink;
    data['is_youtube'] = this.isYoutube;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Classes {
  int? id;
  String? status;
  String? image;
  String? backgroundColor;
  String? title;
  String? name;
  double? totalWatch;
  int? numOfLessons;
  int? numOfVideos;
  int? totalTimes;
  String? createdAt;
  String? updatedAt;
  List<Exams>? exams;

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
      this.exams});

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
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) {
        exams!.add(new Exams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['image'] = this.image;
    data['background_color'] = this.backgroundColor;
    data['title'] = this.title;
    data['name'] = this.name;
    data['total_watch'] = this.totalWatch;
    data['num_of_lessons'] = this.numOfLessons;
    data['num_of_videos'] = this.numOfVideos;
    data['total_times'] = this.totalTimes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.exams != null) {
      data['exams'] = this.exams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exams {
  int? id;
  String? name;
  String? type;
  String? examType;
  String? backgroundColor;
  String? examsFavorite;
  String? pdfExamUpload;
  String? answerPdfFile;
  Null? answerVideoFile;
  int? answerVideoIsYoutube;
  int? numOfQuestion;
  int? totalTime;
  int? examPdfSize;
  int? answerPdfSize;
  int? answerVideoSize;

  Exams(
      {this.id,
      this.name,
      this.type,
      this.examType,
      this.backgroundColor,
      this.examsFavorite,
      this.pdfExamUpload,
      this.answerPdfFile,
      this.answerVideoFile,
      this.answerVideoIsYoutube,
      this.numOfQuestion,
      this.totalTime,
      this.examPdfSize,
      this.answerPdfSize,
      this.answerVideoSize});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    examType = json['exam_type'];
    backgroundColor = json['background_color'];
    examsFavorite = json['exams_favorite'];
    pdfExamUpload = json['pdf_exam_upload'];
    answerPdfFile = json['answer_pdf_file'];
    // answerVideoFile = json['answer_video_file'];
    answerVideoIsYoutube = json['answer_video_is_youtube'];
    numOfQuestion = json['num_of_question'];
    totalTime = json['total_time'];
    examPdfSize = json['exam_pdf_size'];
    answerPdfSize = json['answer_pdf_size'];
    answerVideoSize = json['answer_video_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['exam_type'] = this.examType;
    data['background_color'] = this.backgroundColor;
    data['exams_favorite'] = this.examsFavorite;
    data['pdf_exam_upload'] = this.pdfExamUpload;
    data['answer_pdf_file'] = this.answerPdfFile;
    // data['answer_video_file'] = this.answerVideoFile;
    data['answer_video_is_youtube'] = this.answerVideoIsYoutube;
    data['num_of_question'] = this.numOfQuestion;
    data['total_time'] = this.totalTime;
    data['exam_pdf_size'] = this.examPdfSize;
    data['answer_pdf_size'] = this.answerPdfSize;
    data['answer_video_size'] = this.answerVideoSize;
    return data;
  }
}
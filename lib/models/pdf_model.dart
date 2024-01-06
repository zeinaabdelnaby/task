class PdfModel {
  List<Data>? data;
  String? message;
  int? code;

  PdfModel({this.data, this.message, this.code});

  PdfModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? color;
  String? filePath;
  String? icon;
  String? filePathSize;
  String? description;
  String? createdAt;

  Data(
      {this.id,
      this.title,
      this.color,
      this.filePath,
      this.icon,
      this.filePathSize,
      this.description,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    filePath = json['file_path'];
    icon = json['icon'];
    filePathSize = json['file_path_size'];
    description = json['description'];
    createdAt = json['created_at'];
  }


}
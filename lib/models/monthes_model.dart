class MonthesModel {
  final int id;
  final String name;
  final int price;
  final String freeStatus;
  final ContentModel content;

  MonthesModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.freeStatus,
      required this.content});

  factory MonthesModel.fromJson(jsonData) {
    return MonthesModel(
        id: jsonData['id'],
        name: jsonData['name'],
        price: jsonData['price'],
        freeStatus: jsonData['free_status'],
        content: ContentModel.fromJson(jsonData['content']));
  }
}

class ContentModel {
  final String name;
  final int id;
  final DateTime time;

  ContentModel({required this.name, required this.id, required this.time});

  factory ContentModel.fromJson(jsonData) {
    return ContentModel(id: jsonData['id'], name: jsonData['name'], time: jsonData['time']);
  }
}

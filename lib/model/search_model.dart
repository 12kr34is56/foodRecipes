class SearchModel {
  int? id;
  String? title;
  String? imageType;

  SearchModel({this.id, this.title, this.imageType});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageType'] = this.imageType;
    return data;
  }
}

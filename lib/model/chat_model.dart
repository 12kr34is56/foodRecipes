class ChatModel {
  String? answerText;
  List<Media>? media;

  ChatModel({this.answerText, this.media});

  ChatModel.fromJson(Map<String, dynamic> json) {
    answerText = json['answerText'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerText'] = this.answerText;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  String? title;
  String? image;
  String? link;

  Media({this.title, this.image, this.link});

  Media.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}

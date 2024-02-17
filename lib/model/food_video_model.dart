class FoodVideoModel {
  int? totalResults;
  List<Videos>? videos;

  FoodVideoModel({this.totalResults, this.videos});

  FoodVideoModel.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalResults'] = this.totalResults;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  String? title;
  String? shortTitle;
  String? youTubeId;
  double? rating;
  int? views;
  String? thumbnail;
  int? length;

  Videos(
      {this.title,
        this.shortTitle,
        this.youTubeId,
        this.rating,
        this.views,
        this.thumbnail,
        this.length});

  Videos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortTitle = json['shortTitle'];
    youTubeId = json['youTubeId'];
    rating = json['rating'];
    views = json['views'];
    thumbnail = json['thumbnail'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['shortTitle'] = this.shortTitle;
    data['youTubeId'] = this.youTubeId;
    data['rating'] = this.rating;
    data['views'] = this.views;
    data['thumbnail'] = this.thumbnail;
    data['length'] = this.length;
    return data;
  }
}

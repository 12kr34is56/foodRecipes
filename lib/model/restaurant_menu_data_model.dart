class RestaurantDataMenuModel {
  Data? data;

  RestaurantDataMenuModel({this.data});

  RestaurantDataMenuModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  About? about;
  List<Menu>? menu;
  String? uRL;

  Data({this.about, this.menu, this.uRL});

  Data.fromJson(Map<String, dynamic> json) {
    about = json['About'] != null ? About.fromJson(json['About']) : null;
    if (json['Menu'] != null) {
      menu = <Menu>[];
      json['Menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (about != null) {
      data['About'] = about!.toJson();
    }
    if (menu != null) {
      data['Menu'] = menu!.map((v) => v.toJson()).toList();
    }
    data['URL'] = uRL;
    return data;
  }
}

class About {
  String? name;
  String? ratings;
  String? locality;
  String? areaName;
  String? city;
  List<String>? cuisines;

  About(
      {this.name,
        this.ratings,
        this.locality,
        this.areaName,
        this.city,
        this.cuisines});

  About.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    ratings = json['Ratings'];
    locality = json['Locality'];
    areaName = json['AreaName'];
    city = json['City'];
    cuisines = json['Cuisines'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Ratings'] = ratings;
    data['Locality'] = locality;
    data['AreaName'] = areaName;
    data['City'] = city;
    data['Cuisines'] = cuisines;
    return data;
  }
}

class Menu {
  String? title;
  List<Dishes>? dishes;

  Menu({this.title, this.dishes});

  Menu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['Dishes'] != null) {
      dishes = <Dishes>[];
      json['Dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (dishes != null) {
      data['Dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dishes {
  String? name;
  String? description;
  bool? inStock;
  bool? isVeg;
  int? price;

  Dishes({this.name, this.description, this.inStock, this.isVeg, this.price});

  Dishes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    inStock = json['inStock'];
    isVeg = json['isVeg'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['inStock'] = inStock;
    data['isVeg'] = isVeg;
    data['price'] = price;
    return data;
  }
}

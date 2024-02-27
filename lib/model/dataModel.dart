import 'dart:convert';
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());
class DataModel {
  DataModel({
      this.items,});

  DataModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));
String itemsToJson(Items data) => json.encode(data.toJson());
class Items {
  Items({
      this.title, 
      this.id, 
      this.language, 
      this.ontologyId, 
      this.resultType, 
      this.address, 
      this.position, 
      this.access, 
      this.distance, 
      this.categories, 
      this.references, 
      this.foodTypes,});

  Items.fromJson(dynamic json) {
    title = json['title'];
    id = json['id'];
    language = json['language'];
    ontologyId = json['ontologyId'];
    resultType = json['resultType'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    position = json['position'] != null ? Position.fromJson(json['position']) : null;
    if (json['access'] != null) {
      access = [];
      json['access'].forEach((v) {
        access?.add(Access.fromJson(v));
      });
    }
    distance = json['distance'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['references'] != null) {
      references = [];
      json['references'].forEach((v) {
        references?.add(References.fromJson(v));
      });
    }
    if (json['foodTypes'] != null) {
      foodTypes = [];
      json['foodTypes'].forEach((v) {
        foodTypes?.add(FoodTypes.fromJson(v));
      });
    }
  }
  String? title;
  String? id;
  String? language;
  String? ontologyId;
  String? resultType;
  Address? address;
  Position? position;
  List<Access>? access;
  int? distance;
  List<Categories>? categories;
  List<References>? references;
  List<FoodTypes>? foodTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['id'] = id;
    map['language'] = language;
    map['ontologyId'] = ontologyId;
    map['resultType'] = resultType;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    if (position != null) {
      map['position'] = position?.toJson();
    }
    if (access != null) {
      map['access'] = access?.map((v) => v.toJson()).toList();
    }
    map['distance'] = distance;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (references != null) {
      map['references'] = references?.map((v) => v.toJson()).toList();
    }
    if (foodTypes != null) {
      map['foodTypes'] = foodTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

FoodTypes foodTypesFromJson(String str) => FoodTypes.fromJson(json.decode(str));
String foodTypesToJson(FoodTypes data) => json.encode(data.toJson());
class FoodTypes {
  FoodTypes({
      this.id, 
      this.name, 
      this.primary,});

  FoodTypes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    primary = json['primary'];
  }
  String? id;
  String? name;
  bool? primary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['primary'] = primary;
    return map;
  }

}

References referencesFromJson(String str) => References.fromJson(json.decode(str));
String referencesToJson(References data) => json.encode(data.toJson());
class References {
  References({
      this.supplier, 
      this.id,});

  References.fromJson(dynamic json) {
    supplier = json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
    id = json['id'];
  }
  Supplier? supplier;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (supplier != null) {
      map['supplier'] = supplier?.toJson();
    }
    map['id'] = id;
    return map;
  }

}

Supplier supplierFromJson(String str) => Supplier.fromJson(json.decode(str));
String supplierToJson(Supplier data) => json.encode(data.toJson());
class Supplier {
  Supplier({
      this.id,});

  Supplier.fromJson(dynamic json) {
    id = json['id'];
  }
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      this.id, 
      this.name, 
      this.primary,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    primary = json['primary'];
  }
  String? id;
  String? name;
  bool? primary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['primary'] = primary;
    return map;
  }

}

Access accessFromJson(String str) => Access.fromJson(json.decode(str));
String accessToJson(Access data) => json.encode(data.toJson());
class Access {
  Access({
      this.lat, 
      this.lng,});

  Access.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  double? lat;
  double? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

Position positionFromJson(String str) => Position.fromJson(json.decode(str));
String positionToJson(Position data) => json.encode(data.toJson());
class Position {
  Position({
      this.lat, 
      this.lng,});

  Position.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  double? lat;
  double? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      this.label, 
      this.countryCode, 
      this.countryName, 
      this.stateCode, 
      this.state, 
      this.county, 
      this.city, 
      this.district, 
      this.street, 
      this.postalCode,});

  Address.fromJson(dynamic json) {
    label = json['label'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    stateCode = json['stateCode'];
    state = json['state'];
    county = json['county'];
    city = json['city'];
    district = json['district'];
    street = json['street'];
    postalCode = json['postalCode'];
  }
  String? label;
  String? countryCode;
  String? countryName;
  String? stateCode;
  String? state;
  String? county;
  String? city;
  String? district;
  String? street;
  String? postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['countryCode'] = countryCode;
    map['countryName'] = countryName;
    map['stateCode'] = stateCode;
    map['state'] = state;
    map['county'] = county;
    map['city'] = city;
    map['district'] = district;
    map['street'] = street;
    map['postalCode'] = postalCode;
    return map;
  }

}
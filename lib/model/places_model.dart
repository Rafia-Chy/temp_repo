import 'package:json_annotation/json_annotation.dart';

part 'places_model.g.dart'; // This is the generated file name

@JsonSerializable(explicitToJson: true)
class PlacesModel {
  bool? status;
  String? message;
  Data? data;

  PlacesModel({this.status, this.message, this.data});

  factory PlacesModel.fromJson(Map<String, dynamic> json) => _$PlacesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlacesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  List<Nearby>? nearby;
  List<Popular>? popular;

  Data({this.nearby, this.popular});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Nearby {
  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  String? routeVideoId;
  String? language;
  String? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  int? averageRating;
  bool? isFavourite;
  Author? author;
  Travelmethod? travelmethod;
  List<Steps>? steps;
  List<Categories>? categories;
  List<Images>? images;
  String? audio;

  Nearby(
      {this.id,
        this.name,
        this.description,
        this.location,
        this.price,
        this.min,
        this.active,
        this.routeVideoId,
        this.language,
        this.coverImage,
        this.stepcount,
        this.duration,
        this.distance,
        this.trashed,
        this.averageRating,
        this.isFavourite,
        this.author,
        this.travelmethod,
        this.steps,
        this.categories,
        this.images,
        this.audio});

  factory Nearby.fromJson(Map<String, dynamic> json) => _$NearbyFromJson(json);
  Map<String, dynamic> toJson() => _$NearbyToJson(this);
}

@JsonSerializable()
class Popular {
  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  String? routeVideoId;
  String? language;
  @JsonKey(name: 'cover_image')
  String? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  @JsonKey(name: 'average_rating')
  double? averageRating;
  bool? isFavourite;
  Author? author;
  Travelmethod? travelmethod;
  List<Steps>? steps;
  List<Categories>? categories;
  List<Images>? images;
  Audios? audio;

  Popular(
      {this.id,
        this.name,
        this.description,
        this.location,
        this.price,
        this.min,
        this.active,
        this.routeVideoId,
        this.language,
        this.coverImage,
        this.stepcount,
        this.duration,
        this.distance,
        this.trashed,
        this.averageRating,
        this.isFavourite,
        this.author,
        this.travelmethod,
        this.steps,
        this.categories,
        this.images,
        this.audio});

  factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);
  Map<String, dynamic> toJson() => _$PopularToJson(this);
}

@JsonSerializable()
class Author {
  int? id;
  String? name;

  Author({this.id, this.name});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Travelmethod {
  int? id;
  String? travelMethod;

  Travelmethod({this.id, this.travelMethod});

  factory Travelmethod.fromJson(Map<String, dynamic> json) => _$TravelmethodFromJson(json);
  Map<String, dynamic> toJson() => _$TravelmethodToJson(this);
}

@JsonSerializable()
class Steps {
  int? id;
  String? step;
  String? videoId;
  String? coverImage;
  int? order;

  Steps({this.id, this.step, this.videoId, this.coverImage, this.order});

  factory Steps.fromJson(Map<String, dynamic> json) => _$StepsFromJson(json);
  Map<String, dynamic> toJson() => _$StepsToJson(this);
}

@JsonSerializable()
class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class Images {
  int? id;
  String? path;

  Images({this.id, this.path});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Audios {
  int? id;
  String? path;

  Audios({this.id, this.path});

  factory Audios.fromJson(Map<String, dynamic> json) => _$AudiosFromJson(json);
  Map<String, dynamic> toJson() => _$AudiosToJson(this);
}

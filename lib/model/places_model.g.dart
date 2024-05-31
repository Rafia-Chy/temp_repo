// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesModel _$PlacesModelFromJson(Map<String, dynamic> json) => PlacesModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlacesModelToJson(PlacesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      nearby: (json['nearby'] as List<dynamic>?)
          ?.map((e) => Nearby.fromJson(e as Map<String, dynamic>))
          .toList(),
      popular: (json['popular'] as List<dynamic>?)
          ?.map((e) => Popular.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nearby': instance.nearby?.map((e) => e.toJson()).toList(),
      'popular': instance.popular?.map((e) => e.toJson()).toList(),
    };

Nearby _$NearbyFromJson(Map<String, dynamic> json) => Nearby(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toInt(),
      active: json['active'] as String?,
      routeVideoId: json['routeVideoId'] as String?,
      language: json['language'] as String?,
      coverImage: json['cover_image'] as String?,
      stepcount: (json['stepcount'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toInt(),
      trashed: json['trashed'] as bool?,
      averageRating: (json['average_rating'] as num?)?.toInt(),
      isFavourite: json['isFavourite'] as bool?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      travelmethod: json['travelmethod'] == null
          ? null
          : Travelmethod.fromJson(json['travelmethod'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$NearbyToJson(Nearby instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'price': instance.price,
      'min': instance.min,
      'active': instance.active,
      'routeVideoId': instance.routeVideoId,
      'language': instance.language,
      'coverImage': instance.coverImage,
      'stepcount': instance.stepcount,
      'duration': instance.duration,
      'distance': instance.distance,
      'trashed': instance.trashed,
      'averageRating': instance.averageRating,
      'isFavourite': instance.isFavourite,
      'author': instance.author?.toJson(),
      'travelmethod': instance.travelmethod?.toJson(),
      'steps': instance.steps?.map((e) => e.toJson()).toList(),
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'audio': instance.audio,
    };

Popular _$PopularFromJson(Map<String, dynamic> json) => Popular(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toInt(),
      active: json['active'] as String?,
      routeVideoId: json['routeVideoId'] as String?,
      language: json['language'] as String?,
      coverImage: json['cover_image'] as String?,
      stepcount: (json['stepcount'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toInt(),
      trashed: json['trashed'] as bool?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      isFavourite: json['isFavourite'] as bool?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      travelmethod: json['travelmethod'] == null
          ? null
          : Travelmethod.fromJson(json['travelmethod'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      audio: json['audio'] == null
          ? null
          : Audios.fromJson(json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'price': instance.price,
      'min': instance.min,
      'active': instance.active,
      'routeVideoId': instance.routeVideoId,
      'language': instance.language,
      'cover_image': instance.coverImage,
      'stepcount': instance.stepcount,
      'duration': instance.duration,
      'distance': instance.distance,
      'trashed': instance.trashed,
      'average_rating': instance.averageRating,
      'isFavourite': instance.isFavourite,
      'author': instance.author,
      'travelmethod': instance.travelmethod,
      'steps': instance.steps,
      'categories': instance.categories,
      'images': instance.images,
      'audio': instance.audio,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Travelmethod _$TravelmethodFromJson(Map<String, dynamic> json) => Travelmethod(
      id: (json['id'] as num?)?.toInt(),
      travelMethod: json['travelMethod'] as String?,
    );

Map<String, dynamic> _$TravelmethodToJson(Travelmethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'travelMethod': instance.travelMethod,
    };

Steps _$StepsFromJson(Map<String, dynamic> json) => Steps(
      id: (json['id'] as num?)?.toInt(),
      step: json['step'] as String?,
      videoId: json['videoId'] as String?,
      coverImage: json['coverImage'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StepsToJson(Steps instance) => <String, dynamic>{
      'id': instance.id,
      'step': instance.step,
      'videoId': instance.videoId,
      'coverImage': instance.coverImage,
      'order': instance.order,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };

Audios _$AudiosFromJson(Map<String, dynamic> json) => Audios(
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$AudiosToJson(Audios instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };

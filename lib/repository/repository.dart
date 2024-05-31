
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travel_app/model/places_model.dart';
import 'package:path/path.dart';
import 'dart:async';


class PlacesRepository {
  static const String apiUrl = 'http://142.93.106.105/interview/getRoutes.php';
  static const Map<String, String> headers = {
    'Authorization': 'Basic dml0ZWNkZXY6TTQ4OnRed1VCZSV5'
  };

  Database? _database;
  final Dio _dio = Dio(BaseOptions(
    headers: headers,
  ));

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = join(dir.path, 'locations.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE locations(
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT,
            location TEXT,
            price REAL
          )
        ''');
      },
    );
  }

  Future<void> insertLocation(PlacesModel location) async {
    final db = await database;
    await db.insert('locations', location.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PlacesModel>> fetchLocationsFromCache() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('locations');

    return List.generate(maps.length, (i) {
      return PlacesModel.fromJson(maps[i]);
    });
  }

  Future<PlacesModel> fetchLocationsFromApi() async {
    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        // Decode the response body into a Map<String, dynamic>
        final Map<String, dynamic> responseData = jsonDecode(response.data);

        // Parse the JSON into a PlacesModel object
        PlacesModel placesModel = PlacesModel.fromJson(responseData);

        // Assuming you have a function insertLocation to insert each location into the database


        return placesModel;
      } else {
        throw Exception('Failed to load locations');
      }
    } catch (e) {
      throw Exception('Failed to load locations: $e');
    }
  }

  Future<PlacesModel> fetchLocations({bool forceRefresh = false}) async {
    if (forceRefresh) {
      return fetchLocationsFromApi();
    }

    List<PlacesModel> cachedLocations = await fetchLocationsFromCache();
    if (cachedLocations.isNotEmpty) {
      // Assuming you want to return the first cached location
      return cachedLocations.first;
    }

    return fetchLocationsFromApi();
  }
}

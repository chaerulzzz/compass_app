import 'dart:convert';

import 'package:compass_app/domain/models/activity/activity.dart';
import 'package:flutter/services.dart';

import '../../../config/assets.dart';
import '../../../domain/models/continent/continent.dart';
import '../../../domain/models/destination/destination.dart';
import '../../../domain/models/user/user.dart';

class LocalDataService {
  List<Continent> getContinents() {
    return [
      const Continent(
        name: 'Europe',
        imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
      const Continent(
          name: 'Europe',
          imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
      const Continent(
          name: 'Europe',
          imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
      const Continent(
          name: 'Europe',
          imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
      const Continent(
          name: 'Europe',
          imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
      const Continent(
          name: 'Europe',
          imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
      const Continent(
          name: 'Europe',
          imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT'),
    ];
  }

  Future<List<Activity>> getActivities() async {
    final json = await _loadStringAsset(Assets.activities);
    return json.map<Activity>(Activity.fromJson).toList();
  }

  Future<List<Destination>> getDestinations() async {
    final json = await _loadStringAsset(Assets.destinations);
    return json.map<Destination>(Destination.fromJson).toList();
  }

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  }

  User getUser() {
    return const User(
      name: 'Sophie',
      picture: 'assets/user.jpg'
    );
  }
}
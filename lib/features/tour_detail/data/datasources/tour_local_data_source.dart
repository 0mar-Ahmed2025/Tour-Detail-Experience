import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/tour_package_model.dart';

abstract class TourLocalDataSource {
  Future<TourPackageModel> getTourPackageFixture();
}

class TourLocalDataSourceImpl implements TourLocalDataSource {
  final String fixturePath;

  const TourLocalDataSourceImpl({
    this.fixturePath = 'assets/json/tour_fixture.json',
  });

  @override
  Future<TourPackageModel> getTourPackageFixture() async {
    final String jsonString = await rootBundle.loadString(fixturePath);
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final response = TourPackageResponseModel.fromJson(jsonMap);

    if (response.ok && response.item != null) {
      return response.item!;
    } else {
      throw Exception('Invalid or missing local fixture data');
    }
  }
}

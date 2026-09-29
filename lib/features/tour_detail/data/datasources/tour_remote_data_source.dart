import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/tour_package_model.dart';

abstract class TourRemoteDataSource {
  Future<TourPackageModel> getTourPackageBySlug(String slug);
}

class TourRemoteDataSourceImpl implements TourRemoteDataSource {
  final DioClient dioClient;

  TourRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<TourPackageModel> getTourPackageBySlug(String slug) async {
    final response = await dioClient.instance.get(
      '${ApiConstants.tourDetailEndpoint}$slug',
    );

    final result = TourPackageResponseModel.fromJson(response.data);

    if (result.ok && result.item != null) {
      return result.item!;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'TOURS_PACKAGE_NOT_FOUND',
      );
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/data_source_switcher.dart';
import '../../domain/repositories/tour_repository.dart';
import '../datasources/tour_local_data_source.dart';
import '../datasources/tour_remote_data_source.dart';
import '../models/tour_package_model.dart';

class TourRepositoryImpl implements TourRepository {
  final TourRemoteDataSource remoteDataSource;
  final TourLocalDataSource localDataSource;

  TourRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, TourPackageModel>> getTourPackageDetails(
    String slug,
  ) async {
    if (DataSourceSwitcher.isFixtureMode) {
      try {
        final localData = await localDataSource.getTourPackageFixture();
        return Right(localData);
      } catch (e) {
        return const Left(ParsingFailure('Failed to load local fixture JSON'));
      }
    }

    try {
      final remoteData = await remoteDataSource.getTourPackageBySlug(slug);
      return Right(remoteData);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404 ||
          e.error == 'TOURS_PACKAGE_NOT_FOUND' ||
          (e.response?.data is Map &&
              e.response?.data['code'] == 'TOURS_PACKAGE_NOT_FOUND')) {
        return const Left(NotFoundFailure());
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure());
      }
      return Left(
        ServerFailure(
          e.response?.data['message'] as String? ??
              'An unexpected server error occurred',
        ),
      );
    } catch (e) {
      return Left(ParsingFailure(e.toString()));
    }
  }
}

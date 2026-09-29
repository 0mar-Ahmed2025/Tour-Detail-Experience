import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/tour_package_model.dart';

abstract class TourRepository {
  Future<Either<Failure, TourPackageModel>> getTourPackageDetails(String slug);
}
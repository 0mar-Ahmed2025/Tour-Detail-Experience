import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/tour_repository.dart';
import 'tour_detail_state.dart';

class TourDetailCubit extends Cubit<TourDetailState> {
  final TourRepository repository;

  TourDetailCubit({required this.repository}) : super(TourDetailInitial());

  Future<void> loadTourDetail(String slug) async {
    emit(TourDetailLoading());

    final result = await repository.getTourPackageDetails(slug);

    result.fold(
      (failure) {
        if (failure is NotFoundFailure) {
          emit(TourDetailNotFound(message: failure.message));
        } else {
          emit(TourDetailError(failure.message));
        }
      },
      (package) => emit(TourDetailSuccess(package)),
    );
  }
}
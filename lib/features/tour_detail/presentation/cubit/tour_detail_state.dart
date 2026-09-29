import 'package:equatable/equatable.dart';
import '../../data/models/tour_package_model.dart';

abstract class TourDetailState extends Equatable {
  const TourDetailState();

  @override
  List<Object?> get props => [];
}

class TourDetailInitial extends TourDetailState {}

class TourDetailLoading extends TourDetailState {}

class TourDetailSuccess extends TourDetailState {
  final TourPackageModel package;

  const TourDetailSuccess(this.package);

  @override
  List<Object?> get props => [package];
}

class TourDetailNotFound extends TourDetailState {
  final String message;

  const TourDetailNotFound({this.message = 'Tour package not found.'});

  @override
  List<Object?> get props => [message];
}

class TourDetailError extends TourDetailState {
  final String message;

  const TourDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

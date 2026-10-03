import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/cubit/tour_detail_cubit.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/cubit/tour_detail_state.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/tour_state_widgets.dart';

class TourDetailScreen extends StatelessWidget {
  final String slug;

  const TourDetailScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourDetailCubit, TourDetailState>(
      builder: (context, state) {
        if (state is TourDetailLoading || state is TourDetailInitial) {
          return const TourLoadingView();
        }
        if (state is TourDetailNotFound) {
          return const TourNotFoundView();
        }
        if (state is TourDetailError) {
          return TourErrorView(
            message: state.message,
            onRetry: () => context.read<TourDetailCubit>().loadTourDetail(slug),
          );
        }
        if (state is TourDetailSuccess) {
          final package = state.package;
          final String categoryName = package.tags.isNotEmpty
              ? package.tags.first.name.displayValue
              : 'Tour';
          final String suitabilityText = package.tags.isNotEmpty
              ? package.tags.first.description.displayValue
              : '';
          final hasPricing = package.pricing != null;
          final hasPrimaryPricing =
              hasPricing && package.pricing!.primary != null;

          return TourSuccessView(
            package: package,
            categoryName: categoryName,
            suitabilityText: suitabilityText,
            hasPrimaryPricing: hasPrimaryPricing,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

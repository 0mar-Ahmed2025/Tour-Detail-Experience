import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehletna_mobile/features/tour_detail/domain/extensions/tour_processing_extensions.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/accommodation_pricing_section_widget.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/bottom_booking_bar_widget.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/included_services_section_widget.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/quick_stats_bento_section_widget.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/segments_section.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/summary_description_card.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/tour_app_bar_widget.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/tour_hero_header_widget.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/transports_section.dart';
import '../cubit/tour_detail_cubit.dart';
import '../cubit/tour_detail_state.dart';
import '../widgets/tour_state_widgets.dart';

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

          return Scaffold(
            appBar: TourAppBarWidget(),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TourHeroHeaderWidget(
                    imageUrl: package.coverImageUrl ?? "",
                    location:
                        "${package.primaryCity}, ${package.primaryCountry}",
                    category: package.tags[0].name.displayValue,
                    slug: package.slug,
                    id: package.id.toString(),
                    title: package.title.displayValue,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Transform.translate(
                      offset: const Offset(0, -14),
                      child: Column(
                        children: [
                          QuickStatsBento(
                            durationText: package.durationText,
                            datesText:
                                "${package.defaultStartDate} - ${package.defaultEndDate}",
                            bookingModelText: package.bookingModel,
                          ),
                          const SizedBox(height: 20),
                          SummaryDescriptionCard(
                            packageSummary: package.summary.displayValue,
                            description: package.description.displayValue,
                            suitabilityText:
                                package.tags[0].description.displayValue,
                          ),
                          const SizedBox(height: 24),
                          SegmentsSection(segments: package.segments),
                          const SizedBox(height: 24),
                          TransportsSection(transports: package.transports),
                          const SizedBox(height: 24),
                          IncludedServicesSectionWidget(
                            services: package.sortedServices,
                          ),
                          const SizedBox(height: 24),
                          AccommodationPricingSectionWidget(
                            pricingModel: package.pricing!,
                            selectedCode: package.pricing!.primary!.code,
                            basePrice: package.basePriceFrom,
                            currency: package.currency,
                            isSelected: true,
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomBookingBarWidget(
              onRequestToBook: () {},
              startingPrice: package.pricing!.primary!.amount,
              currency: package.pricing!.currency,
              startingPriceIrt: package.basePriceFrom.toString(),
              packageCurrency: package.currency,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

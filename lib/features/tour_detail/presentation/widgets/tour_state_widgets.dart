import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/tour_package_model.dart';
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

class TourLoadingView extends StatelessWidget {
  const TourLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading tour package...'),
          ],
        ),
      ),
    );
  }
}

class TourErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const TourErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TourNotFoundView extends StatelessWidget {
  const TourNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off_outlined,
              size: 80,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            Text(
              'Tour Package Not Found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'The requested package slug does not exist.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class TourSuccessView extends StatelessWidget {
  const TourSuccessView({
    super.key,
    required this.package,
    required this.categoryName,
    required this.suitabilityText,
    required this.hasPrimaryPricing,
  });

  final TourPackageModel package;
  final String categoryName;
  final String suitabilityText;
  final bool hasPrimaryPricing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TourAppBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TourHeroHeaderWidget(
              imageUrl: package.coverImageUrl ?? "",
              location: "${package.primaryCity}, ${package.primaryCountry}",
              category: categoryName,
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
                          "${package.defaultStartDate ?? ''} - ${package.defaultEndDate ?? ''}",
                      bookingModelText: package.bookingModel,
                    ),
                    const SizedBox(height: 20),
                    SummaryDescriptionCard(
                      packageSummary: package.summary.displayValue,
                      description: package.description.displayValue,
                      suitabilityText: suitabilityText,
                    ),
                    const SizedBox(height: 24),

                    if (package.segments.isNotEmpty) ...[
                      SegmentsSection(segments: package.sortedSegments),
                      const SizedBox(height: 24),
                    ],

                    if (package.transports.isNotEmpty) ...[
                      TransportsSection(transports: package.sortedTransports),
                      const SizedBox(height: 24),
                    ],

                    if (package.services.isNotEmpty) ...[
                      IncludedServicesSectionWidget(
                        services: package.sortedServices,
                      ),
                      const SizedBox(height: 24),
                    ],

                    if (hasPrimaryPricing) ...[
                      AccommodationPricingSectionWidget(
                        pricingModel: package.pricing!,
                        selectedCode: package.pricing!.primary!.code,
                        basePrice: package.basePriceFrom,
                        currency: package.currency,
                        isSelected: true,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: hasPrimaryPricing
          ? BottomBookingBarWidget(
              onRequestToBook: () {},
              startingPrice: package.pricing!.primary!.amount,
              currency: package.pricing!.currency,
              startingPriceIrt: package.basePriceFrom.toString(),
              packageCurrency: package.currency,
            )
          : const SizedBox.shrink(),
    );
  }
}

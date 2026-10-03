import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/service_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/included_service_card_widget.dart';

class IncludedServicesSectionWidget extends StatelessWidget {
  final List<ServiceModel> services;

  const IncludedServicesSectionWidget({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(
              Icons.health_and_safety_outlined,
              size: 22,
              color: Color(0xFF7F5700),
            ),
            SizedBox(width: 8),
            Text(
              'Included Services',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF191C1E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return IncludedServiceCardWidget(service: services[index]);
          },
        ),
      ],
    );
  }
}

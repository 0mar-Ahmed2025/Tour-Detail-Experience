import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/circular_icon_button_widget.dart';

class TourAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onFavorite;
  final VoidCallback? onProfile;

  const TourAppBarWidget({
    super.key,
    this.onBack,
    this.onShare,
    this.onFavorite,
    this.onProfile,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'Tour Package Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF191C1E),
                  letterSpacing: -0.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            CircularIconButtonWidget(
              icon: Icons.language,
              onPressed: onFavorite,
            ),
          ],
        ),
      ),
    );
  }
}

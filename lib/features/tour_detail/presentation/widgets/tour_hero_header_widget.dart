import 'package:flutter/material.dart';

class TourHeroHeaderWidget extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String category;
  final String title;

  const TourHeroHeaderWidget({
    super.key,
    required this.imageUrl,
    required this.location,
    required this.category,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasValidImage = imageUrl.trim().isNotEmpty;

    return SizedBox(
      height: 320,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (hasValidImage)
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const _HeaderPlaceholder(),
            )
          else
            const _HeaderPlaceholder(),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.2),
                  Colors.transparent,
                  const Color(0xFF0F1C2C).withValues(alpha: 0.7),
                  const Color(0xFF0F1C2C).withValues(alpha: 0.98),
                ],
              ),
            ),
          ),

          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (location.trim().isNotEmpty)
                  _HeaderBadge(
                    icon: Icons.location_on,
                    iconColor: const Color(0xFF7F5700),
                    backgroundColor: Colors.white.withValues(alpha: 0.92),
                    textColor: const Color(0xFF191C1E),
                    text: location,
                  ),
                if (category.trim().isNotEmpty)
                  _HeaderBadge(
                    icon: Icons.sell,
                    iconColor: const Color(0xFF6F4B00),
                    backgroundColor: const Color(0xFFFDBA45),
                    textColor: const Color(0xFF6F4B00),
                    text: category,
                    isBold: true,
                  ),
              ],
            ),
          ),

          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.25,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBadge extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final bool isBold;

  const _HeaderBadge({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: iconColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderPlaceholder extends StatelessWidget {
  const _HeaderPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F1C2C),
      child: const Center(
        child: Icon(Icons.landscape, size: 64, color: Color(0xFF525F71)),
      ),
    );
  }
}

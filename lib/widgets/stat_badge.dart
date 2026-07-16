import 'package:flutter/material.dart';

class StatBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const StatBadge({
    super.key,
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = color ?? theme.colorScheme.primaryContainer;
    final foregroundColor = theme.colorScheme.onPrimaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: foregroundColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

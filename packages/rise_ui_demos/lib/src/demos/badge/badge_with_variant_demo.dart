import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BadgeWithVariantDemo extends StatelessWidget {
  const BadgeWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in [
          BadgeVariant.light,
          BadgeVariant.filled,
          BadgeVariant.outline,
        ])
          Badge(
            variant: variant,
            label: 'Badge',
          ),
      ],
    );
  }
}

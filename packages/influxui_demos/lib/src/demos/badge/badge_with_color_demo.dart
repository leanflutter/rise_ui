import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class BadgeWithColorDemo extends StatelessWidget {
  const BadgeWithColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in BadgeVariant.values)
          Wrap(
            spacing: 10,
            children: [
              for (final color in kExtendedColors)
                Badge(
                  variant: variant,
                  color: color,
                  label: 'Badge',
                ),
            ],
          ),
      ],
    );
  }
}

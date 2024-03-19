import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class ActionIconWithColorDemo extends StatelessWidget {
  const ActionIconWithColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          ActionIconVariant.filled,
          ActionIconVariant.light,
          ActionIconVariant.outline,
          ActionIconVariant.subtle,
          ActionIconVariant.transparent,
          ActionIconVariant.white,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kExtendedColors)
                ActionIcon(
                  ExtendedIcons.light_mode,
                  variant: variant,
                  color: color,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class ButtonWithSizeDemo extends StatelessWidget {
  const ButtonWithSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in ButtonVariant.values)
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              for (final size in kExtendedSizes)
                Button(
                  label: 'Button',
                  variant: variant,
                  size: size,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}

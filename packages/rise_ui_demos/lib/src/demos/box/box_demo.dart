import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BoxDemo extends StatelessWidget {
  const BoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Box(
      variant: BoxVariant.filled,
      builder: (context, foregroundColor) {
        return Container(
          width: 100,
          height: 100,
          color: foregroundColor,
        );
      },
    );
  }
}

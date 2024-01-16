import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon.dart';
import 'package:rise_ui/src/widgets/extended_theme/extended_icons.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionIcon(
      ExtendedIcons.square,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}

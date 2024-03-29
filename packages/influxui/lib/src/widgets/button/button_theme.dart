// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/button/button.dart';
import 'package:influxui/src/widgets/button/button_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'button_theme.tailor.dart';

@TailorMixin()
class ButtonThemeData extends ThemeExtension<ButtonThemeData>
    with DiagnosticableTreeMixin, _$ButtonThemeDataTailorMixin {
  const ButtonThemeData({
    this.pressedOpacity = 0.8,
    this.tinyStyle,
    this.smallStyle,
    this.mediumStyle,
    this.largeStyle,
    this.bigStyle,
  });

  final double pressedOpacity;

  final ButtonStyle? tinyStyle;
  final ButtonStyle? smallStyle;
  final ButtonStyle? mediumStyle;
  final ButtonStyle? largeStyle;
  final ButtonStyle? bigStyle;
}

class ButtonTheme extends InheritedTheme {
  const ButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ButtonThemeData data;

  static ButtonThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ButtonTheme>();
    return theme?.data ?? Theme.of(context).extension<ButtonThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) => data != oldWidget.data;
}

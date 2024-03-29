// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/divider/divider_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'divider_theme.tailor.dart';

@TailorMixin()
class DividerThemeData extends ThemeExtension<DividerThemeData>
    with DiagnosticableTreeMixin, _$DividerThemeDataTailorMixin {
  const DividerThemeData({
    this.color,
    this.smallStyle,
    this.mediumStyle,
    this.largeStyle,
  });

  final Color? color;

  final DividerStyle? smallStyle;
  final DividerStyle? mediumStyle;
  final DividerStyle? largeStyle;
}

class DividerTheme extends InheritedTheme {
  const DividerTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final DividerThemeData data;

  static DividerThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<DividerTheme>();
    return theme?.data ?? Theme.of(context).extension<DividerThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DividerTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(DividerTheme oldWidget) => data != oldWidget.data;
}

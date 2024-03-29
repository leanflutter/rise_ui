// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'loader_theme.tailor.dart';

@TailorMixin()
class LoaderThemeData extends ThemeExtension<LoaderThemeData>
    with DiagnosticableTreeMixin, _$LoaderThemeDataTailorMixin {
  const LoaderThemeData({
    this.color,
    this.tinySize,
    this.smallSize,
    this.mediumSize,
    this.largeSize,
    this.bigSize,
  });

  final Color? color;

  final Size? tinySize;
  final Size? smallSize;
  final Size? mediumSize;
  final Size? largeSize;
  final Size? bigSize;
}

class LoaderTheme extends InheritedTheme {
  const LoaderTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final LoaderThemeData data;

  static LoaderThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<LoaderTheme>();
    return theme?.data ?? Theme.of(context).extension<LoaderThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return LoaderTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(LoaderTheme oldWidget) => data != oldWidget.data;
}

import 'package:flutter/material.dart'
    hide ButtonStyle, ButtonTheme, ButtonThemeData;
import 'package:influxui/src/widgets/button/button_base.dart';
import 'package:influxui/src/widgets/button/button_style.dart';
import 'package:influxui/src/widgets/button/button_theme.dart';
import 'package:influxui/src/widgets/extended_theme/extended_sizes.dart';

export 'package:influxui/src/widgets/button/button_style.dart';
export 'package:influxui/src/widgets/button/button_theme.dart';

enum ButtonVariant {
  filled,
  outlined,
  light,
  subtle,
  transparent;
}

class ButtonSize extends Size {
  ButtonSize(super.width, super.height);
  static const ExtendedSize tiny = ExtendedSize.tiny;
  static const ExtendedSize small = ExtendedSize.small;
  static const ExtendedSize medium = ExtendedSize.medium;
  static const ExtendedSize large = ExtendedSize.large;
  static const ExtendedSize big = ExtendedSize.big;
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.variant = ButtonVariant.filled,
    this.label,
    this.labelBuilder,
    this.style,
    this.padding,
    this.color,
    this.size = ExtendedSize.medium,
    this.iconSize,
    this.onPressed,
  }) : assert(size is Size || size is ExtendedSize || size == null);

  final ButtonVariant? variant;
  final String? label;
  final WidgetBuilder? labelBuilder;
  final ButtonStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Size? size;
  final double? iconSize;
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final ButtonThemeData? themeData = ButtonTheme.of(context);
    final ButtonThemeData defaults = _ButtonDefaults(context);
    ButtonStyle mergedStyle = widget.style ?? const ButtonStyle();

    if (widget.size is ExtendedSize) {
      switch (widget.size) {
        case ExtendedSize.tiny:
          mergedStyle = mergedStyle // merge tiny style
              .merge(themeData?.tinyStyle)
              .merge(defaults.tinyStyle);
          break;
        case ExtendedSize.small:
          mergedStyle = mergedStyle // merge small style
              .merge(themeData?.smallStyle)
              .merge(defaults.smallStyle);
          break;
        case ExtendedSize.medium:
          mergedStyle = mergedStyle // merge medium style
              .merge(themeData?.mediumStyle)
              .merge(defaults.mediumStyle);
          break;
        case ExtendedSize.large:
          mergedStyle = mergedStyle // merge large style
              .merge(themeData?.largeStyle)
              .merge(defaults.largeStyle);
        case ExtendedSize.big:
          mergedStyle = mergedStyle // merge big style
              .merge(themeData?.bigStyle)
              .merge(defaults.bigStyle);
          break;
      }
    }
    if (widget.iconSize != null) {
      mergedStyle = mergedStyle.copyWith(iconSize: widget.iconSize);
    }

    return ButtonBase(
      variant: ButtonBaseVariant.valueOf(widget.variant?.name),
      padding: widget.padding ?? mergedStyle.padding,
      color: widget.color,
      borderRadius: mergedStyle.borderRadius,
      pressedOpacity: themeData?.pressedOpacity ?? defaults.pressedOpacity,
      mouseCursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      onPressed: widget.onPressed,
      builder: (context, foregroundColor) {
        return Container(
          constraints: BoxConstraints(
            minWidth: mergedStyle.minimumSize?.width ?? 0,
            minHeight: mergedStyle.minimumSize?.height ?? 0,
            maxWidth: mergedStyle.maximumSize?.width ?? double.infinity,
            maxHeight: mergedStyle.maximumSize?.height ?? double.infinity,
          ),
          child: DefaultTextStyle(
            style: (mergedStyle.labelStyle ?? const TextStyle()).copyWith(
              color: foregroundColor,
            ),
            child: IconTheme(
              data: IconThemeData(
                color: foregroundColor,
                size: mergedStyle.iconSize,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.labelBuilder?.call(context) ?? Text(widget.label!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ButtonDefaults extends ButtonThemeData {
  _ButtonDefaults(this.context) : super();

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);

  @override
  double get pressedOpacity => 0.8;

  @override
  ButtonStyle? get tinyStyle {
    return ButtonStyle(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(22),
      // iconSize: 16,
      labelStyle: _theme.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  ButtonStyle? get smallStyle {
    return ButtonStyle(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(22),
      // iconSize: 16,
      labelStyle: _theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  ButtonStyle? get mediumStyle {
    return ButtonStyle(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      // minimumSize: const Size.square(28),
      // iconSize: 20,
      labelStyle: _theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  ButtonStyle? get largeStyle {
    return ButtonStyle(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      // minimumSize: const Size.square(34),
      // iconSize: 24,
      labelStyle: _theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  ButtonStyle? get bigStyle {
    return ButtonStyle(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      // minimumSize: const Size.square(34),
      // iconSize: 24,
      labelStyle: _theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

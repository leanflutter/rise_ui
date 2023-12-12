// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gallery/router_config.dart';
import 'package:gallery/themes/themes.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class DefaultIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => TablerIcons.chevron_left;

  @override
  IconData get chevron_right => TablerIcons.chevron_right;

  @override
  IconData get square => TablerIcons.square;

  @override
  IconData get light_mode => TablerIcons.sun;

  @override
  IconData get dark_mode => TablerIcons.moon;
}

Future<void> _ensureInitialized() async {
  Icons.iconLibrary = DefaultIconLibrary();
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
}

void main() async {
  await _ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final md.ThemeMode _themeMode = md.ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return md.MaterialApp.router(
      theme: lightThemeData,
      darkTheme: darkThemeData,
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      builder: (context, child) {
        child = Theme(
          data: ThemeData(
            brightness: _themeMode == md.ThemeMode.dark
                ? Brightness.dark
                : Brightness.light,
            primaryColor: Colors.indigo,
          ),
          child: child!,
        );
        return child;
        // return Stack(
        //   children: [
        //     child,
        //     Positioned(
        //       right: 20,
        //       bottom: 20,
        //       child: ActionIcon(
        //         _themeMode == md.ThemeMode.light
        //             ? TablerIcons.sun
        //             : TablerIcons.moon,
        //         variant: ActionIconVariant.filled,
        //         onPressed: () {
        //           _themeMode = _themeMode == md.ThemeMode.light
        //               ? md.ThemeMode.dark
        //               : md.ThemeMode.light;
        //           setState(() {});
        //         },
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}

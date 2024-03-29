import 'package:go_router/go_router.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/influxui_demos.dart';

class BootstrapPage extends StatefulWidget {
  const BootstrapPage({super.key});

  @override
  State<BootstrapPage> createState() => _BootstrapPageState();
}

class _BootstrapPageState extends State<BootstrapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String firstDemoId = kKnownDemos.keys.first;
      context.go('/demo/$firstDemoId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Loader(),
      ),
    );
  }
}

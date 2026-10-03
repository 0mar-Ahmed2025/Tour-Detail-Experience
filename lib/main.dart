import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/utils/data_source_switcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DataSourceSwitcher.toggleMode(DataSourceMode.fixture);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tour Package Detail',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

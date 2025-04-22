import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application/my_app.dart';
import 'dependencies_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SystemChrome.setPreferredOrientations([]).then((_) {
    runApp(
      const MyApp(),
    );
  });
}

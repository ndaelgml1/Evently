import 'package:easy_localization/easy_localization.dart';
import 'package:evently/evently_app.dart';
import 'package:evently/pref_manager.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/services/fcm_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FCMServices.init();
  await PrefManager.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: "assets/translations",
      fallbackLocale: Locale("en"),

      child: ChangeNotifierProvider(
        child: EventlyApp(),
        create: (context) => ThemeProvider()..init(),
      ),
    ),
  );
}

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: Builder(
        builder: (context) {
          ThemeProvider provider = Provider.of<ThemeProvider>(context);
          return ScreenUtilInit(
            designSize: const Size(398, 841),
            splitScreenMode: true,
            minTextAdapt: true,
            builder:
                (context, child) => MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeManager.light,
                  darkTheme: ThemeManager.dark,
                  themeMode: provider.themeMode,
                  onGenerateRoute: RoutesManager.router,
                  initialRoute:
                      FirebaseAuth.instance.currentUser != null
                          ? RoutesManager.home
                          : RoutesManager.startScreen,
                ),
          );
        },
      ),
    );
  }
}

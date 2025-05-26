import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/reusable_component/custom_elevated_button.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
import 'package:evently/core/resources/strings_manager.dart';
import 'package:evently/core/reusable_component/custom_switch.dart';
import 'package:evently/pref_manager.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int selectedLanguage = 0;
  int selectedTheme = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    selectedLanguage = context.locale.languageCode == "ar" ? 1 : 0;
    selectedTheme = provider.themeMode == ThemeMode.dark ? 1 : 0;
    return Scaffold(
      appBar: AppBar(title: Image.asset(AssetsManager.logoAppbar)),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? AssetsManager.startLight
                  : AssetsManager.startDark,
            ),
            SizedBox(height: 10.h),
            Text(
              StringsManager.startTitle.tr(),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 18.h),
            Text(
              StringsManager.startDesc.tr(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.language.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),

                CustomSwitch(
                  icon1: AssetsManager.us,
                  icon2: AssetsManager.eg,
                  isColored: false,
                  selected: selectedLanguage,
                  onChange: (value) {
                    setState(() {
                      selectedLanguage = value;
                      if (value == 1) {
                        context.setLocale(Locale('ar'));
                      } else {
                        (context.setLocale(Locale('en')));
                      }
                    });
                  },
                ),
              ],
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.theme.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomSwitch(
                  icon1: AssetsManager.sun,
                  icon2: AssetsManager.moon,
                  isColored: true,
                  selected: selectedTheme,
                  onChange: (value) {
                    setState(() {
                      selectedTheme = value;
                      if (selectedTheme == 1) {
                        provider.changeTheme(ThemeMode.dark);
                        PrefManager.saveThemeMode(true);
                      } else {
                        provider.changeTheme(ThemeMode.light);
                        PrefManager.saveThemeMode(false);
                      }
                    });
                  },
                ),
              ],
            ),
            Spacer(),

            CustomElevatedButton(
              title: StringsManager.letsStart.tr(),
              onClick: () {
                Navigator.pushReplacementNamed(context, RoutesManager.register);
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

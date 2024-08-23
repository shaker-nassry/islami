import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth/hadethdetails.dart';
import 'package:islami/mytheme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/soradetails.dart';
import 'package:islami/settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hometabs/home_screen.dart';

//================================>
void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigprovider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigprovider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigprovider>(context);
    initSharedPref();
    return MaterialApp(
      initialRoute: HomeScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        "Soradetails": (context) => Soradetails(),
        "hadeth details": (context) => hadethdetails(),
        "Settingstab": (context) => Settingstab(),
      },
      theme: MyTheme.lightmode,
      darkTheme: MyTheme.darkmode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applang),
      themeMode: provider.appTheme,
    );
  }

  void initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String langPrefs = prefs.getString('langSP') ?? 'ar';
    provider.changelang(langPrefs);
    String? themePrefs = prefs.getString('themeSP') ;
    if (themePrefs == 'light') {
      provider.changetheme(ThemeMode.light);
    } else if (themePrefs == 'dark') {
      provider.changetheme(ThemeMode.dark);
    }
  }
}
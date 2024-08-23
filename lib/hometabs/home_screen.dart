import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth/hadethtab.dart';
import 'package:islami/hometabs/radiotab.dart';
import 'package:islami/hometabs/sebhatab.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/quran/qurantab.dart';
import 'package:islami/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Stack(
      children: [
        provider.isdarkmode()
            ? Image.asset(
                'assets/images/main_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quranbook.png')),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: tabs[selectedindex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    Qurantab(),
    Hadethtab(),
    Sebhatab(),
    Radiotab(),
    Settingstab()
  ];
}

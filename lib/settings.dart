import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:islami/languagesheet.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/themesheet.dart';
import 'package:provider/provider.dart';

class Settingstab extends StatefulWidget {
  static String routename = 'Settingstab';


  @override
  State<Settingstab> createState() => _SettingstabState();
}

class _SettingstabState extends State<Settingstab> {

  bool themeStatu = false  ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    if(provider.appTheme == ThemeMode.light){
      themeStatu= false ;
    } else {themeStatu = true ;}

    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.labelLarge),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
            height: 35,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 2)),
            child: InkWell(
              onTap: () {
                Showlaguagesheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.language,
                      style: Theme.of(context).textTheme.labelMedium),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Theme.of(context).dividerColor,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                child: FlutterSwitch(
                  width: 95.0,
                  height: 55.0,
                  valueFontSize: 15.0,
                  toggleSize: 45.0,
                  value: themeStatu ,
                  borderRadius: 30.0,
                  padding: 8.0,
                      activeToggleColor: Color(0xFF6E40C9),
                      inactiveToggleColor: Color(0xFF2F363D),
                      activeSwitchBorder: Border.all(
                      color: Color(0xFF3C1E70),
                      width: 6.0,
                      ),
                      inactiveSwitchBorder: Border.all(
                      color: Color(0xFFD1D5DA),
                      width: 6.0,
                      ),
                      activeColor: Color(0xFF271052),
                      inactiveColor: Colors.white,
                      activeIcon: Icon(
                      Icons.nightlight_round,
                      color: Color(0xFFF8E3A1),
                      ),
                      inactiveIcon: Icon(
                      Icons.wb_sunny,
                      color: Color(0xFFFFDF5D), ) ,
                        onToggle: (val) {
                    setState(() {
                      themeStatu = val ;
                      provider.changetheme(ThemeMode.dark) ;

                      if (themeStatu == false ){
                        provider.changetheme(ThemeMode.light)  ;
                      }

                    });
                  },
                ),
              ),
            ],
          ),
          /*Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
            height: 100,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 2)),
            child: InkWell(
              onTap: () {
                Showthemesheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  //Icon(Icons.keyboard_arrow_down_outlined,
                  //    color: Theme.of(context).dividerColor)


                ],
              ),
            ),
          ),*/
        ],
      ),
    );

  }




  void Showlaguagesheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => languagesheet(),
    );
  }

  void Showthemesheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => themesheet(),
    );
  }
}

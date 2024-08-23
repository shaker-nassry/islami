import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class themesheet extends StatefulWidget {
  @override
  State<themesheet> createState() => _themesheetState();
}

class _themesheetState extends State<themesheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changetheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? Selecteditem(AppLocalizations.of(context)!.light)
                : unSelecteditem(AppLocalizations.of(context)!.light),
          ),
          InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.dark);
              },
              child: provider.appTheme == ThemeMode.dark
                  ? Selecteditem(AppLocalizations.of(context)!.dark)
                  : unSelecteditem(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget Selecteditem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).dividerColor,
          ),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }

  Widget unSelecteditem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ],
    );
  }
}

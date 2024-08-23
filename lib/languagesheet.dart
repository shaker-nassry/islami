import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class languagesheet extends StatefulWidget {
  @override
  State<languagesheet> createState() => _languagesheetState();
}

class _languagesheetState extends State<languagesheet> {

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
              provider.changelang('en');
            },
            child: provider.applang == 'en'
                ? Selecteditem(AppLocalizations.of(context)!.english)
                : unSelecteditem(AppLocalizations.of(context)!.english),
          ),
          InkWell(
            onTap: () {
              provider.changelang('ar');
              Selecteditem(AppLocalizations.of(context)!.arabic);
            },
            child: provider.applang == 'ar'
                ? Selecteditem(AppLocalizations.of(context)!.arabic)
                : unSelecteditem(AppLocalizations.of(context)!.arabic),
          ),
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
            color: Theme.of(context).primaryColor,
          ),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
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

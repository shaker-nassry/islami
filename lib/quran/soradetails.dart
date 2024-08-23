import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Soradetails extends StatefulWidget {
  static String routename = 'Soradetails';

  @override
  State<Soradetails> createState() => _SoradetailsState();
}

class _SoradetailsState extends State<Soradetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDETArgs;
    var provider = Provider.of<AppConfigprovider>(context);

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
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
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(255, 255, 255, 200),
          ),
          child: Column(
            children: [
              Text(
                '${args.name}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Divider(color: Theme.of(context).dividerColor),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.transparent,
                      thickness: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Text(verses[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium);
                  },
                  itemCount: verses.length,
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDETArgs {
  //data class
  String name;

  int index;

  SuraDETArgs({required this.name, required this.index});
}

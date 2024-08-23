import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class hadethdetails extends StatefulWidget {
  static String routename = 'hadeth details';

  @override
  State<hadethdetails> createState() => _hadethdetailsState();
}

class _hadethdetailsState extends State<hadethdetails> {
  List<List<String>> PAllahadeth = [];

  @override
  Widget build(BuildContext context) {
    //List<Text> names = content ;
    var args = ModalRoute.of(context)?.settings.arguments as HadethDETArgs;
    var provider = Provider.of<AppConfigprovider>(context);
    if (PAllahadeth.isEmpty) {
      loadhadethFile();
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
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 0.5,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.transparent,
                      thickness: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Text(PAllahadeth[args.hadethNum][index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium);
                  },
                  itemCount: PAllahadeth[args.hadethNum].length,
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  void loadhadethFile() async {
    String allfile = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> eachone = allfile.split('#\r\n');
    for (int i = 0; i < eachone.length; i++) {
      List<String> Allahadeth = eachone[i].split('\n');
      Allahadeth.removeAt(0);

      PAllahadeth.add(Allahadeth);
    }
    setState(() {});
  }
}

class HadethDETArgs {
  //data class
  String name;

  int hadethNum;

  HadethDETArgs({required this.name, required this.hadethNum});
}

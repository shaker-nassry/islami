import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hadethdetails.dart';

class Hadethtab extends StatelessWidget {
  List<String> list() {
    List<String> hadethnames = [];

    for (int i = 1; i <= 50; i++) {
      hadethnames.add('الحديث رقم $i ');
    }
    return hadethnames;
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = list();

    return Column(
      children: [
        Center(child: Image.asset('assets/images/besmelah.png')),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).dividerColor,
                thickness: 0.5,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    hadethdetails.routename,
                    arguments:
                        HadethDETArgs(name: names[index], hadethNum: index),
                  );
                },
                child: Text(names[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium),
              );
            },
            itemCount: names.length,
          ),
        )
      ],
    );
  }
}

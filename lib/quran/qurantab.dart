import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/quran/soradetails.dart';

class Qurantab extends StatelessWidget {
  static String routename = 'Qurantab';
  List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/quranimage.png')),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
        ),
        Text(AppLocalizations.of(context)!.suraname,
            style: Theme.of(context).textTheme.labelLarge),
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
                  Navigator.of(context).pushNamed(Soradetails.routename,
                      arguments: SuraDETArgs(name: names[index], index: index));
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
/*Column (children: [
              Center(child: Image.asset('assets/images/quranimage.png')),
            Divider(
              color: MyTheme.primarylight,
              thickness: 2,
            ),
            Text('Sura Name' ,
              style: MyTheme.lightmode.textTheme.titleMedium ,) ,
            Divider(
              color: MyTheme.primarylight,
              thickness: 2,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index){
                  return Divider(
                    color: MyTheme.primarylight,
                    thickness: 0.5,
                  );
                },
                  itemBuilder: (context, index){
                    return Text(names [index] ,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold

                    ),) ;
              },
                itemCount: names.length,
              ),
            )


          ],),
          */

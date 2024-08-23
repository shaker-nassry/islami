import 'package:flutter/material.dart';

class Sebhatab extends StatefulWidget {
  static String routename = 'Sebhatab';

  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  int counter = 0;

  List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
  ];
  int index = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/sebhahead.png'),
          InkWell(
              onTap: ontap,
              child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/sebhabody.png'))),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: ontap,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).dividerColor,
              ),
              child: Center(
                child: Text(
                  '$counter',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: ontap,
            child: Container(
              height: 35,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Theme.of(context).dividerColor,
              ),
              child: Text(
                '${tasbeh[index]}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ontap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    ;
    angle += 2;
    setState(() {});
  }
}

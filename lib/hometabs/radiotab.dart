import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami/hometabs/RadioApi.dart';
import 'package:islami/hometabs/radio_item%20_widget.dart';

class Radiotab extends StatefulWidget {
  static String routename = 'Radiotab';

  @override
  State<Radiotab> createState() => _RadiotabState();
}

class _RadiotabState extends State<Radiotab> {
  var audioplayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRadios(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var radio = snapshot.data?.radios ?? [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2, child: Image.asset('assets/images/radiobig.png')),
              Expanded(
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RadioItem(
                        radio: radio[index],
                        audioPlayer: audioplayer,
                      )),
                  itemCount: radio.length,
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return
              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Failed to load radios' ,
                  style: TextStyle(
                    fontSize: 40 , fontWeight: FontWeight.bold ,
                  ),),
                  InkWell(
                    onTap: (){
                      Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).dividerColor,
                        ),
                      );
                      setState(() {
                        getRadios();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).dividerColor,
                      ),
                      child: Text(
                        'Try again / اعادة المحاولة',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  )
                ],
              ) ,);
        }
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).dividerColor,
          ),
        );
      },
    );
  }

  Future<RadioApi> getRadios() async {
    var uri = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RadioApi.fromJson(json);
    } else {
      throw Exception('Failed to load radios');
    }
  }
}

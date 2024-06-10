import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../core/localizations.dart';
import '../../widgets/page/appbar.dart';

class i5buy extends StatefulWidget {
  const i5buy({super.key});

  @override
  State<i5buy> createState() => _i5buyState();
}

final String targetPageURL = "https://www.google.com/maps";
void maps() async {
  if (await canLaunch(targetPageURL)) {
    await launch(targetPageURL);
  } else {
    throw 'Sayfa açılamıyor: $targetPageURL';
  }
}

class _i5buyState extends State<i5buy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      appBar: myappbar(
        bar: AppLocalizations.of(context).getTranslate("back"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            i5(),
            Gap(20),
            location('İstanbul --- Kadıköy Borusan Oto'),
            location('Ankara  --- Çankaya Yamanlar Oto '),
            location('Almanya  --- Düsseldorf '),
            location('İzmir  --- Çeşme Tunalar Oto '),
          ],
        ),
      ),
    );
  }

  Widget location(String konum) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 550,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(151, 220, 220, 220)),
            child: Padding(
              padding: const EdgeInsets.only(left: 45.0, right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.pin_drop,
                    size: 35,
                  ),
                  Text(konum),
                  ElevatedButton(
                    onPressed: maps,
                    child: Text(
                      AppLocalizations.of(context).getTranslate("git"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 34, 38, 43), // Buton arka plan rengi
                      onPrimary: Color.fromARGB(
                          255, 248, 249, 249), // Buton üzerindeki yazı rengi
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container i5() {
    return Container(
      width: double.infinity,
      height: 550,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), // Sol üst köşeyi yuvarlar
            topRight: Radius.circular(25), // Sağ üst köşeyi yuvarlar
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          color: Color.fromARGB(255, 32, 36, 40)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/bmw.png",
                width: 450,
                height: 450,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context).getTranslate("bayiler"),
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                Text(
                  "BMW İ5",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

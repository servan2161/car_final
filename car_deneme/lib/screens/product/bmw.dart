import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/localizations.dart';
import '../../widgets/page/appbar.dart';

class bmw extends StatefulWidget {
  const bmw({super.key});

  @override
  State<bmw> createState() => _bmwState();
}

class _bmwState extends State<bmw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      appBar: myappbar(
        bar: AppLocalizations.of(context).getTranslate("back"),
      ),
      body: Column(
        children: [i5(), features()],
      ),
    );
  }

  Container features() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), // Sol üst köşeyi yuvarlar
            topRight: Radius.circular(25), // Sağ üst köşeyi yuvarlar
          ),
          color: Color.fromARGB(255, 248, 249, 249)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "BMW İ5",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context).getTranslate("i5"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context).getTranslate("features"),
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Gap(17),
            Row(
              children: [
                features_container(
                    Icons.airline_seat_recline_extra, "seat", "seat_number"),
                Gap(17),
                features_container(Icons.speed, "speed", "speed_number"),
                Gap(17),
                features_container(Icons.tune, "engine", "engine_number"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container features_container(IconData icon, String header, String header2) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color.fromARGB(209, 228, 229, 229),
      ),
      width: 150,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.transparent,
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 52, 55, 60))),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      icon,
                      size: 45,
                      color: Color.fromARGB(255, 32, 36, 40),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate(header),
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                )
              ],
            ),
            Gap(20),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate(header2),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container i5() {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), // Sol üst köşeyi yuvarlar
            topRight: Radius.circular(25), // Sağ üst köşeyi yuvarlar
          ),
          color: Color.fromARGB(255, 32, 36, 40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/images/bmw.png",
            width: 450,
            height: 450,
          )
        ],
      ),
    );
  }
}

import 'package:car_project_vize/bloc/client/client_cubit.dart';
import 'package:car_project_vize/core/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../widgets/page/bottom.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late ClientCubit clientCubit;
  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context)
            .colorScheme
            .background, //Color.fromARGB(255, 217, 219, 221),
        body: Column(
          children: [
            header(),
            Gap(40),
            searchbox(context),
            Gap(40),
            model(),
            Gap(40),
            Expanded(child: cars()),
          ],
        ),
      ),
    );
  }

  Container cars() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), // Sol üst köşeyi yuvarlar
            topRight: Radius.circular(25), // Sağ üst köşeyi yuvarlar
          ),
          color: Color.fromARGB(255, 32, 36, 40)),
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 50, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).getTranslate("car_title"),
                      style: TextStyle(
                          color: Color.fromARGB(221, 255, 255, 255),
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
              cars_product("assets/images/bmw.png", "İ5", "40000 TL",
                  "assets/images/audi.png", "RS6", "30000 TL"),
              Gap(20),
              cars_product("assets/images/bmw.png", "i5", "40000 TL",
                  "assets/images/woswagen.png", "RS6", "30000 TL"),
              Gap(20),
              cars_product("assets/images/woswagen.png", "Tiguan", "40000 TL",
                  "assets/images/audi.png", "RS6", "30000 TL"),
              Gap(20),
              cars_product("assets/images/woswagen.png", "Tiguan", "40000 TL",
                  "assets/images/audi.png", "RS6", "30000 TL"),
              Gap(20),
              cars_product("assets/images/woswagen.png", "Tiguan", "40000 TL",
                  "assets/images/audi.png", "RS6", "30000 TL"),
            ],
          ),
        ),
      ),
    );
  }

  Row cars_product(String car, String marka, String fiyat, String cartwo,
      String markatwo, String fiyattwo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        product(car, marka, fiyat),
        product(cartwo, markatwo, fiyattwo),
      ],
    );
  }

  GestureDetector product(String image, String price, String name) {
    return GestureDetector(
      onTap: () {
        context.push("/bmw");
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Köşeleri yuvarlar
          color: Colors.white, // Arka plan rengi
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Column(
            children: [
              Image.asset(
                image,
                width: 180,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 32, 36, 40),
                        minimumSize: Size(100, 35),
                      ),
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).getTranslate("buy"),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 248, 249, 249)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container model() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            story("assets/images/mercedeslogo.jpg", "MERCEDES"),
            story("assets/images/bmwlogo.jpg", "BMW"),
            story("assets/images/auidilogo.jpg", "AUDİ"),
            story("assets/images/LAMBOLOGO.jpg", "LAMBORGİNİ"),
            story("assets/images/ROYCELOGO.jpg", "ROLLS ROYCE"),
            story("assets/images/MASERATI.jpg", "MASERATI"),
            story("assets/images/fordlogo.jpg", "FORD"),
          ],
        ),
      ),
    );
  }

  Container searchbox(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 50),
        child: TextField(
          style: TextStyle(
              //backgroundColor: Color.fromRGBO(249, 249, 249, 1),
              ),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).getTranslate("Search"),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15), // Yumuşatılmış kenar yarıçapı
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 10.0,
              right: 5.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(15), // Yumuşatılmış kenar yarıçapı
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(25), // Yumuşatılmış kenar yarıçapı
              borderSide: BorderSide(
                  color: Color.fromARGB(
                      255, 159, 159, 159)), // Varsayılan border rengi
            ),
            labelStyle: TextStyle(color: Color.fromRGBO(155, 154, 154, 1)),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.filter_list,
                color: Color.fromARGB(255, 129, 129, 129),
              ),
            ),
          ),
          cursorColor: Colors.black, // Yazma imleci rengi
        ),
      ),
    );
  }

  Container header() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 40, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 60,
                ),
                Gap(10),
                Text(
                  "Servan And Ceren",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Icon(Icons.notifications)
          ],
        ),
      ),
    );
  }
}

Widget story(String photo, String name) {
  return Padding(
    padding: const EdgeInsets.only(right: 14),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 238, 247),
                shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage: AssetImage(photo),
              radius: 33,
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

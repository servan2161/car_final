import 'package:car_project_vize/core/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/client/client_cubit.dart';
import '../widgets/page/appbar.dart';

class device extends StatefulWidget {
  const device({super.key});

  @override
  State<device> createState() => _homeState();
}

class _homeState extends State<device> {
  String selectedLanguage = ''; // Seçili dilin tutulacağı değişken
  late SharedPreferences prefs; // SharedPreferences nesnesi
  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage(); // Kayıtlı dil bilgisini yükle
  }

  // Kayıtlı dil bilgisini yükleyen fonksiyon
  _loadSelectedLanguage() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('selectedLanguage') ??
          ''; // Kayıtlı dil bilgisini yükle, yoksa boş bir string kullan
    });
  }

  // Seçilen dil bilgisini kaydeden fonksiyon
  _saveSelectedLanguage(String language) async {
    await prefs.setString(
        'selectedLanguage', language); // Seçilen dil bilgisini kaydet
  }

  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      appBar: myappbar(
        bar: AppLocalizations.of(context).getTranslate("back"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(209, 228, 229, 229),
                borderRadius: BorderRadius.circular(18),
              ),
              width: 500,
              height: 90,
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LangItems(
                          context,
                          AppLocalizations.of(context).getTranslate(
                            "turkce",
                          ),
                          "tr"),
                      LangItems(
                          context,
                          AppLocalizations.of(context).getTranslate(
                            "englsih",
                          ),
                          "en"),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(209, 228, 229, 229),
                borderRadius: BorderRadius.circular(18),
              ),
              width: 500,
              height: 90,
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      darkItems(
                          context,
                          AppLocalizations.of(context).getTranslate(
                            "dark",
                          ),
                          true),
                      darkItems(
                          context,
                          AppLocalizations.of(context).getTranslate(
                            "light",
                          ),
                          false),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget LangItems(
    BuildContext context,
    String name,
    String language,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: selectedLanguage == language
            ? null
            : () {
                setState(() {
                  selectedLanguage = language; // Seçilen dili güncelle
                  _saveSelectedLanguage(
                      language); // Seçilen dil bilgisini kaydet
                  context
                      .read<ClientCubit>()
                      .changeLanguage(language: language);
                });
              },
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Gap(20),
                  Text(name),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget darkItems(
    BuildContext context,
    String name,
    bool mode,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            context.read<ClientCubit>().changeDarkMode(darkMode: mode);
          });
        },
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Gap(20),
                  Text(name),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

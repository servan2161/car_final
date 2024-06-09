import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class loader extends StatefulWidget {
  const loader({super.key});

  @override
  State<loader> createState() => _loaderState();
}

class _loaderState extends State<loader> {
  loadapp() async {
    final storage = Storage();

    await storage.clearstorage(); // hafıza temizleme
    final firstlauched = await storage.isfirstlaunch();

    if (firstlauched) {
      const darkmode = ThemeMode.system == ThemeMode.dark;

      await storage.setConfig(
          language: getdevicelanguage(), darkMode: darkmode);

      GoRouter.of(context).replace("/boarding");
    } else {
      final config = await storage.getConfig();

      if (config["language"] == null) {
        storage.setConfig(language: getdevicelanguage());
      }
      if (config["darkmode"] == null) {
        const darkmode = ThemeMode.system == ThemeMode.dark;
        await storage.setConfig(darkMode: darkmode);
      }
      GoRouter.of(context).replace("/login");
    }
  }

  getdevicelanguage() {
    final String defaultLocale;
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }

    final langparts = defaultLocale.split("_");
    final supportedlanguages = ["en", "tr"];

    final String finallang;

    if (supportedlanguages.contains(langparts[0])) {
      finallang = langparts[0];
    } else {
      finallang = "en";
    }
    return finallang;
  }

  @override
  void initState() {
    super.initState();
    loadapp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:car_project_vize/bloc/client/client_cubit.dart';
import 'package:car_project_vize/core/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class home_deneme extends StatefulWidget {
  const home_deneme({super.key});

  @override
  State<home_deneme> createState() => _homeState();
}

class _homeState extends State<home_deneme> {
  late ClientCubit clientCubit;
  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            Text("language: " + clientCubit.state.language),
            Text("dark mode: " + clientCubit.state.darkmode.toString()),
            Divider(),
            ElevatedButton(
                onPressed: clientCubit.state.language == "en"
                    ? null
                    : () {
                        clientCubit.changeLanguage(language: "en");
                      },
                child: Text("english")),
            Gap(20),
            ElevatedButton(
                onPressed: clientCubit.state.language == "tr"
                    ? null
                    : () {
                        clientCubit.changeLanguage(language: "tr");
                      },
                child: Text("türkçe")),
            Divider(),
            ElevatedButton(
                onPressed: () {
                  clientCubit.changeDarkMode(darkMode: false);
                },
                child: Text("gündüz modu")),
            Gap(20),
            ElevatedButton(
                onPressed: () {
                  clientCubit.changeDarkMode(darkMode: true);
                },
                child: Text("gece modu")),
            Gap(20),
            Text(AppLocalizations.of(context).getTranslate("home_title"))
          ],
        ),
      ),
    );
  }
}

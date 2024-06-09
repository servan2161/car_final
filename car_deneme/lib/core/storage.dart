import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isfirstlaunch() async {
    final SharedPreferences Storage = await SharedPreferences.getInstance();
    final runned = Storage.getBool("runned");

    if (runned == null) {
      return true;
    } else {
      return false;
    }
  }

  setConfig({String? language, bool? darkMode}) async {
    final SharedPreferences Storage = await SharedPreferences.getInstance();

    if (language != null) {
      await Storage.setString("language", language);
    }
    if (darkMode != null) {
      await Storage.setBool("darkmode", darkMode);
    }
  }

  getConfig() async {
    final SharedPreferences Storage = await SharedPreferences.getInstance();
    return {
      "language": Storage.getString("language"),
      "darkmode": Storage.getBool("darkmode"),
    };
  }

  firstlauched() async {
    final SharedPreferences Storage = await SharedPreferences.getInstance();
    await Storage.setBool("runned", true);
  }

  clearstorage() async {
    final SharedPreferences Storage = await SharedPreferences.getInstance();
    await Storage.clear();
  }
}

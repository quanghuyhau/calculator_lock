import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLanguageToNative(String languageCode) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);

    const platform = MethodChannel('atm.soundbox.channel');
    await platform.invokeMethod('setLanguageCode', {'languageCode': languageCode});
  } catch (e) {
    print("Error saving languageCode to native: $e");
  }
}

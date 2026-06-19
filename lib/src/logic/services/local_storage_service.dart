import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late final SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async =>
      await sharedPreferences.setString(key, value);
  static String? getString(String key) => sharedPreferences.getString(key);

  static Future<void> setBool(String key, bool value) async =>
      await sharedPreferences.setBool(key, value);
  static bool? getBool(String key) => sharedPreferences.getBool(key);

  static Future<void> setInt(String key, int value) async =>
      await sharedPreferences.setInt(key, value);
  static int? getInt(String key) => sharedPreferences.getInt(key);

  static String get userId => getString("user_id") ?? "";
  static set userId(String value) => setString("user_id", value);

  static String get companyId => getString("company_id") ?? "";
  static set companyId(String value) => setString("company_id", value);

  static bool get welcomed => getBool("welcomed") ?? false;
  static set welcomed(bool value) => setBool("welcomed", value);

  static bool get notificationsSet => getBool("notifications_set") ?? false;
  static set notificationsSet(bool value) =>
      setBool("notifications_set", value);

  static set token(String value) => setString("token", value);
  static String get token => getString("token") ?? "";

  static int get notificationsCount => getInt("notifications_count") ?? 0;
  static set notificationsCount(int value) =>
      setInt("notifications_count", value);

  static DateTime? get lastClientsFetch =>
      DateTime.tryParse(getString("last_clients_fetch") ?? "");
  static set lastClientsFetch(DateTime? value) =>
      setString("last_clients_fetch", value?.toString() ?? "");

  static DateTime? get lastLocalDate =>
      DateTime.tryParse(getString("last_local_date") ?? "");
  static set lastLocalDate(DateTime? value) =>
      setString("last_local_date", value?.toString() ?? "");

  static bool get disconnectionBlocking =>
      getBool("disconnection_blocking") ?? false;
  static set disconnectionBlocking(bool value) =>
      setBool("disconnection_blocking", value);

  static bool get pastOrdersFetch => getBool("past_orders_fetch") ?? false;
  static set pastOrdersFetch(bool value) => setBool("past_orders_fetch", value);

  static set type(String value) => setString("type", value);
  static String get type => getString("type") ?? "";

  static bool get onboarded => getBool("onboarded") ?? false;
  static set onboarded(bool value) => setBool("onboarded", value);

  static set currency(String value) => setString("currency", value);
  static String get currency => getString("currency") ?? "";

  static bool get xof => currency == "FCFA";

  static String get activeFeature =>
      getString("active_feature") ?? "product_to_model";
  static set activeFeature(String value) => setString("active_feature", value);

  ///

  static bool get initialized => companyId.isNotEmpty;
  static bool get authenticated => userId.isNotEmpty;

  static Future<void> clear() async {
    await sharedPreferences.clear();

    welcomed = true;
    notificationsSet = true;
  }
}

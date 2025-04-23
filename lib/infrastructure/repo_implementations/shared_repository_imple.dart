import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/shared_repository.dart';

class SharedRepositoryImple extends SharedRepository {
  static const String _kIsFirstTimeOpened = 'isFirstTimeOpened';

  static final SharedRepositoryImple _instance = SharedRepositoryImple._internal();

  factory SharedRepositoryImple() {
    return _instance;
  }

  SharedRepositoryImple._internal();

  @override
  Future<bool> isFirstTimeOpened() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bool isFirstTime = prefs.getBool(_kIsFirstTimeOpened) ?? true;
      return isFirstTime;
    } catch (e) {
      return true;
    }
  }

  @override
  Future<bool> setOpenedStatus(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setBool(_kIsFirstTimeOpened, value);
    } catch (e) {
      return false;
    }
  }
}

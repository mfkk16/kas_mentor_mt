
abstract class SharedRepository {
  Future<bool> isFirstTimeOpened();
  Future<bool> setOpenedStatus(bool value);
}

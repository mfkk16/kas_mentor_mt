import '../../infrastructure/repositories/shared_repository.dart';
import '../core/usecase/usecase.dart';

class IsFirstTimeOpenedUsecase extends Usecase<bool, void> {
  final SharedRepository _sharedRepository;

  IsFirstTimeOpenedUsecase(this._sharedRepository);

  @override
  Future<bool> call({void params}) async {
    return _sharedRepository.isFirstTimeOpened();
  }
}

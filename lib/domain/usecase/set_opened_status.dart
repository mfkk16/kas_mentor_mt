import '../../infrastructure/repositories/shared_repository.dart';
import '../core/usecase/usecase.dart';

class SetOpenedStatusUsecase extends Usecase<bool, bool> {
  final SharedRepository _sharedRepository;

  SetOpenedStatusUsecase(this._sharedRepository);

  @override
  Future<bool> call({bool? params}) async {
    return _sharedRepository.setOpenedStatus(params!);
  }
}

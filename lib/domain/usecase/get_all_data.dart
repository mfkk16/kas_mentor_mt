import 'package:kas_mentor_mt/domain/models/api_response.dart';

import '../../infrastructure/repositories/api_repository.dart';
import '../core/resource/data_state.dart';
import '../core/usecase/usecase.dart';

class GetAllDataUsecase extends Usecase<DataState<AllDataModel>, void> {
  final ApiRepository _apiRepository;

  GetAllDataUsecase(this._apiRepository);

  @override
  Future<DataState<AllDataModel>> call({void params}) async {
    return await _apiRepository.getAllData();
  }
}

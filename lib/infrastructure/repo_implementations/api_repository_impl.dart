import 'package:kas_mentor_mt/domain/constants/app_const.dart';
import 'package:kas_mentor_mt/domain/core/resource/data_state.dart';
import 'package:kas_mentor_mt/domain/models/ApiResponse.dart';

import '../../domain/core/resource/data_exception.dart';
import '../datasources/remote/network_helper.dart';
import '../repositories/api_repository.dart';

class ApiRepositoryImpli extends ApiRepository {
  final NetworkHelper _networkHelper;

  ApiRepositoryImpli(this._networkHelper);

  @override
  Future<DataState<AllDataModel>> getAllData() async {
    try {
      final res = await _networkHelper.getRequest(path: AppConst.allData);
      return DataSuccess(allDataModelFromJson(res));
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }
}

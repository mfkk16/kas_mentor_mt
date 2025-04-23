
import '../../domain/core/resource/data_state.dart';
import '../../domain/models/api_response.dart';

abstract class ApiRepository {
  Future<DataState<AllDataModel>> getAllData();

}
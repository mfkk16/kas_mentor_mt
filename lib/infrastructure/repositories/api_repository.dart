
import '../../domain/core/resource/data_state.dart';
import '../../domain/models/ApiResponse.dart';

abstract class ApiRepository {
  Future<DataState<AllDataModel>> getAllData();

}
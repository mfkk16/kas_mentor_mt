import '../datasources/remote/network_helper.dart';
import '../repositories/api_repository.dart';

class ApiRepositoryImpli extends ApiRepository {
  final NetworkHelper _networkHelper;

  ApiRepositoryImpli(this._networkHelper);
}

import 'package:personal/core/models/src/user_model/user_model.dart';
import 'package:personal/core/services/network/base/abstract_dio_manager.dart';
import 'package:personal/core/services/network/constants/app_endpoint.dart';

final api = HttpMethod();

Future<ApiResponse<List<UserModel>>> fetchLocalDataList() {
  return HttpMethod().get<List<UserModel>>(
    ApiEndPoints.localDataGet,
    (json) => List<UserModel>.from(
      (json as List).map((item) => UserModel.fromJson(item)),
    ),
  );
}

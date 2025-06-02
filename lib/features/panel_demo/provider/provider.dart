import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/core/models/src/user_model/user_model.dart';

import '../../../core/services/network/base/abstract_dio_manager.dart';
import '../../../core/services/network/base/app_dio_manager.dart';

final localDataProvider = FutureProvider<ApiResponse<List<UserModel>>>((ref) {
  return fetchLocalDataList();
});

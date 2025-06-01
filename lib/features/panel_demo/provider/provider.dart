import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/network/base/abstract_dio_manager.dart';
import '../../../core/services/network/base/app_dio_manager.dart';

void fetchData() async {
  final response = await fetchLocalDataList();

  if (response.success) {
    final data = response.data;
    print('Fetched Data: $data');
  } else {
    print('Error fetching data: ${response.message}');
  }
}

final localDataProvider =
    FutureProvider<ApiResponse<List<Map<String, dynamic>>>>((ref) {
      return fetchLocalDataList();
    });

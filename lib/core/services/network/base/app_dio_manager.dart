import 'package:personal/core/services/network/base/abstract_dio_manager.dart';
import 'package:personal/core/services/network/constants/app_endpoint.dart';

final api = HttpMethod();
Future<ApiResponse<List<Map<String, dynamic>>>> fetchLocalDataList() {
  return HttpMethod().get<List<Map<String, dynamic>>>(
    ApiEndPoints.localDataGet,
    (json) => List<Map<String, dynamic>>.from(
      (json as List).map((item) => Map<String, dynamic>.from(item)),
    ),
  );
}

void fetchDataList() async {
  final response = await fetchLocalDataList();

  if (response.success) {
    final List<Map<String, dynamic>> dataList = response.data!;
    for (var item in dataList) {
      print('Item: $item');
    }
  } else {
    print('Error: ${response.message}');
  }
}

import 'package:personal/core/services/network/base/abstract_dio_manager.dart';
import 'package:personal/core/services/network/constants/app_endpoint.dart';

final api = HttpMethod();

void fetchData() async {
  final response = await api.get<Map<String, dynamic>>(
    ApiEndPoints.localDataGet,
    (json) => Map<String, dynamic>.from(json),
  );
  if (response.success) {
    print('Data : ${response.data}');
  } else {
    print('Error : ${response.message}');
  }
}

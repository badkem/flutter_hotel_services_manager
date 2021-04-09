import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';

class MyRepository {
  String _apiUrl = AppEndpoint.CHECKROOMEXIST;

  checkRoomExistRequest(roomName, label) async {
    Map<String, String> data = {"roomName": '$roomName', "label": '$label'};
    try {
      final response = await AppClients().post(
        _apiUrl,
        data: data,
      );
      print(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}

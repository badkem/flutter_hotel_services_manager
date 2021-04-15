import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/room.dart';
import 'package:khoaluantotnghiep2021/data/model/user.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';

class LoginProvider {
  Room room;
  User user;
  String _urlCheckRoom = AppEndpoint.CHECK_ROOM_EXIST;
  String _urlLogin = AppEndpoint.LOGIN;

  Future<Room> checkRoomExistRequest(roomName, label) async {
    Map<String, String> data = {"roomName": '$roomName', "label": '$label'};
    try {
      final response = await AppClients().post(
        _urlCheckRoom,
        data: data,
      );
      room = Room.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return room;
  }

  Future<User> loginRequest(roomLabel, roomName) async {
    Map<String, String> data = {
      "username": '_room_' + '$roomLabel' + '_' + '$roomName' + '_',
      "password": '111111'
    };
    try {
      final response = await AppClients().post(
        _urlLogin,
        data: data,
      );
      user = User.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return user;
  }
}

import 'package:bingo/data/network/base_api_services.dart';
import 'package:bingo/data/network/network_api_services.dart';
import 'package:bingo/resources/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginApiEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.registerApiEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

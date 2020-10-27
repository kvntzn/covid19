import 'package:covid19/app/services/api.dart';
import 'package:covid19/app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({@required this.apiService});
  final APIService apiService;

  String _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await apiService.getEndPointData(
          accessToken: _accessToken, endpoint: endpoint);
    } on Response catch (response) {
      // if unauthorized, get access token
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndPointData(
            accessToken: _accessToken, endpoint: endpoint);
      }
      rethrow;
    }
  }
}

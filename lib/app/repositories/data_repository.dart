import 'package:covid19/app/services/api.dart';
import 'package:covid19/app/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class DataRepository{
  DataRepository({@required this.apiService});
  final APIService apiService;

  Future<int> getEndpointData(Endpoint endpoint) async {
    final accessToken = await apiService.getAccessToken();
    await apiService.getEndPointData(accessToken: accessToken, endpoint: endpoint)
  }
}
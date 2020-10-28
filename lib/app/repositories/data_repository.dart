import 'package:covid19/app/repositories/endpoints_data.dart';
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

  Future<EndpointsData> _getAllEndpointsData() async {
    final values = await Future.wait([
      apiService.getEndPointData(
          accessToken: _accessToken, endpoint: Endpoint.cases),
      apiService.getEndPointData(
          accessToken: _accessToken, endpoint: Endpoint.casesSuspected),
      apiService.getEndPointData(
          accessToken: _accessToken, endpoint: Endpoint.casesConfirmed),
      apiService.getEndPointData(
          accessToken: _accessToken, endpoint: Endpoint.deaths),
      apiService.getEndPointData(
          accessToken: _accessToken, endpoint: Endpoint.recovered)
    ]);

    return EndpointsData(
      values: {
      Endpoint.cases: values[0],
      Endpoint.casesSuspected: values[1],
      Endpoint.casesConfirmed: values[2],
      Endpoint.deaths: values[3],
      Endpoint.recovered: values[4]
    });
  }
}

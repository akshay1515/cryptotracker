import 'dart:async';
import 'dart:convert';

import 'package:bitcointracker/data/datasource/remote/base_client.dart';
import 'package:bitcointracker/data/datasource/remote/network_request/api_exception.dart';

import 'package:http/http.dart' as http;

class NetworkClient extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      return responseData(response);
    } on TimeoutException {
      return BadRequestException('Request Timeout', 301);
    } catch (error) {
      return BadRequestException('Bad Request', 402);

    }
  }

  @override
  Future postApiResponse(String url, data) {
    // TODO: implement postApiResponse
    throw UnimplementedError();
  }

  responseData(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responsevalue = jsonDecode(response.body);
        return responsevalue;
      case 400:
        return BadRequestException('Bad Request', response.statusCode);
      case 500:
        return FetchDataException(
            'Server connection not established', response.statusCode);
      case 404:
        return NotFoundException('Resource not found', response.statusCode);
      default:
        return FetchDataException(
            'Something is not looking good', response.statusCode);
    }
  }
}

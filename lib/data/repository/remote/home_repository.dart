import 'package:bitcointracker/data/datasource/remote/network_request/network_client.dart';
import 'package:bitcointracker/data/model/pricemodel.dart';
import 'package:bitcointracker/utils/constants/networkaddress/api_endpoint.dart';

class HomeRepository {
  Future getPrice([Map<String, String>? params]) async {
    const url = ApiEndPoint.baseApi;

    final response = await NetworkClient().getApiResponse(url);

    Bitcoin price = Bitcoin.fromJson(response);

    return price.bpi!.priceList!['price'] as List<Price>;
  }
}

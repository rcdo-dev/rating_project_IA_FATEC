import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:rating_project/app/constants/constants.dart';

class StationFuelRepository {
  final Client _client = Client();

  Future<List<String>> getGasStationName() async {
    String selectName = 'div.media-body > h5 > a';

    try {
      Response response = await _client.get(Uri.parse(Constants.url));
      var document = parse(response.body);

      List<dynamic> names = document.querySelectorAll(selectName);

      List<String> gasStationName = [];
      for (var name in names) {
        gasStationName.add(name.text);
      }

      return gasStationName;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> getGasStationAddress() async {
    String selectAddresss = 'div.media-body > p';

    try {
      Response response = await _client.get(Uri.parse(Constants.url));
      var document = parse(response.body);

      List<dynamic> address = document.querySelectorAll(selectAddresss);

      List<String> gasStationAddress = [];
      for (var ad in address) {
        gasStationAddress.add(ad.text);
      }

      return gasStationAddress;
    } catch (e) {
      throw Exception(e);
    }
  }
}

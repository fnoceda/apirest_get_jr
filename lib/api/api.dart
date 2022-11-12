import 'dart:io';

import 'package:jr/models/result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MiApi {
  static Future<ResultModel> getData(String url) async {
    ResultModel rta = const ResultModel(
      success: false,
      message: 'Unknow Error',
      data: null,
    );
    Uri uri = Uri.parse(url);

    if (await _checkInternet()) {
      http.Response res =
          await http.get(uri).timeout(const Duration(seconds: 10));

      print('res => $res');

      if (res.statusCode == 200) {
        print('200');
        if (res.body.isNotEmpty) {
          print('no empty');
          // var bodyDecode = convert.jsonDecode(res.body);
          rta = ResultModel.fromMap(convert.jsonDecode(res.body));
        }
      }
    }

    print('final => $rta');

    return rta;
  }

  static Future<bool> _checkInternet() async {
    bool rta = false;
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      rta = true;
    }
    return rta;
  }
}

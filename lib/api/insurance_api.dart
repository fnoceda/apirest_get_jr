import 'package:dartz/dartz.dart';
import 'package:jr/api/api.dart';
import 'package:jr/models/failure_model.dart';
import 'package:jr/models/insurance_model.dart';
import 'package:jr/models/result_model.dart';

class InsuranceApi {
  static Future<Either<FailureModel, List<InsuranceModel>>>
      getInsurances() async {
    String url = 'https://roadoctor.vendebrother.com/api/insurances';
    ResultModel res = await MiApi.getData(url);
    List<InsuranceModel> rta = [];

    try {
      if (res.success && res.data != null) {
        // usar esta parte en el proyecot viejo
        rta.addAll(
            (res.data as List).map((e) => InsuranceModel.fromMap(e)).toList());
        // usar esta parte en el proyecot viejo

      } else {
        return Left(FailureModel(code: 500, message: 'Fail retiving data'));
      }
    } catch (e, s) {
      print(e);
      print(s);
      return Left(FailureModel(code: 500, message: 'Fatal Error'));
    }

    print('InsuranceApi.rta => $rta ');

    return Right(rta);
  }
}

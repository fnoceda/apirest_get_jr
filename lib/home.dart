import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jr/api/insurance_api.dart';
import 'package:jr/models/failure_model.dart';
import 'package:jr/models/insurance_model.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          drawer: Drawer(),
          body: HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  Future<List<InsuranceModel>> getData() async {
    Either<FailureModel, List<InsuranceModel>> result =
        await InsuranceApi.getInsurances();

    List<InsuranceModel> rta = [];
    result.fold((l) {}, (r) {
      print('entra en ok');
      rta = r;
    });

    print('rta => $rta');

    return rta;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext _, AsyncSnapshot<List<InsuranceModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<InsuranceModel> lista = snapshot.data as List<InsuranceModel>;

            return ListView.separated(
              itemCount: lista.length,
              separatorBuilder: (_, i) => const Divider(
                color: Colors.red,
              ),
              itemBuilder: (_, i) {
                return _item(lista[i]);
              },
            );
          }
        }
        return Container();
      },
    );
  }

  Widget _item(InsuranceModel item) {
    return ListTile(
      leading: const Icon(Icons.abc),
      title: Text('${item.name}'),
      subtitle: Text('${item.name}'),
    );
  }
}

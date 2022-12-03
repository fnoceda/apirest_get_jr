import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jr/blocs/get_data/get_data_bloc.dart';
import 'package:jr/models/insurance_model.dart';

class MyHomeBlocPage extends StatefulWidget {
  final String title;

  const MyHomeBlocPage({super.key, required this.title});

  @override
  State<MyHomeBlocPage> createState() => _MyHomeBlocPageState();
}

class _MyHomeBlocPageState extends State<MyHomeBlocPage> {
  late GetDataBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<GetDataBloc>();
    bloc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          drawer: Drawer(),
          body: HomeBlocWidget(),
        ),
      ),
    );
  }
}

class HomeBlocWidget extends StatelessWidget {
  const HomeBlocWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: _stateManager()),
    );
  }

  Widget _item(InsuranceModel item) {
    return ListTile(
      leading: const Icon(Icons.abc),
      title: Text('${item.name}'),
      subtitle: Text('${item.description}'),
    );
  }

  Widget _listItem(List<InsuranceModel> lista) {
    return ListView.separated(
      itemCount: lista.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context, int index) {
        print('entra en => ${lista[index].name}');
        return _item(lista[index]);
      },
    );
  }

  Widget _stateManager() {
    return BlocConsumer<GetDataBloc, GetDataState>(
      listener: (context, state) {
        switch (state.httpStatus) {
          case HttpStatus.none:
            print('stateIs none => $state');

            break;
          case HttpStatus.loading:
            print('stateIs loading => $state');
            break;
          case HttpStatus.failed:
            print('stateIs failed => $state');
            break;
          case HttpStatus.success:
            print('stateIs success => $state');
            break;
        }
      },
      builder: (context, state) {
        switch (state.httpStatus) {
          case HttpStatus.none:
          case HttpStatus.loading:
            return const CupertinoActivityIndicator();
          case HttpStatus.failed:
            print('build entra en falla');
            return Text(
              '${state.message}',
              style: const TextStyle(color: Colors.red),
            );
          case HttpStatus.success:
            print('build entra en success');
            print('entra en lista => ${state.lista}');
            return _listItem(state.lista);
        }
      },
    );
  }
}

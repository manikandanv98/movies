import 'dart:async';

import 'package:movies/Models/ProductionCompaniesModel.dart';
import 'package:movies/Models/moviesModel.dart';
import 'package:movies/services/apiServices.dart' as _apiService;

class ProductionCompanyBloc{
  
  List<ProductionCompaniesBloc> _productionCompanies = [];


  final _productionCompanyStreamController = StreamController<List<ProductionCompaniesBloc>>();

  StreamSink<List<ProductionCompaniesBloc>> get _inProduction =>
      _productionCompanyStreamController.sink;

  Stream<List<ProductionCompaniesBloc>> get outProduction =>
      _productionCompanyStreamController.stream;
  

  Future<void> productionLoading() async {
    var productionData=
    await _apiService.getData();
    print('ProductionData');
    print(productionData);
    _productionCompanies =productionData;
    _inProduction.add(productionData);
  }
}
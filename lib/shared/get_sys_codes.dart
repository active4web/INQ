import 'package:work/models/service_model.dart';
import 'package:work/network/remote/dio_helper.dart';


  ServiceModel serviceModel;
  void getSysCodes({int scType}){
    DioHelper.getData(url: 'CoreService/getSysCodes',
    query: {
      'scType' : scType,
      'accessType' : 'MOBILE',
      'uuidToken' : 'b606b091-e4dc-4179-b3ba-29059a0368a7'
    }).then((value){
      print(value.data);
    }).catchError((error){
      print(error);
    });
  }
  

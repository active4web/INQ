import 'package:work/models/service_model.dart';
import 'package:work/network/remote/dio_helper.dart';

  //
  // Future<ServiceModel> getSysCodes({int scType}){
  //   var response;
  //   DioHelper.getData(url: 'CoreService/getSysCodes',
  //   query: {
  //     'scType' : scType,
  //     'accessType' : 'MOBILE',
  //     'uuidToken' : 'b606b091-e4dc-4179-b3ba-29059a0368a7'
  //   }).then((value){
  //     print(value.data);
  //     response = ServiceModel.fromJson(value.data);
  //   }).catchError((error){
  //     print(error);
  //   });
  //   return response;
  // }

Future<ServiceModel> getSysCodes({int scType})async{
  var response = await DioHelper.getData(url: 'CoreService/getSysCodes',
      query: {
        'scType' : scType,
        'accessType' : 'MOBILE',
        'uuidToken' : 'b606b091-e4dc-4179-b3ba-29059a0368a7'
      });
  ServiceModel data = ServiceModel.fromJson(response.data);
  return data;
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/controller/apihelper.dart';

import '../modal/api_modal.dart';


class HomeProvider extends ChangeNotifier{
  TextEditingController txtFind=TextEditingController(text: "Surat");
  ApiModal? apiModalScan;
  ApiHelper apiHelper=ApiHelper();
  late ApiModal apiModal;
  Future<ApiModal> apiDataGet()
  async {
    final mapData=await apiHelper.apiCalling(txtFind.text);
    apiModal=ApiModal.fromJson(mapData);
    return apiModal;
  }
  HomeProvider()
  {
    apiDataGet();
  }
}
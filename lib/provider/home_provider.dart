import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/controller/apihelper.dart';

import '../modal/api_modal.dart';

class HomeProvider extends ChangeNotifier {
  List<String> addList = [];
  TextEditingController txtFind = TextEditingController(text: "Surat");
  ApiModal? apiModalScan;
  ApiHelper apiHelper = ApiHelper();
  late ApiModal apiModal;

  Future<ApiModal> apiDataGet() async {
    final mapData = await apiHelper.apiCalling(txtFind.text);
    apiModal = ApiModal.fromJson(mapData);
    notifyListeners();
    return apiModal;
  }

  HomeProvider() {
    shareMobileGet();
    apiDataGet();
  }
    // notifyListeners();

  bool checkLoop(String textValue) {
    bool checkValueBool = false;
    for (int i = 0; i < addList.length; i++) {
      if(addList[i].toString().split("-").sublist(0, 1).join("-").toString() == textValue) {
        checkValueBool = true;
      }
    }
    // notifyListeners();
    return checkValueBool;
  }

  void removeListBook(int index) {
    addList.removeAt(index);
    shareMobileSet();
    notifyListeners();
  }

  void removeListBook1(String textValue) {
    for (int i = 0; i < addList.length; i++) {
      if (int.parse(addList[i].toString().split("-").sublist(0, 1).join("-")).toString() == textValue) {
        addList.removeAt(i);
      }
    }
    shareMobileSet();
    notifyListeners();
  }

  Future<void> shareMobileSet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('weather', addList);
    notifyListeners();
  }

  Future<void> shareMobileGet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    addList = sharedPreferences.getStringList('weather') ?? [];
    print(addList);
    notifyListeners();
  }

  void addListFuntion(
      {required dynamic name,
      required dynamic text,
      required dynamic temp,
      required dynamic heat,
      required dynamic down}) {
    addList.add('$name-$text-$temp-$heat-$down');
    // addList.add(ListModal(index1: selectIndex, index2: valueIndex));
    shareMobileSet();
    notifyListeners();
  }

  void textFieldMethod()
  {
    notifyListeners();
  }
}

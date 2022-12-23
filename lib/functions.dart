
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:goodtrips/SiteDataModels.dart';

Future<List<SiteDataModels>>ReadJsonData() async{
  final jsondata = await rootBundle.loadString('json_dir/touristic_sites.json');
  final dataList = json.decode(jsondata) as List<dynamic>;
  return dataList.map((e) => SiteDataModels.fromJson(e)).toList();
}
List pictures(){
  var picturesList =
}

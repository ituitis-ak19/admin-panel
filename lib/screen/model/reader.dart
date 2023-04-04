// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class Reader extends BaseModel<Reader> {
  int? id;
  String? name;
  String? type;
  String? direction;
  String? accessLocationName;
  
  Reader({
    this.id,
    this.name,
    this.type,
    this.direction,
    this.accessLocationName,
  });
  
  


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'direction': direction,
      'accessLocationName': accessLocationName,
    };
  }

  Reader fromJson(Map<String, dynamic> map) {
    return Reader(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      direction: map['direction'] != null ? map['direction'] as String : null,
      accessLocationName: map['accessLocationName'] != null ? map['accessLocationName'] as String : null,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class Reader extends BaseModel<Reader> {
  int? id;
  String? name;
  int? type;
  int? direction;
  
  Reader({
    this.id,
    this.name,
    this.type,
    this.direction,
  });
  
  


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'direction': direction,
    };
  }

  Reader fromJson(Map<String, dynamic> map) {
    return Reader(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      direction: map['direction'] != null ? map['direction'] as int : null,
    );
  }
}

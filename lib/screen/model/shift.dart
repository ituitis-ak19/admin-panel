// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class Shift extends BaseModel<Shift> {
  int? id;
  String? name;
  String? startTime;
  String? endTime;
  
  Shift({
    this.id,
    this.name,
    this.startTime,
    this.endTime
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'startTime' : startTime,
      'endTime' : endTime
    };
  }
  
  @override
  Shift fromJson(Map<String, dynamic> map) {
    return Shift(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
    );
  }
}

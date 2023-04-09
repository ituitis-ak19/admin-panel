// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class TimeOffType extends BaseModel<TimeOffType> {
  int? id;
  String? name;
  String? description;
  
  TimeOffType({
    this.id,
    this.name,
    this.description
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  TimeOffType fromJson(Map<String, dynamic> map) {
    return TimeOffType(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }
}

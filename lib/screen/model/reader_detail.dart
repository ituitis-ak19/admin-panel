// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class ReaderDetail extends BaseModel<ReaderDetail> {
  int? id;
  String? name;
  String? type;
  String? direction;
  int? accessLocationId;
  
  ReaderDetail({
    this.id,
    this.name,
    this.type,
    this.direction,
    this.accessLocationId,
  });
  
  


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'direction': direction,
      'accessLocationId': accessLocationId,
    };
  }

  ReaderDetail fromJson(Map<String, dynamic> map) {
    return ReaderDetail(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      direction: map['direction'] != null ? map['direction'] as String : null,
      accessLocationId: map['accessLocationId'] != null ? map['accessLocationId'] as int : null,
    );
  }
}

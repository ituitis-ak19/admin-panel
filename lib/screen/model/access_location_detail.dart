// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:admin_ui/core/base/base_model.dart';
import 'package:admin_ui/core/network/network_manager.dart';

class AccessLocationDetail extends BaseModel<AccessLocationDetail> {
  int? id;
  String? name;
  int? type;
  int? siteId;
  String? location;
  
  AccessLocationDetail({
    this.id,
    this.name,
    this.type,
    this.siteId,
    this.location
  });

  
@override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'siteId': siteId,
      'location' : location
    };
  }

  @override
   AccessLocationDetail fromJson(Map<String, dynamic> map) {
    return AccessLocationDetail(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      siteId: map['siteId'] != null ? map['siteId'] as int : null,
      location: map['location'] != null ? map['location'] as String : null, 
    );
  }

}

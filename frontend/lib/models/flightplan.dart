import 'package:frontend/models/geometry.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:frontend/config/api.dart';
import 'package:frontend/generic/generic_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/config/styles.dart';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

part 'flightplan.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'date', 'drone_reference', 'mission_details', 'route'], )
@ElementWidgetGen(auth: false)
@CopyWith()
class FlightPlan {
  @Field(fieldName: "Name", fieldDescription: "This is the Name of the FlightPlan", editable: true, placeholder: "Write the Name of this FlightPlan")
  final String name;
  @Field(fieldName: "Flight Date", fieldDescription: "Departure Datetime of the FlightPlan", editable: true, placeholder: "Select a Datetime")
  final DateTime? date;
  @Field(fieldName: "Drone Reference", fieldDescription: "This is the Drone Reference", editable: true, placeholder: "Add the Drone Reference")
  final String drone_reference;
  @Field(fieldName: "Mission Details", fieldDescription: "These are the important details for the mission", editable: true, placeholder: "Write the mission details here")
  final String? mission_details;
  @Field(fieldName: "Route", fieldDescription: "This is Route of the FlightPlan", editable: true, placeholder: "Add the coordinates for the Route", uspaceMap: true)
  final LineString? route;
  @Field(fieldName: 'id')
  final String id;

  FlightPlan({
    required this.name,
    this.date,
    required this.drone_reference,
    this.mission_details,
    this.route,
    required this.id
  });

  factory FlightPlan.fromJson(Map<String, dynamic> json) => _$FlightPlanFromJson(json);

  Map<String, dynamic> toJson() => _$FlightPlanToJson(this);
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'post_material_activity_in_class_widget.dart'
    show PostMaterialActivityInClassWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostMaterialActivityInClassModel
    extends FlutterFlowModel<PostMaterialActivityInClassWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Act_Mat_ChoiceChips widget.
  FormFieldController<List<String>>? actMatChoiceChipsValueController;
  String? get actMatChoiceChipsValue =>
      actMatChoiceChipsValueController?.value?.firstOrNull;
  set actMatChoiceChipsValue(String? val) =>
      actMatChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DueChoiceChips widget.
  FormFieldController<List<String>>? dueChoiceChipsValueController;
  String? get dueChoiceChipsValue =>
      dueChoiceChipsValueController?.value?.firstOrNull;
  set dueChoiceChipsValue(String? val) =>
      dueChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'study_widget.dart' show StudyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudyModel extends FlutterFlowModel<StudyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Specialization widget.
  String? specializationValue;
  FormFieldController<String>? specializationValueController;
  // State field(s) for Additional_Info widget.
  FocusNode? additionalInfoFocusNode;
  TextEditingController? additionalInfoTextController;
  String? Function(BuildContext, String?)?
      additionalInfoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    additionalInfoFocusNode?.dispose();
    additionalInfoTextController?.dispose();
  }
}

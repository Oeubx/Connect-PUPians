import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'create_class_widget.dart' show CreateClassWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateClassModel extends FlutterFlowModel<CreateClassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TF_ClassName widget.
  FocusNode? tFClassNameFocusNode;
  TextEditingController? tFClassNameTextController;
  String? Function(BuildContext, String?)? tFClassNameTextControllerValidator;
  // State field(s) for TF_Section widget.
  FocusNode? tFSectionFocusNode;
  TextEditingController? tFSectionTextController;
  String? Function(BuildContext, String?)? tFSectionTextControllerValidator;
  // State field(s) for TF_Desc widget.
  FocusNode? tFDescFocusNode;
  TextEditingController? tFDescTextController;
  String? Function(BuildContext, String?)? tFDescTextControllerValidator;
  // State field(s) for TF_Subject widget.
  FocusNode? tFSubjectFocusNode;
  TextEditingController? tFSubjectTextController;
  String? Function(BuildContext, String?)? tFSubjectTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tFClassNameFocusNode?.dispose();
    tFClassNameTextController?.dispose();

    tFSectionFocusNode?.dispose();
    tFSectionTextController?.dispose();

    tFDescFocusNode?.dispose();
    tFDescTextController?.dispose();

    tFSubjectFocusNode?.dispose();
    tFSubjectTextController?.dispose();
  }
}

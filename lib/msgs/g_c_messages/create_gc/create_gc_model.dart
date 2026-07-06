import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'create_gc_widget.dart' show CreateGcWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGcModel extends FlutterFlowModel<CreateGcWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TF_GCNAME widget.
  FocusNode? tfGcnameFocusNode;
  TextEditingController? tfGcnameTextController;
  String? Function(BuildContext, String?)? tfGcnameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfGcnameFocusNode?.dispose();
    tfGcnameTextController?.dispose();
  }
}

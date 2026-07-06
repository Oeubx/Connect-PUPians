import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'create_grp_widget.dart' show CreateGrpWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGrpModel extends FlutterFlowModel<CreateGrpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TF_GRPNAME widget.
  FocusNode? tfGrpnameFocusNode;
  TextEditingController? tfGrpnameTextController;
  String? Function(BuildContext, String?)? tfGrpnameTextControllerValidator;
  // State field(s) for TF_GRPDESC widget.
  FocusNode? tfGrpdescFocusNode;
  TextEditingController? tfGrpdescTextController;
  String? Function(BuildContext, String?)? tfGrpdescTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tfGrpnameFocusNode?.dispose();
    tfGrpnameTextController?.dispose();

    tfGrpdescFocusNode?.dispose();
    tfGrpdescTextController?.dispose();
  }
}

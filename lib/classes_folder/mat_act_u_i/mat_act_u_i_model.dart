import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'mat_act_u_i_widget.dart' show MatActUIWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatActUIModel extends FlutterFlowModel<MatActUIWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for StudComment widget.
  FocusNode? studCommentFocusNode;
  TextEditingController? studCommentTextController;
  String? Function(BuildContext, String?)? studCommentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
    studCommentFocusNode?.dispose();
    studCommentTextController?.dispose();
  }
}

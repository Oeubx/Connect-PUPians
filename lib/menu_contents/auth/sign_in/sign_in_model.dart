import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for User_Email widget.
  FocusNode? userEmailFocusNode;
  TextEditingController? userEmailTextController;
  String? Function(BuildContext, String?)? userEmailTextControllerValidator;
  // State field(s) for User_Password widget.
  FocusNode? userPasswordFocusNode;
  TextEditingController? userPasswordTextController;
  late bool userPasswordVisibility;
  String? Function(BuildContext, String?)? userPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    userPasswordVisibility = false;
  }

  @override
  void dispose() {
    userEmailFocusNode?.dispose();
    userEmailTextController?.dispose();

    userPasswordFocusNode?.dispose();
    userPasswordTextController?.dispose();
  }
}

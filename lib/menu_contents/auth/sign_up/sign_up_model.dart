import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for User_DisplayName widget.
  FocusNode? userDisplayNameFocusNode;
  TextEditingController? userDisplayNameTextController;
  String? Function(BuildContext, String?)?
      userDisplayNameTextControllerValidator;
  String? _userDisplayNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for User_EmailCreate widget.
  FocusNode? userEmailCreateFocusNode;
  TextEditingController? userEmailCreateTextController;
  String? Function(BuildContext, String?)?
      userEmailCreateTextControllerValidator;
  String? _userEmailCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for User_PasswordCreate widget.
  FocusNode? userPasswordCreateFocusNode;
  TextEditingController? userPasswordCreateTextController;
  late bool userPasswordCreateVisibility;
  String? Function(BuildContext, String?)?
      userPasswordCreateTextControllerValidator;
  String? _userPasswordCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for User_ConfirmPass widget.
  FocusNode? userConfirmPassFocusNode;
  TextEditingController? userConfirmPassTextController;
  late bool userConfirmPassVisibility;
  String? Function(BuildContext, String?)?
      userConfirmPassTextControllerValidator;
  String? _userConfirmPassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    userDisplayNameTextControllerValidator =
        _userDisplayNameTextControllerValidator;
    userEmailCreateTextControllerValidator =
        _userEmailCreateTextControllerValidator;
    userPasswordCreateVisibility = false;
    userPasswordCreateTextControllerValidator =
        _userPasswordCreateTextControllerValidator;
    userConfirmPassVisibility = false;
    userConfirmPassTextControllerValidator =
        _userConfirmPassTextControllerValidator;
  }

  @override
  void dispose() {
    userDisplayNameFocusNode?.dispose();
    userDisplayNameTextController?.dispose();

    userEmailCreateFocusNode?.dispose();
    userEmailCreateTextController?.dispose();

    userPasswordCreateFocusNode?.dispose();
    userPasswordCreateTextController?.dispose();

    userConfirmPassFocusNode?.dispose();
    userConfirmPassTextController?.dispose();
  }
}

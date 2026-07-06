import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/menu_contents/user/edit_u_s_e_r_c_o_v_e_r/edit_u_s_e_r_c_o_v_e_r_widget.dart';
import '/menu_contents/user/edit_u_s_e_r_p_f_p/edit_u_s_e_r_p_f_p_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for User_Name widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for User_SIS_ID widget.
  FocusNode? userSISIDFocusNode;
  TextEditingController? userSISIDTextController;
  String? Function(BuildContext, String?)? userSISIDTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for User_Bio widget.
  FocusNode? userBioFocusNode;
  TextEditingController? userBioTextController;
  String? Function(BuildContext, String?)? userBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    userSISIDFocusNode?.dispose();
    userSISIDTextController?.dispose();

    userBioFocusNode?.dispose();
    userBioTextController?.dispose();
  }
}

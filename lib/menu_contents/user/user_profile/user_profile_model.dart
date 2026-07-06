import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_button2_post/user_button2_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for User_Button2Post component.
  late UserButton2PostModel userButton2PostModel;

  @override
  void initState(BuildContext context) {
    userButton2PostModel = createModel(context, () => UserButton2PostModel());
  }

  @override
  void dispose() {
    userButton2PostModel.dispose();
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation_bar/navigation_bar_widget.dart';
import '/components/tentative_reminder/tentative_reminder_widget.dart';
import '/components/user_button2_post/user_button2_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for User_Button2Post component.
  late UserButton2PostModel userButton2PostModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    userButton2PostModel = createModel(context, () => UserButton2PostModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    userButton2PostModel.dispose();
    navigationBarModel.dispose();
  }
}

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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  static String routeName = 'Homepage';
  static String routePath = '/homepage';

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.userButton2PostModel,
                        updateCallback: () => safeSetState(() {}),
                        child: UserButton2PostWidget(),
                      ),
                    ),
                    StreamBuilder<List<PostsRecord>>(
                      stream: queryPostsRecord(
                        queryBuilder: (postsRecord) => postsRecord
                            .orderBy('post_timeposted', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PostsRecord> listViewPostsRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPostsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPostsRecord =
                                listViewPostsRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((listViewPostsRecord.groupRef == null) &&
                                    (listViewPostsRecord.classRef == null))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewPostsRecord.postUser!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final normalPContainerUsersRecord =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          normalPContainerUsersRecord
                                                              .photoUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (normalPContainerUsersRecord
                                                                      .reference ==
                                                                  currentUserReference) {
                                                                context.pushNamed(
                                                                    UserProfileWidget
                                                                        .routeName);
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  OtherUserProfileWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'userRef':
                                                                        serializeParam(
                                                                      normalPContainerUsersRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child: Text(
                                                              normalPContainerUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSerif(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            normalPContainerUsersRecord
                                                                .userStanding,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 25.0))
                                                        .around(SizedBox(
                                                            width: 25.0)),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 350.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text(
                                                    listViewPostsRecord
                                                        .postText,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 0.0, 25.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            formatNumber(
                                                              listViewPostsRecord
                                                                  .postLikedby
                                                                  .length,
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            key: ValueKey(
                                                                listViewPostsRecord
                                                                    .postLikedby
                                                                    .contains(
                                                                        currentUserReference)
                                                                    .toString()),
                                                            borderRadius: 8.0,
                                                            buttonSize: 35.0,
                                                            icon: Icon(
                                                              Icons.thumb_up,
                                                              color:
                                                                  Colors.black,
                                                              size: 20.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewPostsRecord
                                                                      .postLikedby
                                                                      .contains(
                                                                          currentUserReference) ==
                                                                  true) {
                                                                await listViewPostsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'post_Likedby':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                await listViewPostsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'post_Likedby':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                if (currentUserReference ==
                                                                    normalPContainerUsersRecord
                                                                        .reference) {
                                                                  return;
                                                                }

                                                                await NotificationsRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createNotificationsRecordData(
                                                                      isALike:
                                                                          true,
                                                                      isRead:
                                                                          false,
                                                                      postRef:
                                                                          listViewPostsRecord
                                                                              .reference,
                                                                      madeBy:
                                                                          currentUserReference,
                                                                      madeTo: normalPContainerUsersRecord
                                                                          .reference,
                                                                      notifTime:
                                                                          getCurrentTimestamp,
                                                                      madeByUsername:
                                                                          currentUserDisplayName,
                                                                      madeByPhotoOfUser:
                                                                          currentUserPhoto,
                                                                    ));
                                                                return;
                                                              }
                                                            },
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 5.0))
                                                            .around(SizedBox(
                                                                width: 5.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            formatNumber(
                                                              listViewPostsRecord
                                                                  .postDislikedby
                                                                  .length,
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            key: ValueKey(
                                                                listViewPostsRecord
                                                                    .postDislikedby
                                                                    .contains(
                                                                        currentUserReference)
                                                                    .toString()),
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 35.0,
                                                            icon: Icon(
                                                              Icons.thumb_down,
                                                              color:
                                                                  Colors.black,
                                                              size: 20.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (listViewPostsRecord
                                                                      .postDislikedby
                                                                      .contains(
                                                                          currentUserReference) ==
                                                                  true) {
                                                                await listViewPostsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'post_Dislikedby':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                await listViewPostsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'post_Dislikedby':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                if (currentUserReference ==
                                                                    normalPContainerUsersRecord
                                                                        .reference) {
                                                                  return;
                                                                }

                                                                await NotificationsRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createNotificationsRecordData(
                                                                      isRead:
                                                                          false,
                                                                      postRef:
                                                                          listViewPostsRecord
                                                                              .reference,
                                                                      madeBy:
                                                                          currentUserReference,
                                                                      madeTo: normalPContainerUsersRecord
                                                                          .reference,
                                                                      notifTime:
                                                                          getCurrentTimestamp,
                                                                      madeByUsername:
                                                                          currentUserDisplayName,
                                                                      isADislike:
                                                                          true,
                                                                      madeByPhotoOfUser:
                                                                          currentUserPhoto,
                                                                    ));
                                                                return;
                                                              }
                                                            },
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 5.0))
                                                            .around(SizedBox(
                                                                width: 5.0)),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          WholePostUIWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'docref':
                                                                serializeParam(
                                                              listViewPostsRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'userref':
                                                                serializeParam(
                                                              listViewPostsRecord
                                                                  .postUser,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            FutureBuilder<int>(
                                                              future:
                                                                  queryPostCommentsRecordCount(
                                                                queryBuilder:
                                                                    (postCommentsRecord) =>
                                                                        postCommentsRecord
                                                                            .where(
                                                                  'comment_postref',
                                                                  isEqualTo:
                                                                      listViewPostsRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                int textCount =
                                                                    snapshot
                                                                        .data!;

                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      textCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .compact,
                                                                    ),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSerif(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                            Text(
                                                              'Comments',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSerif(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 5.0))
                                                              .around(SizedBox(
                                                                  width: 5.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 10.0))
                                                .around(SizedBox(height: 10.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (listViewPostsRecord.groupRef != null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewPostsRecord.postUser!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final groupPContainerUsersRecord =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(),
                                          ),
                                          child: StreamBuilder<GroupsRecord>(
                                            stream: GroupsRecord.getDocument(
                                                listViewPostsRecord.groupRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final columnGroupsRecord =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              columnGroupsRecord
                                                                  .groupImg,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    MainGrpUIWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'groupref':
                                                                          serializeParam(
                                                                        columnGroupsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  columnGroupsRecord
                                                                      .groupname,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSerif(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (groupPContainerUsersRecord
                                                                          .reference ==
                                                                      currentUserReference) {
                                                                    context.pushNamed(
                                                                        UserProfileWidget
                                                                            .routeName);
                                                                  } else {
                                                                    context
                                                                        .pushNamed(
                                                                      OtherUserProfileWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'userRef':
                                                                            serializeParam(
                                                                          groupPContainerUsersRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        '__transition_info__':
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                child: Text(
                                                                  groupPContainerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 5.0)),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 25.0))
                                                            .around(SizedBox(
                                                                width: 25.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 350.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
                                                      child: Text(
                                                        listViewPostsRecord
                                                            .postText,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(25.0, 0.0,
                                                                25.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                formatNumber(
                                                                  listViewPostsRecord
                                                                      .postLikedby
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSerif(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                key: ValueKey(listViewPostsRecord
                                                                    .postLikedby
                                                                    .contains(
                                                                        currentUserReference)
                                                                    .toString()),
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    35.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .thumb_up,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (listViewPostsRecord
                                                                          .postLikedby
                                                                          .contains(
                                                                              currentUserReference) ==
                                                                      true) {
                                                                    await listViewPostsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'post_Likedby':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  } else {
                                                                    await listViewPostsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'post_Likedby':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    if (currentUserReference ==
                                                                        groupPContainerUsersRecord
                                                                            .reference) {
                                                                      return;
                                                                    }

                                                                    await NotificationsRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createNotificationsRecordData(
                                                                          isALike:
                                                                              true,
                                                                          isRead:
                                                                              false,
                                                                          postRef:
                                                                              listViewPostsRecord.reference,
                                                                          madeBy:
                                                                              currentUserReference,
                                                                          madeTo:
                                                                              groupPContainerUsersRecord.reference,
                                                                          notifTime:
                                                                              getCurrentTimestamp,
                                                                          madeByUsername:
                                                                              currentUserDisplayName,
                                                                          madeByPhotoOfUser:
                                                                              currentUserPhoto,
                                                                        ));
                                                                    return;
                                                                  }
                                                                },
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width: 5.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                formatNumber(
                                                                  listViewPostsRecord
                                                                      .postDislikedby
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSerif(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                key: ValueKey(listViewPostsRecord
                                                                    .postDislikedby
                                                                    .contains(
                                                                        currentUserReference)
                                                                    .toString()),
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    35.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .thumb_down,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (listViewPostsRecord
                                                                          .postDislikedby
                                                                          .contains(
                                                                              currentUserReference) ==
                                                                      true) {
                                                                    await listViewPostsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'post_Dislikedby':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  } else {
                                                                    await listViewPostsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'post_Dislikedby':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    if (currentUserReference ==
                                                                        groupPContainerUsersRecord
                                                                            .reference) {
                                                                      return;
                                                                    }

                                                                    await NotificationsRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createNotificationsRecordData(
                                                                          isRead:
                                                                              false,
                                                                          postRef:
                                                                              listViewPostsRecord.reference,
                                                                          madeBy:
                                                                              currentUserReference,
                                                                          madeTo:
                                                                              groupPContainerUsersRecord.reference,
                                                                          notifTime:
                                                                              getCurrentTimestamp,
                                                                          madeByUsername:
                                                                              currentUserDisplayName,
                                                                          isADislike:
                                                                              true,
                                                                          madeByPhotoOfUser:
                                                                              currentUserPhoto,
                                                                        ));
                                                                    return;
                                                                  }
                                                                },
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width: 5.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              WholePostUIOfGroupWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'docref':
                                                                    serializeParam(
                                                                  listViewPostsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'userref':
                                                                    serializeParam(
                                                                  listViewPostsRecord
                                                                      .postUser,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'groupRef':
                                                                    serializeParam(
                                                                  listViewPostsRecord
                                                                      .groupRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                FutureBuilder<
                                                                    int>(
                                                                  future:
                                                                      queryPostCommentsRecordCount(
                                                                    queryBuilder:
                                                                        (postCommentsRecord) =>
                                                                            postCommentsRecord.where(
                                                                      'comment_postref',
                                                                      isEqualTo:
                                                                          listViewPostsRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    int textCount =
                                                                        snapshot
                                                                            .data!;

                                                                    return Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          textCount,
                                                                          formatType:
                                                                              FormatType.compact,
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.notoSerif(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                                Text(
                                                                  'Comments',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSerif(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          5.0))
                                                                  .around(SizedBox(
                                                                      width:
                                                                          5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 10.0))
                                                    .around(
                                                        SizedBox(height: 10.0)),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/CPUP_LOGO.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Connect Pupians',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.notoSerif(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .around(SizedBox(width: 10.0)),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 50.0,
                              icon: FaIcon(
                                FontAwesomeIcons.globe,
                                color: FlutterFlowTheme.of(context).main,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: TentativeReminderWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.navigationBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavigationBarWidget(
                        navbarpage: 'Homepage',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

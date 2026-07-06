import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_a_like" field.
  bool? _isALike;
  bool get isALike => _isALike ?? false;
  bool hasIsALike() => _isALike != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "made_by" field.
  DocumentReference? _madeBy;
  DocumentReference? get madeBy => _madeBy;
  bool hasMadeBy() => _madeBy != null;

  // "made_to" field.
  DocumentReference? _madeTo;
  DocumentReference? get madeTo => _madeTo;
  bool hasMadeTo() => _madeTo != null;

  // "notifTime" field.
  DateTime? _notifTime;
  DateTime? get notifTime => _notifTime;
  bool hasNotifTime() => _notifTime != null;

  // "is_a_dislike" field.
  bool? _isADislike;
  bool get isADislike => _isADislike ?? false;
  bool hasIsADislike() => _isADislike != null;

  // "made_by_username" field.
  String? _madeByUsername;
  String get madeByUsername => _madeByUsername ?? '';
  bool hasMadeByUsername() => _madeByUsername != null;

  // "is_a_comment" field.
  bool? _isAComment;
  bool get isAComment => _isAComment ?? false;
  bool hasIsAComment() => _isAComment != null;

  // "is_a_feedback" field.
  bool? _isAFeedback;
  bool get isAFeedback => _isAFeedback ?? false;
  bool hasIsAFeedback() => _isAFeedback != null;

  // "feedback_ref" field.
  DocumentReference? _feedbackRef;
  DocumentReference? get feedbackRef => _feedbackRef;
  bool hasFeedbackRef() => _feedbackRef != null;

  // "made_by_photoOfUser" field.
  String? _madeByPhotoOfUser;
  String get madeByPhotoOfUser => _madeByPhotoOfUser ?? '';
  bool hasMadeByPhotoOfUser() => _madeByPhotoOfUser != null;

  // "is_a_Req2Join" field.
  bool? _isAReq2Join;
  bool get isAReq2Join => _isAReq2Join ?? false;
  bool hasIsAReq2Join() => _isAReq2Join != null;

  // "group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "class_ref" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  void _initializeFields() {
    _isALike = snapshotData['is_a_like'] as bool?;
    _isRead = snapshotData['is_read'] as bool?;
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _madeBy = snapshotData['made_by'] as DocumentReference?;
    _madeTo = snapshotData['made_to'] as DocumentReference?;
    _notifTime = snapshotData['notifTime'] as DateTime?;
    _isADislike = snapshotData['is_a_dislike'] as bool?;
    _madeByUsername = snapshotData['made_by_username'] as String?;
    _isAComment = snapshotData['is_a_comment'] as bool?;
    _isAFeedback = snapshotData['is_a_feedback'] as bool?;
    _feedbackRef = snapshotData['feedback_ref'] as DocumentReference?;
    _madeByPhotoOfUser = snapshotData['made_by_photoOfUser'] as String?;
    _isAReq2Join = snapshotData['is_a_Req2Join'] as bool?;
    _groupRef = snapshotData['group_ref'] as DocumentReference?;
    _classRef = snapshotData['class_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  bool? isALike,
  bool? isRead,
  DocumentReference? postRef,
  DocumentReference? madeBy,
  DocumentReference? madeTo,
  DateTime? notifTime,
  bool? isADislike,
  String? madeByUsername,
  bool? isAComment,
  bool? isAFeedback,
  DocumentReference? feedbackRef,
  String? madeByPhotoOfUser,
  bool? isAReq2Join,
  DocumentReference? groupRef,
  DocumentReference? classRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_a_like': isALike,
      'is_read': isRead,
      'post_ref': postRef,
      'made_by': madeBy,
      'made_to': madeTo,
      'notifTime': notifTime,
      'is_a_dislike': isADislike,
      'made_by_username': madeByUsername,
      'is_a_comment': isAComment,
      'is_a_feedback': isAFeedback,
      'feedback_ref': feedbackRef,
      'made_by_photoOfUser': madeByPhotoOfUser,
      'is_a_Req2Join': isAReq2Join,
      'group_ref': groupRef,
      'class_ref': classRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.isALike == e2?.isALike &&
        e1?.isRead == e2?.isRead &&
        e1?.postRef == e2?.postRef &&
        e1?.madeBy == e2?.madeBy &&
        e1?.madeTo == e2?.madeTo &&
        e1?.notifTime == e2?.notifTime &&
        e1?.isADislike == e2?.isADislike &&
        e1?.madeByUsername == e2?.madeByUsername &&
        e1?.isAComment == e2?.isAComment &&
        e1?.isAFeedback == e2?.isAFeedback &&
        e1?.feedbackRef == e2?.feedbackRef &&
        e1?.madeByPhotoOfUser == e2?.madeByPhotoOfUser &&
        e1?.isAReq2Join == e2?.isAReq2Join &&
        e1?.groupRef == e2?.groupRef &&
        e1?.classRef == e2?.classRef;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.isALike,
        e?.isRead,
        e?.postRef,
        e?.madeBy,
        e?.madeTo,
        e?.notifTime,
        e?.isADislike,
        e?.madeByUsername,
        e?.isAComment,
        e?.isAFeedback,
        e?.feedbackRef,
        e?.madeByPhotoOfUser,
        e?.isAReq2Join,
        e?.groupRef,
        e?.classRef
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}

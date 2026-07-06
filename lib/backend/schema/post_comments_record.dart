import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentsRecord extends FirestoreRecord {
  PostCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "comment_postref" field.
  DocumentReference? _commentPostref;
  DocumentReference? get commentPostref => _commentPostref;
  bool hasCommentPostref() => _commentPostref != null;

  // "comment_userref" field.
  DocumentReference? _commentUserref;
  DocumentReference? get commentUserref => _commentUserref;
  bool hasCommentUserref() => _commentUserref != null;

  void _initializeFields() {
    _commentTime = snapshotData['comment_time'] as DateTime?;
    _commentText = snapshotData['comment_text'] as String?;
    _commentPostref = snapshotData['comment_postref'] as DocumentReference?;
    _commentUserref = snapshotData['comment_userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post_comments');

  static Stream<PostCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentsRecord.fromSnapshot(s));

  static Future<PostCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostCommentsRecord.fromSnapshot(s));

  static PostCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostCommentsRecordData({
  DateTime? commentTime,
  String? commentText,
  DocumentReference? commentPostref,
  DocumentReference? commentUserref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_time': commentTime,
      'comment_text': commentText,
      'comment_postref': commentPostref,
      'comment_userref': commentUserref,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostCommentsRecordDocumentEquality
    implements Equality<PostCommentsRecord> {
  const PostCommentsRecordDocumentEquality();

  @override
  bool equals(PostCommentsRecord? e1, PostCommentsRecord? e2) {
    return e1?.commentTime == e2?.commentTime &&
        e1?.commentText == e2?.commentText &&
        e1?.commentPostref == e2?.commentPostref &&
        e1?.commentUserref == e2?.commentUserref;
  }

  @override
  int hash(PostCommentsRecord? e) => const ListEquality().hash(
      [e?.commentTime, e?.commentText, e?.commentPostref, e?.commentUserref]);

  @override
  bool isValidKey(Object? o) => o is PostCommentsRecord;
}

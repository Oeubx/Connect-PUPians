import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "post_text" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "post_Likedby" field.
  List<DocumentReference>? _postLikedby;
  List<DocumentReference> get postLikedby => _postLikedby ?? const [];
  bool hasPostLikedby() => _postLikedby != null;

  // "post_Dislikedby" field.
  List<DocumentReference>? _postDislikedby;
  List<DocumentReference> get postDislikedby => _postDislikedby ?? const [];
  bool hasPostDislikedby() => _postDislikedby != null;

  // "post_timeposted" field.
  DateTime? _postTimeposted;
  DateTime? get postTimeposted => _postTimeposted;
  bool hasPostTimeposted() => _postTimeposted != null;

  // "post_commentsref" field.
  DocumentReference? _postCommentsref;
  DocumentReference? get postCommentsref => _postCommentsref;
  bool hasPostCommentsref() => _postCommentsref != null;

  // "post_image" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  // "group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "class_ref" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  void _initializeFields() {
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _postText = snapshotData['post_text'] as String?;
    _postLikedby = getDataList(snapshotData['post_Likedby']);
    _postDislikedby = getDataList(snapshotData['post_Dislikedby']);
    _postTimeposted = snapshotData['post_timeposted'] as DateTime?;
    _postCommentsref = snapshotData['post_commentsref'] as DocumentReference?;
    _postImage = snapshotData['post_image'] as String?;
    _groupRef = snapshotData['group_ref'] as DocumentReference?;
    _classRef = snapshotData['class_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference? postUser,
  String? postText,
  DateTime? postTimeposted,
  DocumentReference? postCommentsref,
  String? postImage,
  DocumentReference? groupRef,
  DocumentReference? classRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_user': postUser,
      'post_text': postText,
      'post_timeposted': postTimeposted,
      'post_commentsref': postCommentsref,
      'post_image': postImage,
      'group_ref': groupRef,
      'class_ref': classRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postUser == e2?.postUser &&
        e1?.postText == e2?.postText &&
        listEquality.equals(e1?.postLikedby, e2?.postLikedby) &&
        listEquality.equals(e1?.postDislikedby, e2?.postDislikedby) &&
        e1?.postTimeposted == e2?.postTimeposted &&
        e1?.postCommentsref == e2?.postCommentsref &&
        e1?.postImage == e2?.postImage &&
        e1?.groupRef == e2?.groupRef &&
        e1?.classRef == e2?.classRef;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postUser,
        e?.postText,
        e?.postLikedby,
        e?.postDislikedby,
        e?.postTimeposted,
        e?.postCommentsref,
        e?.postImage,
        e?.groupRef,
        e?.classRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}

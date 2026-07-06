import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyFeedbacksRecord extends FirestoreRecord {
  StudyFeedbacksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_Image" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  bool hasUserImage() => _userImage != null;

  // "user_feedback" field.
  String? _userFeedback;
  String get userFeedback => _userFeedback ?? '';
  bool hasUserFeedback() => _userFeedback != null;

  // "user_feedbackDate" field.
  DateTime? _userFeedbackDate;
  DateTime? get userFeedbackDate => _userFeedbackDate;
  bool hasUserFeedbackDate() => _userFeedbackDate != null;

  // "studypost_ref" field.
  DocumentReference? _studypostRef;
  DocumentReference? get studypostRef => _studypostRef;
  bool hasStudypostRef() => _studypostRef != null;

  // "user_name" field.
  DocumentReference? _userName;
  DocumentReference? get userName => _userName;
  bool hasUserName() => _userName != null;

  // "user_rating" field.
  int? _userRating;
  int get userRating => _userRating ?? 0;
  bool hasUserRating() => _userRating != null;

  // "user_double_rating" field.
  double? _userDoubleRating;
  double get userDoubleRating => _userDoubleRating ?? 0.0;
  bool hasUserDoubleRating() => _userDoubleRating != null;

  void _initializeFields() {
    _userImage = snapshotData['user_Image'] as String?;
    _userFeedback = snapshotData['user_feedback'] as String?;
    _userFeedbackDate = snapshotData['user_feedbackDate'] as DateTime?;
    _studypostRef = snapshotData['studypost_ref'] as DocumentReference?;
    _userName = snapshotData['user_name'] as DocumentReference?;
    _userRating = castToType<int>(snapshotData['user_rating']);
    _userDoubleRating = castToType<double>(snapshotData['user_double_rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('study_feedbacks');

  static Stream<StudyFeedbacksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyFeedbacksRecord.fromSnapshot(s));

  static Future<StudyFeedbacksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudyFeedbacksRecord.fromSnapshot(s));

  static StudyFeedbacksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudyFeedbacksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyFeedbacksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyFeedbacksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyFeedbacksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyFeedbacksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyFeedbacksRecordData({
  String? userImage,
  String? userFeedback,
  DateTime? userFeedbackDate,
  DocumentReference? studypostRef,
  DocumentReference? userName,
  int? userRating,
  double? userDoubleRating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_Image': userImage,
      'user_feedback': userFeedback,
      'user_feedbackDate': userFeedbackDate,
      'studypost_ref': studypostRef,
      'user_name': userName,
      'user_rating': userRating,
      'user_double_rating': userDoubleRating,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyFeedbacksRecordDocumentEquality
    implements Equality<StudyFeedbacksRecord> {
  const StudyFeedbacksRecordDocumentEquality();

  @override
  bool equals(StudyFeedbacksRecord? e1, StudyFeedbacksRecord? e2) {
    return e1?.userImage == e2?.userImage &&
        e1?.userFeedback == e2?.userFeedback &&
        e1?.userFeedbackDate == e2?.userFeedbackDate &&
        e1?.studypostRef == e2?.studypostRef &&
        e1?.userName == e2?.userName &&
        e1?.userRating == e2?.userRating &&
        e1?.userDoubleRating == e2?.userDoubleRating;
  }

  @override
  int hash(StudyFeedbacksRecord? e) => const ListEquality().hash([
        e?.userImage,
        e?.userFeedback,
        e?.userFeedbackDate,
        e?.studypostRef,
        e?.userName,
        e?.userRating,
        e?.userDoubleRating
      ]);

  @override
  bool isValidKey(Object? o) => o is StudyFeedbacksRecord;
}

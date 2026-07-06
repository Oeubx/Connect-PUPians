import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyPostsRecord extends FirestoreRecord {
  StudyPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tutor_specialization" field.
  String? _tutorSpecialization;
  String get tutorSpecialization => _tutorSpecialization ?? '';
  bool hasTutorSpecialization() => _tutorSpecialization != null;

  // "tutor_posttext" field.
  String? _tutorPosttext;
  String get tutorPosttext => _tutorPosttext ?? '';
  bool hasTutorPosttext() => _tutorPosttext != null;

  // "tutor_postTime" field.
  DateTime? _tutorPostTime;
  DateTime? get tutorPostTime => _tutorPostTime;
  bool hasTutorPostTime() => _tutorPostTime != null;

  // "feedback_ref" field.
  DocumentReference? _feedbackRef;
  DocumentReference? get feedbackRef => _feedbackRef;
  bool hasFeedbackRef() => _feedbackRef != null;

  // "tutor_posterRef" field.
  DocumentReference? _tutorPosterRef;
  DocumentReference? get tutorPosterRef => _tutorPosterRef;
  bool hasTutorPosterRef() => _tutorPosterRef != null;

  // "tutor_totalRating" field.
  List<int>? _tutorTotalRating;
  List<int> get tutorTotalRating => _tutorTotalRating ?? const [];
  bool hasTutorTotalRating() => _tutorTotalRating != null;

  // "tutor_double_TRating" field.
  List<double>? _tutorDoubleTRating;
  List<double> get tutorDoubleTRating => _tutorDoubleTRating ?? const [];
  bool hasTutorDoubleTRating() => _tutorDoubleTRating != null;

  void _initializeFields() {
    _tutorSpecialization = snapshotData['tutor_specialization'] as String?;
    _tutorPosttext = snapshotData['tutor_posttext'] as String?;
    _tutorPostTime = snapshotData['tutor_postTime'] as DateTime?;
    _feedbackRef = snapshotData['feedback_ref'] as DocumentReference?;
    _tutorPosterRef = snapshotData['tutor_posterRef'] as DocumentReference?;
    _tutorTotalRating = getDataList(snapshotData['tutor_totalRating']);
    _tutorDoubleTRating = getDataList(snapshotData['tutor_double_TRating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('study_posts');

  static Stream<StudyPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyPostsRecord.fromSnapshot(s));

  static Future<StudyPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudyPostsRecord.fromSnapshot(s));

  static StudyPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudyPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyPostsRecordData({
  String? tutorSpecialization,
  String? tutorPosttext,
  DateTime? tutorPostTime,
  DocumentReference? feedbackRef,
  DocumentReference? tutorPosterRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tutor_specialization': tutorSpecialization,
      'tutor_posttext': tutorPosttext,
      'tutor_postTime': tutorPostTime,
      'feedback_ref': feedbackRef,
      'tutor_posterRef': tutorPosterRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyPostsRecordDocumentEquality implements Equality<StudyPostsRecord> {
  const StudyPostsRecordDocumentEquality();

  @override
  bool equals(StudyPostsRecord? e1, StudyPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tutorSpecialization == e2?.tutorSpecialization &&
        e1?.tutorPosttext == e2?.tutorPosttext &&
        e1?.tutorPostTime == e2?.tutorPostTime &&
        e1?.feedbackRef == e2?.feedbackRef &&
        e1?.tutorPosterRef == e2?.tutorPosterRef &&
        listEquality.equals(e1?.tutorTotalRating, e2?.tutorTotalRating) &&
        listEquality.equals(e1?.tutorDoubleTRating, e2?.tutorDoubleTRating);
  }

  @override
  int hash(StudyPostsRecord? e) => const ListEquality().hash([
        e?.tutorSpecialization,
        e?.tutorPosttext,
        e?.tutorPostTime,
        e?.feedbackRef,
        e?.tutorPosterRef,
        e?.tutorTotalRating,
        e?.tutorDoubleTRating
      ]);

  @override
  bool isValidKey(Object? o) => o is StudyPostsRecord;
}

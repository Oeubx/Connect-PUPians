import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudActResponseRecord extends FirestoreRecord {
  StudActResponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "class_actMat_ref" field.
  DocumentReference? _classActMatRef;
  DocumentReference? get classActMatRef => _classActMatRef;
  bool hasClassActMatRef() => _classActMatRef != null;

  // "stud_has_attachment" field.
  bool? _studHasAttachment;
  bool get studHasAttachment => _studHasAttachment ?? false;
  bool hasStudHasAttachment() => _studHasAttachment != null;

  // "stud_img_attachment" field.
  String? _studImgAttachment;
  String get studImgAttachment => _studImgAttachment ?? '';
  bool hasStudImgAttachment() => _studImgAttachment != null;

  // "stud_comment" field.
  String? _studComment;
  String get studComment => _studComment ?? '';
  bool hasStudComment() => _studComment != null;

  // "response_Time" field.
  DateTime? _responseTime;
  DateTime? get responseTime => _responseTime;
  bool hasResponseTime() => _responseTime != null;

  // "student_ref" field.
  DocumentReference? _studentRef;
  DocumentReference? get studentRef => _studentRef;
  bool hasStudentRef() => _studentRef != null;

  // "stud_score" field.
  int? _studScore;
  int get studScore => _studScore ?? 0;
  bool hasStudScore() => _studScore != null;

  // "is_passed" field.
  bool? _isPassed;
  bool get isPassed => _isPassed ?? false;
  bool hasIsPassed() => _isPassed != null;

  // "is_failed" field.
  bool? _isFailed;
  bool get isFailed => _isFailed ?? false;
  bool hasIsFailed() => _isFailed != null;

  // "is_graded" field.
  bool? _isGraded;
  bool get isGraded => _isGraded ?? false;
  bool hasIsGraded() => _isGraded != null;

  void _initializeFields() {
    _classActMatRef = snapshotData['class_actMat_ref'] as DocumentReference?;
    _studHasAttachment = snapshotData['stud_has_attachment'] as bool?;
    _studImgAttachment = snapshotData['stud_img_attachment'] as String?;
    _studComment = snapshotData['stud_comment'] as String?;
    _responseTime = snapshotData['response_Time'] as DateTime?;
    _studentRef = snapshotData['student_ref'] as DocumentReference?;
    _studScore = castToType<int>(snapshotData['stud_score']);
    _isPassed = snapshotData['is_passed'] as bool?;
    _isFailed = snapshotData['is_failed'] as bool?;
    _isGraded = snapshotData['is_graded'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stud_act_response');

  static Stream<StudActResponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudActResponseRecord.fromSnapshot(s));

  static Future<StudActResponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudActResponseRecord.fromSnapshot(s));

  static StudActResponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudActResponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudActResponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudActResponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudActResponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudActResponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudActResponseRecordData({
  DocumentReference? classActMatRef,
  bool? studHasAttachment,
  String? studImgAttachment,
  String? studComment,
  DateTime? responseTime,
  DocumentReference? studentRef,
  int? studScore,
  bool? isPassed,
  bool? isFailed,
  bool? isGraded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'class_actMat_ref': classActMatRef,
      'stud_has_attachment': studHasAttachment,
      'stud_img_attachment': studImgAttachment,
      'stud_comment': studComment,
      'response_Time': responseTime,
      'student_ref': studentRef,
      'stud_score': studScore,
      'is_passed': isPassed,
      'is_failed': isFailed,
      'is_graded': isGraded,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudActResponseRecordDocumentEquality
    implements Equality<StudActResponseRecord> {
  const StudActResponseRecordDocumentEquality();

  @override
  bool equals(StudActResponseRecord? e1, StudActResponseRecord? e2) {
    return e1?.classActMatRef == e2?.classActMatRef &&
        e1?.studHasAttachment == e2?.studHasAttachment &&
        e1?.studImgAttachment == e2?.studImgAttachment &&
        e1?.studComment == e2?.studComment &&
        e1?.responseTime == e2?.responseTime &&
        e1?.studentRef == e2?.studentRef &&
        e1?.studScore == e2?.studScore &&
        e1?.isPassed == e2?.isPassed &&
        e1?.isFailed == e2?.isFailed &&
        e1?.isGraded == e2?.isGraded;
  }

  @override
  int hash(StudActResponseRecord? e) => const ListEquality().hash([
        e?.classActMatRef,
        e?.studHasAttachment,
        e?.studImgAttachment,
        e?.studComment,
        e?.responseTime,
        e?.studentRef,
        e?.studScore,
        e?.isPassed,
        e?.isFailed,
        e?.isGraded
      ]);

  @override
  bool isValidKey(Object? o) => o is StudActResponseRecord;
}

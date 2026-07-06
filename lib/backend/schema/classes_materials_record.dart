import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesMaterialsRecord extends FirestoreRecord {
  ClassesMaterialsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "is_a_material" field.
  String? _isAMaterial;
  String get isAMaterial => _isAMaterial ?? '';
  bool hasIsAMaterial() => _isAMaterial != null;

  // "is_an_activity" field.
  String? _isAnActivity;
  String get isAnActivity => _isAnActivity ?? '';
  bool hasIsAnActivity() => _isAnActivity != null;

  // "act_deadline" field.
  DateTime? _actDeadline;
  DateTime? get actDeadline => _actDeadline;
  bool hasActDeadline() => _actDeadline != null;

  // "act_maxscore" field.
  int? _actMaxscore;
  int get actMaxscore => _actMaxscore ?? 0;
  bool hasActMaxscore() => _actMaxscore != null;

  // "act_stud_ref" field.
  List<DocumentReference>? _actStudRef;
  List<DocumentReference> get actStudRef => _actStudRef ?? const [];
  bool hasActStudRef() => _actStudRef != null;

  // "act_no_duedate" field.
  bool? _actNoDuedate;
  bool get actNoDuedate => _actNoDuedate ?? false;
  bool hasActNoDuedate() => _actNoDuedate != null;

  // "act_max_score" field.
  String? _actMaxScore;
  String get actMaxScore => _actMaxScore ?? '';
  bool hasActMaxScore() => _actMaxScore != null;

  // "stud_response_ref" field.
  DocumentReference? _studResponseRef;
  DocumentReference? get studResponseRef => _studResponseRef;
  bool hasStudResponseRef() => _studResponseRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _isAMaterial = snapshotData['is_a_material'] as String?;
    _isAnActivity = snapshotData['is_an_activity'] as String?;
    _actDeadline = snapshotData['act_deadline'] as DateTime?;
    _actMaxscore = castToType<int>(snapshotData['act_maxscore']);
    _actStudRef = getDataList(snapshotData['act_stud_ref']);
    _actNoDuedate = snapshotData['act_no_duedate'] as bool?;
    _actMaxScore = snapshotData['act_max_score'] as String?;
    _studResponseRef = snapshotData['stud_response_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('classes_materials')
          : FirebaseFirestore.instance.collectionGroup('classes_materials');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('classes_materials').doc(id);

  static Stream<ClassesMaterialsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesMaterialsRecord.fromSnapshot(s));

  static Future<ClassesMaterialsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClassesMaterialsRecord.fromSnapshot(s));

  static ClassesMaterialsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesMaterialsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesMaterialsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesMaterialsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesMaterialsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesMaterialsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesMaterialsRecordData({
  DateTime? timePosted,
  String? postTitle,
  String? postDescription,
  String? isAMaterial,
  String? isAnActivity,
  DateTime? actDeadline,
  int? actMaxscore,
  bool? actNoDuedate,
  String? actMaxScore,
  DocumentReference? studResponseRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_posted': timePosted,
      'post_title': postTitle,
      'post_description': postDescription,
      'is_a_material': isAMaterial,
      'is_an_activity': isAnActivity,
      'act_deadline': actDeadline,
      'act_maxscore': actMaxscore,
      'act_no_duedate': actNoDuedate,
      'act_max_score': actMaxScore,
      'stud_response_ref': studResponseRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassesMaterialsRecordDocumentEquality
    implements Equality<ClassesMaterialsRecord> {
  const ClassesMaterialsRecordDocumentEquality();

  @override
  bool equals(ClassesMaterialsRecord? e1, ClassesMaterialsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timePosted == e2?.timePosted &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.isAMaterial == e2?.isAMaterial &&
        e1?.isAnActivity == e2?.isAnActivity &&
        e1?.actDeadline == e2?.actDeadline &&
        e1?.actMaxscore == e2?.actMaxscore &&
        listEquality.equals(e1?.actStudRef, e2?.actStudRef) &&
        e1?.actNoDuedate == e2?.actNoDuedate &&
        e1?.actMaxScore == e2?.actMaxScore &&
        e1?.studResponseRef == e2?.studResponseRef;
  }

  @override
  int hash(ClassesMaterialsRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.postTitle,
        e?.postDescription,
        e?.isAMaterial,
        e?.isAnActivity,
        e?.actDeadline,
        e?.actMaxscore,
        e?.actStudRef,
        e?.actNoDuedate,
        e?.actMaxScore,
        e?.studResponseRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassesMaterialsRecord;
}

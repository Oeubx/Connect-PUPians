import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRecord extends FirestoreRecord {
  ClassesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "class_name" field.
  String? _className;
  String get className => _className ?? '';
  bool hasClassName() => _className != null;

  // "class_section" field.
  String? _classSection;
  String get classSection => _classSection ?? '';
  bool hasClassSection() => _classSection != null;

  // "class_students" field.
  List<DocumentReference>? _classStudents;
  List<DocumentReference> get classStudents => _classStudents ?? const [];
  bool hasClassStudents() => _classStudents != null;

  // "class_desc" field.
  String? _classDesc;
  String get classDesc => _classDesc ?? '';
  bool hasClassDesc() => _classDesc != null;

  // "class_subject" field.
  String? _classSubject;
  String get classSubject => _classSubject ?? '';
  bool hasClassSubject() => _classSubject != null;

  // "latest_update_time" field.
  DateTime? _latestUpdateTime;
  DateTime? get latestUpdateTime => _latestUpdateTime;
  bool hasLatestUpdateTime() => _latestUpdateTime != null;

  // "class_sub_profs" field.
  List<DocumentReference>? _classSubProfs;
  List<DocumentReference> get classSubProfs => _classSubProfs ?? const [];
  bool hasClassSubProfs() => _classSubProfs != null;

  // "class_prof" field.
  DocumentReference? _classProf;
  DocumentReference? get classProf => _classProf;
  bool hasClassProf() => _classProf != null;

  // "class_recently_opened" field.
  List<DocumentReference>? _classRecentlyOpened;
  List<DocumentReference> get classRecentlyOpened =>
      _classRecentlyOpened ?? const [];
  bool hasClassRecentlyOpened() => _classRecentlyOpened != null;

  // "subtopics" field.
  List<DocumentReference>? _subtopics;
  List<DocumentReference> get subtopics => _subtopics ?? const [];
  bool hasSubtopics() => _subtopics != null;

  // "auth_user_leaveClass" field.
  bool? _authUserLeaveClass;
  bool get authUserLeaveClass => _authUserLeaveClass ?? false;
  bool hasAuthUserLeaveClass() => _authUserLeaveClass != null;

  void _initializeFields() {
    _className = snapshotData['class_name'] as String?;
    _classSection = snapshotData['class_section'] as String?;
    _classStudents = getDataList(snapshotData['class_students']);
    _classDesc = snapshotData['class_desc'] as String?;
    _classSubject = snapshotData['class_subject'] as String?;
    _latestUpdateTime = snapshotData['latest_update_time'] as DateTime?;
    _classSubProfs = getDataList(snapshotData['class_sub_profs']);
    _classProf = snapshotData['class_prof'] as DocumentReference?;
    _classRecentlyOpened = getDataList(snapshotData['class_recently_opened']);
    _subtopics = getDataList(snapshotData['subtopics']);
    _authUserLeaveClass = snapshotData['auth_user_leaveClass'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classes');

  static Stream<ClassesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRecord.fromSnapshot(s));

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassesRecord.fromSnapshot(s));

  static ClassesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesRecordData({
  String? className,
  String? classSection,
  String? classDesc,
  String? classSubject,
  DateTime? latestUpdateTime,
  DocumentReference? classProf,
  bool? authUserLeaveClass,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'class_name': className,
      'class_section': classSection,
      'class_desc': classDesc,
      'class_subject': classSubject,
      'latest_update_time': latestUpdateTime,
      'class_prof': classProf,
      'auth_user_leaveClass': authUserLeaveClass,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassesRecordDocumentEquality implements Equality<ClassesRecord> {
  const ClassesRecordDocumentEquality();

  @override
  bool equals(ClassesRecord? e1, ClassesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.className == e2?.className &&
        e1?.classSection == e2?.classSection &&
        listEquality.equals(e1?.classStudents, e2?.classStudents) &&
        e1?.classDesc == e2?.classDesc &&
        e1?.classSubject == e2?.classSubject &&
        e1?.latestUpdateTime == e2?.latestUpdateTime &&
        listEquality.equals(e1?.classSubProfs, e2?.classSubProfs) &&
        e1?.classProf == e2?.classProf &&
        listEquality.equals(e1?.classRecentlyOpened, e2?.classRecentlyOpened) &&
        listEquality.equals(e1?.subtopics, e2?.subtopics) &&
        e1?.authUserLeaveClass == e2?.authUserLeaveClass;
  }

  @override
  int hash(ClassesRecord? e) => const ListEquality().hash([
        e?.className,
        e?.classSection,
        e?.classStudents,
        e?.classDesc,
        e?.classSubject,
        e?.latestUpdateTime,
        e?.classSubProfs,
        e?.classProf,
        e?.classRecentlyOpened,
        e?.subtopics,
        e?.authUserLeaveClass
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassesRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupchatRecord extends FirestoreRecord {
  GroupchatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupchatname" field.
  String? _groupchatname;
  String get groupchatname => _groupchatname ?? '';
  bool hasGroupchatname() => _groupchatname != null;

  // "groupchat_image" field.
  String? _groupchatImage;
  String get groupchatImage => _groupchatImage ?? '';
  bool hasGroupchatImage() => _groupchatImage != null;

  // "gc_members" field.
  List<DocumentReference>? _gcMembers;
  List<DocumentReference> get gcMembers => _gcMembers ?? const [];
  bool hasGcMembers() => _gcMembers != null;

  // "gccreated_time" field.
  DateTime? _gccreatedTime;
  DateTime? get gccreatedTime => _gccreatedTime;
  bool hasGccreatedTime() => _gccreatedTime != null;

  // "deletegc_option" field.
  bool? _deletegcOption;
  bool get deletegcOption => _deletegcOption ?? false;
  bool hasDeletegcOption() => _deletegcOption != null;

  // "lastmsg_time" field.
  DateTime? _lastmsgTime;
  DateTime? get lastmsgTime => _lastmsgTime;
  bool hasLastmsgTime() => _lastmsgTime != null;

  // "lastmsg_in_gc" field.
  String? _lastmsgInGc;
  String get lastmsgInGc => _lastmsgInGc ?? '';
  bool hasLastmsgInGc() => _lastmsgInGc != null;

  // "num_of_mems" field.
  int? _numOfMems;
  int get numOfMems => _numOfMems ?? 0;
  bool hasNumOfMems() => _numOfMems != null;

  // "gcuser_lastmsg_seenby" field.
  List<DocumentReference>? _gcuserLastmsgSeenby;
  List<DocumentReference> get gcuserLastmsgSeenby =>
      _gcuserLastmsgSeenby ?? const [];
  bool hasGcuserLastmsgSeenby() => _gcuserLastmsgSeenby != null;

  void _initializeFields() {
    _groupchatname = snapshotData['groupchatname'] as String?;
    _groupchatImage = snapshotData['groupchat_image'] as String?;
    _gcMembers = getDataList(snapshotData['gc_members']);
    _gccreatedTime = snapshotData['gccreated_time'] as DateTime?;
    _deletegcOption = snapshotData['deletegc_option'] as bool?;
    _lastmsgTime = snapshotData['lastmsg_time'] as DateTime?;
    _lastmsgInGc = snapshotData['lastmsg_in_gc'] as String?;
    _numOfMems = castToType<int>(snapshotData['num_of_mems']);
    _gcuserLastmsgSeenby = getDataList(snapshotData['gcuser_lastmsg_seenby']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groupchat');

  static Stream<GroupchatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupchatRecord.fromSnapshot(s));

  static Future<GroupchatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupchatRecord.fromSnapshot(s));

  static GroupchatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupchatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupchatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupchatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupchatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupchatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupchatRecordData({
  String? groupchatname,
  String? groupchatImage,
  DateTime? gccreatedTime,
  bool? deletegcOption,
  DateTime? lastmsgTime,
  String? lastmsgInGc,
  int? numOfMems,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupchatname': groupchatname,
      'groupchat_image': groupchatImage,
      'gccreated_time': gccreatedTime,
      'deletegc_option': deletegcOption,
      'lastmsg_time': lastmsgTime,
      'lastmsg_in_gc': lastmsgInGc,
      'num_of_mems': numOfMems,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupchatRecordDocumentEquality implements Equality<GroupchatRecord> {
  const GroupchatRecordDocumentEquality();

  @override
  bool equals(GroupchatRecord? e1, GroupchatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupchatname == e2?.groupchatname &&
        e1?.groupchatImage == e2?.groupchatImage &&
        listEquality.equals(e1?.gcMembers, e2?.gcMembers) &&
        e1?.gccreatedTime == e2?.gccreatedTime &&
        e1?.deletegcOption == e2?.deletegcOption &&
        e1?.lastmsgTime == e2?.lastmsgTime &&
        e1?.lastmsgInGc == e2?.lastmsgInGc &&
        e1?.numOfMems == e2?.numOfMems &&
        listEquality.equals(e1?.gcuserLastmsgSeenby, e2?.gcuserLastmsgSeenby);
  }

  @override
  int hash(GroupchatRecord? e) => const ListEquality().hash([
        e?.groupchatname,
        e?.groupchatImage,
        e?.gcMembers,
        e?.gccreatedTime,
        e?.deletegcOption,
        e?.lastmsgTime,
        e?.lastmsgInGc,
        e?.numOfMems,
        e?.gcuserLastmsgSeenby
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupchatRecord;
}

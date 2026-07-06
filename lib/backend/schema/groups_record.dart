import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Groupname" field.
  String? _groupname;
  String get groupname => _groupname ?? '';
  bool hasGroupname() => _groupname != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "request_pending" field.
  List<DocumentReference>? _requestPending;
  List<DocumentReference> get requestPending => _requestPending ?? const [];
  bool hasRequestPending() => _requestPending != null;

  // "group_members" field.
  List<DocumentReference>? _groupMembers;
  List<DocumentReference> get groupMembers => _groupMembers ?? const [];
  bool hasGroupMembers() => _groupMembers != null;

  // "group_mods" field.
  List<DocumentReference>? _groupMods;
  List<DocumentReference> get groupMods => _groupMods ?? const [];
  bool hasGroupMods() => _groupMods != null;

  // "Group_img" field.
  String? _groupImg;
  String get groupImg => _groupImg ?? '';
  bool hasGroupImg() => _groupImg != null;

  // "Group_desc" field.
  String? _groupDesc;
  String get groupDesc => _groupDesc ?? '';
  bool hasGroupDesc() => _groupDesc != null;

  // "group_owned_by" field.
  DocumentReference? _groupOwnedBy;
  DocumentReference? get groupOwnedBy => _groupOwnedBy;
  bool hasGroupOwnedBy() => _groupOwnedBy != null;

  void _initializeFields() {
    _groupname = snapshotData['Groupname'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _requestPending = getDataList(snapshotData['request_pending']);
    _groupMembers = getDataList(snapshotData['group_members']);
    _groupMods = getDataList(snapshotData['group_mods']);
    _groupImg = snapshotData['Group_img'] as String?;
    _groupDesc = snapshotData['Group_desc'] as String?;
    _groupOwnedBy = snapshotData['group_owned_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? groupname,
  DateTime? createdTime,
  String? groupImg,
  String? groupDesc,
  DocumentReference? groupOwnedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Groupname': groupname,
      'created_time': createdTime,
      'Group_img': groupImg,
      'Group_desc': groupDesc,
      'group_owned_by': groupOwnedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupname == e2?.groupname &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.requestPending, e2?.requestPending) &&
        listEquality.equals(e1?.groupMembers, e2?.groupMembers) &&
        listEquality.equals(e1?.groupMods, e2?.groupMods) &&
        e1?.groupImg == e2?.groupImg &&
        e1?.groupDesc == e2?.groupDesc &&
        e1?.groupOwnedBy == e2?.groupOwnedBy;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.groupname,
        e?.createdTime,
        e?.requestPending,
        e?.groupMembers,
        e?.groupMods,
        e?.groupImg,
        e?.groupDesc,
        e?.groupOwnedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}

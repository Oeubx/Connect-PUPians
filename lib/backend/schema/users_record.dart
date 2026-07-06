import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "SIS_ID" field.
  String? _sisId;
  String get sisId => _sisId ?? '';
  bool hasSisId() => _sisId != null;

  // "userprofile_bio" field.
  String? _userprofileBio;
  String get userprofileBio => _userprofileBio ?? '';
  bool hasUserprofileBio() => _userprofileBio != null;

  // "user_standing" field.
  String? _userStanding;
  String get userStanding => _userStanding ?? '';
  bool hasUserStanding() => _userStanding != null;

  // "user_birthdate" field.
  DateTime? _userBirthdate;
  DateTime? get userBirthdate => _userBirthdate;
  bool hasUserBirthdate() => _userBirthdate != null;

  // "backgroundphoto_url" field.
  String? _backgroundphotoUrl;
  String get backgroundphotoUrl => _backgroundphotoUrl ?? '';
  bool hasBackgroundphotoUrl() => _backgroundphotoUrl != null;

  // "following_users" field.
  List<DocumentReference>? _followingUsers;
  List<DocumentReference> get followingUsers => _followingUsers ?? const [];
  bool hasFollowingUsers() => _followingUsers != null;

  // "users_followingme" field.
  List<DocumentReference>? _usersFollowingme;
  List<DocumentReference> get usersFollowingme => _usersFollowingme ?? const [];
  bool hasUsersFollowingme() => _usersFollowingme != null;

  // "user_PersonalMsgList" field.
  List<DocumentReference>? _userPersonalMsgList;
  List<DocumentReference> get userPersonalMsgList =>
      _userPersonalMsgList ?? const [];
  bool hasUserPersonalMsgList() => _userPersonalMsgList != null;

  // "user_inGroupChat" field.
  List<DocumentReference>? _userInGroupChat;
  List<DocumentReference> get userInGroupChat => _userInGroupChat ?? const [];
  bool hasUserInGroupChat() => _userInGroupChat != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _sisId = snapshotData['SIS_ID'] as String?;
    _userprofileBio = snapshotData['userprofile_bio'] as String?;
    _userStanding = snapshotData['user_standing'] as String?;
    _userBirthdate = snapshotData['user_birthdate'] as DateTime?;
    _backgroundphotoUrl = snapshotData['backgroundphoto_url'] as String?;
    _followingUsers = getDataList(snapshotData['following_users']);
    _usersFollowingme = getDataList(snapshotData['users_followingme']);
    _userPersonalMsgList = getDataList(snapshotData['user_PersonalMsgList']);
    _userInGroupChat = getDataList(snapshotData['user_inGroupChat']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? sisId,
  String? userprofileBio,
  String? userStanding,
  DateTime? userBirthdate,
  String? backgroundphotoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'SIS_ID': sisId,
      'userprofile_bio': userprofileBio,
      'user_standing': userStanding,
      'user_birthdate': userBirthdate,
      'backgroundphoto_url': backgroundphotoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.sisId == e2?.sisId &&
        e1?.userprofileBio == e2?.userprofileBio &&
        e1?.userStanding == e2?.userStanding &&
        e1?.userBirthdate == e2?.userBirthdate &&
        e1?.backgroundphotoUrl == e2?.backgroundphotoUrl &&
        listEquality.equals(e1?.followingUsers, e2?.followingUsers) &&
        listEquality.equals(e1?.usersFollowingme, e2?.usersFollowingme) &&
        listEquality.equals(e1?.userPersonalMsgList, e2?.userPersonalMsgList) &&
        listEquality.equals(e1?.userInGroupChat, e2?.userInGroupChat);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.sisId,
        e?.userprofileBio,
        e?.userStanding,
        e?.userBirthdate,
        e?.backgroundphotoUrl,
        e?.followingUsers,
        e?.usersFollowingme,
        e?.userPersonalMsgList,
        e?.userInGroupChat
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

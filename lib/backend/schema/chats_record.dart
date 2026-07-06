import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_LastMessage" field.
  String? _userLastMessage;
  String get userLastMessage => _userLastMessage ?? '';
  bool hasUserLastMessage() => _userLastMessage != null;

  // "user_Names" field.
  List<String>? _userNames;
  List<String> get userNames => _userNames ?? const [];
  bool hasUserNames() => _userNames != null;

  // "chats_TimeStamp" field.
  DateTime? _chatsTimeStamp;
  DateTime? get chatsTimeStamp => _chatsTimeStamp;
  bool hasChatsTimeStamp() => _chatsTimeStamp != null;

  // "user_LastMessageSeenBy" field.
  List<DocumentReference>? _userLastMessageSeenBy;
  List<DocumentReference> get userLastMessageSeenBy =>
      _userLastMessageSeenBy ?? const [];
  bool hasUserLastMessageSeenBy() => _userLastMessageSeenBy != null;

  // "user_UIDs" field.
  List<DocumentReference>? _userUIDs;
  List<DocumentReference> get userUIDs => _userUIDs ?? const [];
  bool hasUserUIDs() => _userUIDs != null;

  // "delete_option" field.
  bool? _deleteOption;
  bool get deleteOption => _deleteOption ?? false;
  bool hasDeleteOption() => _deleteOption != null;

  // "chat_initiator" field.
  DocumentReference? _chatInitiator;
  DocumentReference? get chatInitiator => _chatInitiator;
  bool hasChatInitiator() => _chatInitiator != null;

  // "initiator_chosenOne" field.
  DocumentReference? _initiatorChosenOne;
  DocumentReference? get initiatorChosenOne => _initiatorChosenOne;
  bool hasInitiatorChosenOne() => _initiatorChosenOne != null;

  void _initializeFields() {
    _userLastMessage = snapshotData['user_LastMessage'] as String?;
    _userNames = getDataList(snapshotData['user_Names']);
    _chatsTimeStamp = snapshotData['chats_TimeStamp'] as DateTime?;
    _userLastMessageSeenBy =
        getDataList(snapshotData['user_LastMessageSeenBy']);
    _userUIDs = getDataList(snapshotData['user_UIDs']);
    _deleteOption = snapshotData['delete_option'] as bool?;
    _chatInitiator = snapshotData['chat_initiator'] as DocumentReference?;
    _initiatorChosenOne =
        snapshotData['initiator_chosenOne'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? userLastMessage,
  DateTime? chatsTimeStamp,
  bool? deleteOption,
  DocumentReference? chatInitiator,
  DocumentReference? initiatorChosenOne,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_LastMessage': userLastMessage,
      'chats_TimeStamp': chatsTimeStamp,
      'delete_option': deleteOption,
      'chat_initiator': chatInitiator,
      'initiator_chosenOne': initiatorChosenOne,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userLastMessage == e2?.userLastMessage &&
        listEquality.equals(e1?.userNames, e2?.userNames) &&
        e1?.chatsTimeStamp == e2?.chatsTimeStamp &&
        listEquality.equals(
            e1?.userLastMessageSeenBy, e2?.userLastMessageSeenBy) &&
        listEquality.equals(e1?.userUIDs, e2?.userUIDs) &&
        e1?.deleteOption == e2?.deleteOption &&
        e1?.chatInitiator == e2?.chatInitiator &&
        e1?.initiatorChosenOne == e2?.initiatorChosenOne;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userLastMessage,
        e?.userNames,
        e?.chatsTimeStamp,
        e?.userLastMessageSeenBy,
        e?.userUIDs,
        e?.deleteOption,
        e?.chatInitiator,
        e?.initiatorChosenOne
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}

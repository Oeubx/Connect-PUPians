import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_Message" field.
  String? _userMessage;
  String get userMessage => _userMessage ?? '';
  bool hasUserMessage() => _userMessage != null;

  // "msg_TimeStamp" field.
  DateTime? _msgTimeStamp;
  DateTime? get msgTimeStamp => _msgTimeStamp;
  bool hasMsgTimeStamp() => _msgTimeStamp != null;

  // "UID_of_Sender" field.
  DocumentReference? _uIDOfSender;
  DocumentReference? get uIDOfSender => _uIDOfSender;
  bool hasUIDOfSender() => _uIDOfSender != null;

  // "msgName_of_Sender" field.
  String? _msgNameOfSender;
  String get msgNameOfSender => _msgNameOfSender ?? '';
  bool hasMsgNameOfSender() => _msgNameOfSender != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userMessage = snapshotData['user_Message'] as String?;
    _msgTimeStamp = snapshotData['msg_TimeStamp'] as DateTime?;
    _uIDOfSender = snapshotData['UID_of_Sender'] as DocumentReference?;
    _msgNameOfSender = snapshotData['msgName_of_Sender'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_Messages')
          : FirebaseFirestore.instance.collectionGroup('chat_Messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat_Messages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? userMessage,
  DateTime? msgTimeStamp,
  DocumentReference? uIDOfSender,
  String? msgNameOfSender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_Message': userMessage,
      'msg_TimeStamp': msgTimeStamp,
      'UID_of_Sender': uIDOfSender,
      'msgName_of_Sender': msgNameOfSender,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.userMessage == e2?.userMessage &&
        e1?.msgTimeStamp == e2?.msgTimeStamp &&
        e1?.uIDOfSender == e2?.uIDOfSender &&
        e1?.msgNameOfSender == e2?.msgNameOfSender;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash(
      [e?.userMessage, e?.msgTimeStamp, e?.uIDOfSender, e?.msgNameOfSender]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}

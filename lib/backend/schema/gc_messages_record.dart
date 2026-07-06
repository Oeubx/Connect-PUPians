import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GcMessagesRecord extends FirestoreRecord {
  GcMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "gc_user_message" field.
  String? _gcUserMessage;
  String get gcUserMessage => _gcUserMessage ?? '';
  bool hasGcUserMessage() => _gcUserMessage != null;

  // "UID_of_sender" field.
  DocumentReference? _uIDOfSender;
  DocumentReference? get uIDOfSender => _uIDOfSender;
  bool hasUIDOfSender() => _uIDOfSender != null;

  // "gc_lastmsg" field.
  String? _gcLastmsg;
  String get gcLastmsg => _gcLastmsg ?? '';
  bool hasGcLastmsg() => _gcLastmsg != null;

  // "gc_msg_time" field.
  DateTime? _gcMsgTime;
  DateTime? get gcMsgTime => _gcMsgTime;
  bool hasGcMsgTime() => _gcMsgTime != null;

  // "gc_msgsender_name" field.
  String? _gcMsgsenderName;
  String get gcMsgsenderName => _gcMsgsenderName ?? '';
  bool hasGcMsgsenderName() => _gcMsgsenderName != null;

  // "gc_msgsender_img" field.
  String? _gcMsgsenderImg;
  String get gcMsgsenderImg => _gcMsgsenderImg ?? '';
  bool hasGcMsgsenderImg() => _gcMsgsenderImg != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _gcUserMessage = snapshotData['gc_user_message'] as String?;
    _uIDOfSender = snapshotData['UID_of_sender'] as DocumentReference?;
    _gcLastmsg = snapshotData['gc_lastmsg'] as String?;
    _gcMsgTime = snapshotData['gc_msg_time'] as DateTime?;
    _gcMsgsenderName = snapshotData['gc_msgsender_name'] as String?;
    _gcMsgsenderImg = snapshotData['gc_msgsender_img'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('gc_messages')
          : FirebaseFirestore.instance.collectionGroup('gc_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('gc_messages').doc(id);

  static Stream<GcMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GcMessagesRecord.fromSnapshot(s));

  static Future<GcMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GcMessagesRecord.fromSnapshot(s));

  static GcMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GcMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GcMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GcMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GcMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GcMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGcMessagesRecordData({
  String? gcUserMessage,
  DocumentReference? uIDOfSender,
  String? gcLastmsg,
  DateTime? gcMsgTime,
  String? gcMsgsenderName,
  String? gcMsgsenderImg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gc_user_message': gcUserMessage,
      'UID_of_sender': uIDOfSender,
      'gc_lastmsg': gcLastmsg,
      'gc_msg_time': gcMsgTime,
      'gc_msgsender_name': gcMsgsenderName,
      'gc_msgsender_img': gcMsgsenderImg,
    }.withoutNulls,
  );

  return firestoreData;
}

class GcMessagesRecordDocumentEquality implements Equality<GcMessagesRecord> {
  const GcMessagesRecordDocumentEquality();

  @override
  bool equals(GcMessagesRecord? e1, GcMessagesRecord? e2) {
    return e1?.gcUserMessage == e2?.gcUserMessage &&
        e1?.uIDOfSender == e2?.uIDOfSender &&
        e1?.gcLastmsg == e2?.gcLastmsg &&
        e1?.gcMsgTime == e2?.gcMsgTime &&
        e1?.gcMsgsenderName == e2?.gcMsgsenderName &&
        e1?.gcMsgsenderImg == e2?.gcMsgsenderImg;
  }

  @override
  int hash(GcMessagesRecord? e) => const ListEquality().hash([
        e?.gcUserMessage,
        e?.uIDOfSender,
        e?.gcLastmsg,
        e?.gcMsgTime,
        e?.gcMsgsenderName,
        e?.gcMsgsenderImg
      ]);

  @override
  bool isValidKey(Object? o) => o is GcMessagesRecord;
}

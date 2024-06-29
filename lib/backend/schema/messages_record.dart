import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "uniqueID" field.
  String? _uniqueID;
  String get uniqueID => _uniqueID ?? '';
  bool hasUniqueID() => _uniqueID != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "messageContent" field.
  String? _messageContent;
  String get messageContent => _messageContent ?? '';
  bool hasMessageContent() => _messageContent != null;

  // "thread_id" field.
  String? _threadId;
  String get threadId => _threadId ?? '';
  bool hasThreadId() => _threadId != null;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userID = snapshotData['userID'] as String?;
    _uniqueID = snapshotData['uniqueID'] as String?;
    _sender = snapshotData['sender'] as String?;
    _messageContent = snapshotData['messageContent'] as String?;
    _threadId = snapshotData['thread_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DateTime? timestamp,
  String? userID,
  String? uniqueID,
  String? sender,
  String? messageContent,
  String? threadId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'userID': userID,
      'uniqueID': uniqueID,
      'sender': sender,
      'messageContent': messageContent,
      'thread_id': threadId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.userID == e2?.userID &&
        e1?.uniqueID == e2?.uniqueID &&
        e1?.sender == e2?.sender &&
        e1?.messageContent == e2?.messageContent &&
        e1?.threadId == e2?.threadId;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.userID,
        e?.uniqueID,
        e?.sender,
        e?.messageContent,
        e?.threadId
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatbotPerfomanceRecord extends FirestoreRecord {
  ChatbotPerfomanceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  double? _userID;
  double get userID => _userID ?? 0.0;
  bool hasUserID() => _userID != null;

  // "chatCount" field.
  int? _chatCount;
  int get chatCount => _chatCount ?? 0;
  bool hasChatCount() => _chatCount != null;

  // "chatDate" field.
  DateTime? _chatDate;
  DateTime? get chatDate => _chatDate;
  bool hasChatDate() => _chatDate != null;

  // "usedToken" field.
  int? _usedToken;
  int get usedToken => _usedToken ?? 0;
  bool hasUsedToken() => _usedToken != null;

  void _initializeFields() {
    _userID = castToType<double>(snapshotData['userID']);
    _chatCount = castToType<int>(snapshotData['chatCount']);
    _chatDate = snapshotData['chatDate'] as DateTime?;
    _usedToken = castToType<int>(snapshotData['usedToken']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatbot_perfomance');

  static Stream<ChatbotPerfomanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatbotPerfomanceRecord.fromSnapshot(s));

  static Future<ChatbotPerfomanceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChatbotPerfomanceRecord.fromSnapshot(s));

  static ChatbotPerfomanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatbotPerfomanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatbotPerfomanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatbotPerfomanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatbotPerfomanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatbotPerfomanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatbotPerfomanceRecordData({
  double? userID,
  int? chatCount,
  DateTime? chatDate,
  int? usedToken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'chatCount': chatCount,
      'chatDate': chatDate,
      'usedToken': usedToken,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatbotPerfomanceRecordDocumentEquality
    implements Equality<ChatbotPerfomanceRecord> {
  const ChatbotPerfomanceRecordDocumentEquality();

  @override
  bool equals(ChatbotPerfomanceRecord? e1, ChatbotPerfomanceRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.chatCount == e2?.chatCount &&
        e1?.chatDate == e2?.chatDate &&
        e1?.usedToken == e2?.usedToken;
  }

  @override
  int hash(ChatbotPerfomanceRecord? e) => const ListEquality()
      .hash([e?.userID, e?.chatCount, e?.chatDate, e?.usedToken]);

  @override
  bool isValidKey(Object? o) => o is ChatbotPerfomanceRecord;
}

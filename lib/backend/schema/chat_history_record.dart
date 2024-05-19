import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatHistoryRecord extends FirestoreRecord {
  ChatHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "chatDate" field.
  DateTime? _chatDate;
  DateTime? get chatDate => _chatDate;
  bool hasChatDate() => _chatDate != null;

  // "visitor_name" field.
  String? _visitorName;
  String get visitorName => _visitorName ?? '';
  bool hasVisitorName() => _visitorName != null;

  // "visitor_email" field.
  String? _visitorEmail;
  String get visitorEmail => _visitorEmail ?? '';
  bool hasVisitorEmail() => _visitorEmail != null;

  // "visitor_phoneNumber" field.
  int? _visitorPhoneNumber;
  int get visitorPhoneNumber => _visitorPhoneNumber ?? 0;
  bool hasVisitorPhoneNumber() => _visitorPhoneNumber != null;

  // "chatUniqueId" field.
  String? _chatUniqueId;
  String get chatUniqueId => _chatUniqueId ?? '';
  bool hasChatUniqueId() => _chatUniqueId != null;

  // "chatMessages" field.
  List<ContentStruct>? _chatMessages;
  List<ContentStruct> get chatMessages => _chatMessages ?? const [];
  bool hasChatMessages() => _chatMessages != null;

  // "used_token" field.
  int? _usedToken;
  int get usedToken => _usedToken ?? 0;
  bool hasUsedToken() => _usedToken != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _chatDate = snapshotData['chatDate'] as DateTime?;
    _visitorName = snapshotData['visitor_name'] as String?;
    _visitorEmail = snapshotData['visitor_email'] as String?;
    _visitorPhoneNumber = castToType<int>(snapshotData['visitor_phoneNumber']);
    _chatUniqueId = snapshotData['chatUniqueId'] as String?;
    _chatMessages = getStructList(
      snapshotData['chatMessages'],
      ContentStruct.fromMap,
    );
    _usedToken = castToType<int>(snapshotData['used_token']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatHistory');

  static Stream<ChatHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatHistoryRecord.fromSnapshot(s));

  static Future<ChatHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatHistoryRecord.fromSnapshot(s));

  static ChatHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatHistoryRecordData({
  String? userID,
  DateTime? chatDate,
  String? visitorName,
  String? visitorEmail,
  int? visitorPhoneNumber,
  String? chatUniqueId,
  int? usedToken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'chatDate': chatDate,
      'visitor_name': visitorName,
      'visitor_email': visitorEmail,
      'visitor_phoneNumber': visitorPhoneNumber,
      'chatUniqueId': chatUniqueId,
      'used_token': usedToken,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatHistoryRecordDocumentEquality implements Equality<ChatHistoryRecord> {
  const ChatHistoryRecordDocumentEquality();

  @override
  bool equals(ChatHistoryRecord? e1, ChatHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userID == e2?.userID &&
        e1?.chatDate == e2?.chatDate &&
        e1?.visitorName == e2?.visitorName &&
        e1?.visitorEmail == e2?.visitorEmail &&
        e1?.visitorPhoneNumber == e2?.visitorPhoneNumber &&
        e1?.chatUniqueId == e2?.chatUniqueId &&
        listEquality.equals(e1?.chatMessages, e2?.chatMessages) &&
        e1?.usedToken == e2?.usedToken;
  }

  @override
  int hash(ChatHistoryRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.chatDate,
        e?.visitorName,
        e?.visitorEmail,
        e?.visitorPhoneNumber,
        e?.chatUniqueId,
        e?.chatMessages,
        e?.usedToken
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatHistoryRecord;
}

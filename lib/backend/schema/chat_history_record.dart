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

  // "used_token" field.
  int? _usedToken;
  int get usedToken => _usedToken ?? 0;
  bool hasUsedToken() => _usedToken != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "chat_feedback" field.
  int? _chatFeedback;
  int get chatFeedback => _chatFeedback ?? 0;
  bool hasChatFeedback() => _chatFeedback != null;

  // "message_seen" field.
  bool? _messageSeen;
  bool get messageSeen => _messageSeen ?? false;
  bool hasMessageSeen() => _messageSeen != null;

  // "starred" field.
  bool? _starred;
  bool get starred => _starred ?? false;
  bool hasStarred() => _starred != null;

  // "expert_joined" field.
  bool? _expertJoined;
  bool get expertJoined => _expertJoined ?? false;
  bool hasExpertJoined() => _expertJoined != null;

  // "thread_id" field.
  String? _threadId;
  String get threadId => _threadId ?? '';
  bool hasThreadId() => _threadId != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _chatDate = snapshotData['chatDate'] as DateTime?;
    _visitorName = snapshotData['visitor_name'] as String?;
    _visitorEmail = snapshotData['visitor_email'] as String?;
    _visitorPhoneNumber = castToType<int>(snapshotData['visitor_phoneNumber']);
    _chatUniqueId = snapshotData['chatUniqueId'] as String?;
    _usedToken = castToType<int>(snapshotData['used_token']);
    _businessName = snapshotData['business_name'] as String?;
    _chatFeedback = castToType<int>(snapshotData['chat_feedback']);
    _messageSeen = snapshotData['message_seen'] as bool?;
    _starred = snapshotData['starred'] as bool?;
    _expertJoined = snapshotData['expert_joined'] as bool?;
    _threadId = snapshotData['thread_id'] as String?;
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
  String? businessName,
  int? chatFeedback,
  bool? messageSeen,
  bool? starred,
  bool? expertJoined,
  String? threadId,
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
      'business_name': businessName,
      'chat_feedback': chatFeedback,
      'message_seen': messageSeen,
      'starred': starred,
      'expert_joined': expertJoined,
      'thread_id': threadId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatHistoryRecordDocumentEquality implements Equality<ChatHistoryRecord> {
  const ChatHistoryRecordDocumentEquality();

  @override
  bool equals(ChatHistoryRecord? e1, ChatHistoryRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.chatDate == e2?.chatDate &&
        e1?.visitorName == e2?.visitorName &&
        e1?.visitorEmail == e2?.visitorEmail &&
        e1?.visitorPhoneNumber == e2?.visitorPhoneNumber &&
        e1?.chatUniqueId == e2?.chatUniqueId &&
        e1?.usedToken == e2?.usedToken &&
        e1?.businessName == e2?.businessName &&
        e1?.chatFeedback == e2?.chatFeedback &&
        e1?.messageSeen == e2?.messageSeen &&
        e1?.starred == e2?.starred &&
        e1?.expertJoined == e2?.expertJoined &&
        e1?.threadId == e2?.threadId;
  }

  @override
  int hash(ChatHistoryRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.chatDate,
        e?.visitorName,
        e?.visitorEmail,
        e?.visitorPhoneNumber,
        e?.chatUniqueId,
        e?.usedToken,
        e?.businessName,
        e?.chatFeedback,
        e?.messageSeen,
        e?.starred,
        e?.expertJoined,
        e?.threadId
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatHistoryRecord;
}

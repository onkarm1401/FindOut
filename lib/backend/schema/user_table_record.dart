import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserTableRecord extends FirestoreRecord {
  UserTableRecord._(
    super.reference,
    super.data,
  ) {
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

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "chatbot_descripation" field.
  String? _chatbotDescripation;
  String get chatbotDescripation => _chatbotDescripation ?? '';
  bool hasChatbotDescripation() => _chatbotDescripation != null;

  // "chatbot_logo" field.
  String? _chatbotLogo;
  String get chatbotLogo => _chatbotLogo ?? '';
  bool hasChatbotLogo() => _chatbotLogo != null;

  // "welcome_message_for_visitor" field.
  String? _welcomeMessageForVisitor;
  String get welcomeMessageForVisitor => _welcomeMessageForVisitor ?? '';
  bool hasWelcomeMessageForVisitor() => _welcomeMessageForVisitor != null;

  // "chatbot_text_box_placeholder" field.
  String? _chatbotTextBoxPlaceholder;
  String get chatbotTextBoxPlaceholder => _chatbotTextBoxPlaceholder ?? '';
  bool hasChatbotTextBoxPlaceholder() => _chatbotTextBoxPlaceholder != null;

  // "NoAnswerBotReplyText" field.
  String? _noAnswerBotReplyText;
  String get noAnswerBotReplyText => _noAnswerBotReplyText ?? '';
  bool hasNoAnswerBotReplyText() => _noAnswerBotReplyText != null;

  // "CollectUserData" field.
  bool? _collectUserData;
  bool get collectUserData => _collectUserData ?? false;
  bool hasCollectUserData() => _collectUserData != null;

  // "CollectUserDataFields" field.
  List<String>? _collectUserDataFields;
  List<String> get collectUserDataFields => _collectUserDataFields ?? const [];
  bool hasCollectUserDataFields() => _collectUserDataFields != null;

  // "MaximumTokenToUseForBotAnswer" field.
  int? _maximumTokenToUseForBotAnswer;
  int get maximumTokenToUseForBotAnswer => _maximumTokenToUseForBotAnswer ?? 0;
  bool hasMaximumTokenToUseForBotAnswer() =>
      _maximumTokenToUseForBotAnswer != null;

  // "websiteFetchedData" field.
  String? _websiteFetchedData;
  String get websiteFetchedData => _websiteFetchedData ?? '';
  bool hasWebsiteFetchedData() => _websiteFetchedData != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "openAI_AssistentId" field.
  String? _openAIAssistentId;
  String get openAIAssistentId => _openAIAssistentId ?? '';
  bool hasOpenAIAssistentId() => _openAIAssistentId != null;

  // "chatbot_instruction" field.
  String? _chatbotInstruction;
  String get chatbotInstruction => _chatbotInstruction ?? '';
  bool hasChatbotInstruction() => _chatbotInstruction != null;

  // "chatbot_model" field.
  List<String>? _chatbotModel;
  List<String> get chatbotModel => _chatbotModel ?? const [];
  bool hasChatbotModel() => _chatbotModel != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "vector_stores_id" field.
  String? _vectorStoresId;
  String get vectorStoresId => _vectorStoresId ?? '';
  bool hasVectorStoresId() => _vectorStoresId != null;

  // "uploadedFileName" field.
  String? _uploadedFileName;
  String get uploadedFileName => _uploadedFileName ?? '';
  bool hasUploadedFileName() => _uploadedFileName != null;

  // "FAQ_data" field.
  String? _fAQData;
  String get fAQData => _fAQData ?? '';
  bool hasFAQData() => _fAQData != null;

  // "textOptimizationInstructions" field.
  String? _textOptimizationInstructions;
  String get textOptimizationInstructions =>
      _textOptimizationInstructions ?? '';
  bool hasTextOptimizationInstructions() =>
      _textOptimizationInstructions != null;

  // "Reason_for_account" field.
  String? _reasonForAccount;
  String get reasonForAccount => _reasonForAccount ?? '';
  bool hasReasonForAccount() => _reasonForAccount != null;

  // "user_instruction" field.
  String? _userInstruction;
  String get userInstruction => _userInstruction ?? '';
  bool hasUserInstruction() => _userInstruction != null;

  // "admin_document_id" field.
  String? _adminDocumentId;
  String get adminDocumentId => _adminDocumentId ?? '';
  bool hasAdminDocumentId() => _adminDocumentId != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "Color_Chatbot_header" field.
  Color? _colorChatbotHeader;
  Color? get colorChatbotHeader => _colorChatbotHeader;
  bool hasColorChatbotHeader() => _colorChatbotHeader != null;

  // "Color_ChatbotMessageBackground" field.
  Color? _colorChatbotMessageBackground;
  Color? get colorChatbotMessageBackground => _colorChatbotMessageBackground;
  bool hasColorChatbotMessageBackground() =>
      _colorChatbotMessageBackground != null;

  // "color_ChatbotMessageText" field.
  Color? _colorChatbotMessageText;
  Color? get colorChatbotMessageText => _colorChatbotMessageText;
  bool hasColorChatbotMessageText() => _colorChatbotMessageText != null;

  // "color_UserMessageBackground" field.
  Color? _colorUserMessageBackground;
  Color? get colorUserMessageBackground => _colorUserMessageBackground;
  bool hasColorUserMessageBackground() => _colorUserMessageBackground != null;

  // "color_userMessageText" field.
  Color? _colorUserMessageText;
  Color? get colorUserMessageText => _colorUserMessageText;
  bool hasColorUserMessageText() => _colorUserMessageText != null;

  // "color_sendButtonBackground" field.
  Color? _colorSendButtonBackground;
  Color? get colorSendButtonBackground => _colorSendButtonBackground;
  bool hasColorSendButtonBackground() => _colorSendButtonBackground != null;

  // "color_sendButtonText" field.
  Color? _colorSendButtonText;
  Color? get colorSendButtonText => _colorSendButtonText;
  bool hasColorSendButtonText() => _colorSendButtonText != null;

  // "user_logo" field.
  String? _userLogo;
  String get userLogo => _userLogo ?? '';
  bool hasUserLogo() => _userLogo != null;

  // "color_HeaderTextColor" field.
  Color? _colorHeaderTextColor;
  Color? get colorHeaderTextColor => _colorHeaderTextColor;
  bool hasColorHeaderTextColor() => _colorHeaderTextColor != null;

  // "visitor_count" field.
  int? _visitorCount;
  int get visitorCount => _visitorCount ?? 0;
  bool hasVisitorCount() => _visitorCount != null;

  // "used_token" field.
  int? _usedToken;
  int get usedToken => _usedToken ?? 0;
  bool hasUsedToken() => _usedToken != null;

  // "messages_count" field.
  int? _messagesCount;
  int get messagesCount => _messagesCount ?? 0;
  bool hasMessagesCount() => _messagesCount != null;

  // "used_storage_file" field.
  double? _usedStorageFile;
  double get usedStorageFile => _usedStorageFile ?? 0.0;
  bool hasUsedStorageFile() => _usedStorageFile != null;

  // "chatbot_name" field.
  String? _chatbotName;
  String get chatbotName => _chatbotName ?? '';
  bool hasChatbotName() => _chatbotName != null;

  // "expected_questions" field.
  List<String>? _expectedQuestions;
  List<String> get expectedQuestions => _expectedQuestions ?? const [];
  bool hasExpectedQuestions() => _expectedQuestions != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userName = snapshotData['user_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _chatbotDescripation = snapshotData['chatbot_descripation'] as String?;
    _chatbotLogo = snapshotData['chatbot_logo'] as String?;
    _welcomeMessageForVisitor =
        snapshotData['welcome_message_for_visitor'] as String?;
    _chatbotTextBoxPlaceholder =
        snapshotData['chatbot_text_box_placeholder'] as String?;
    _noAnswerBotReplyText = snapshotData['NoAnswerBotReplyText'] as String?;
    _collectUserData = snapshotData['CollectUserData'] as bool?;
    _collectUserDataFields = getDataList(snapshotData['CollectUserDataFields']);
    _maximumTokenToUseForBotAnswer =
        castToType<int>(snapshotData['MaximumTokenToUseForBotAnswer']);
    _websiteFetchedData = snapshotData['websiteFetchedData'] as String?;
    _website = snapshotData['website'] as String?;
    _openAIAssistentId = snapshotData['openAI_AssistentId'] as String?;
    _chatbotInstruction = snapshotData['chatbot_instruction'] as String?;
    _chatbotModel = getDataList(snapshotData['chatbot_model']);
    _company = snapshotData['company'] as String?;
    _vectorStoresId = snapshotData['vector_stores_id'] as String?;
    _uploadedFileName = snapshotData['uploadedFileName'] as String?;
    _fAQData = snapshotData['FAQ_data'] as String?;
    _textOptimizationInstructions =
        snapshotData['textOptimizationInstructions'] as String?;
    _reasonForAccount = snapshotData['Reason_for_account'] as String?;
    _userInstruction = snapshotData['user_instruction'] as String?;
    _adminDocumentId = snapshotData['admin_document_id'] as String?;
    _userRole = snapshotData['user_role'] as String?;
    _colorChatbotHeader = getSchemaColor(snapshotData['Color_Chatbot_header']);
    _colorChatbotMessageBackground =
        getSchemaColor(snapshotData['Color_ChatbotMessageBackground']);
    _colorChatbotMessageText =
        getSchemaColor(snapshotData['color_ChatbotMessageText']);
    _colorUserMessageBackground =
        getSchemaColor(snapshotData['color_UserMessageBackground']);
    _colorUserMessageText =
        getSchemaColor(snapshotData['color_userMessageText']);
    _colorSendButtonBackground =
        getSchemaColor(snapshotData['color_sendButtonBackground']);
    _colorSendButtonText = getSchemaColor(snapshotData['color_sendButtonText']);
    _userLogo = snapshotData['user_logo'] as String?;
    _colorHeaderTextColor =
        getSchemaColor(snapshotData['color_HeaderTextColor']);
    _visitorCount = castToType<int>(snapshotData['visitor_count']);
    _usedToken = castToType<int>(snapshotData['used_token']);
    _messagesCount = castToType<int>(snapshotData['messages_count']);
    _usedStorageFile = castToType<double>(snapshotData['used_storage_file']);
    _chatbotName = snapshotData['chatbot_name'] as String?;
    _expectedQuestions = getDataList(snapshotData['expected_questions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_table');

  static Stream<UserTableRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTableRecord.fromSnapshot(s));

  static Future<UserTableRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTableRecord.fromSnapshot(s));

  static UserTableRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTableRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTableRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTableRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTableRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTableRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTableRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? userName,
  String? phoneNumber,
  String? chatbotDescripation,
  String? chatbotLogo,
  String? welcomeMessageForVisitor,
  String? chatbotTextBoxPlaceholder,
  String? noAnswerBotReplyText,
  bool? collectUserData,
  int? maximumTokenToUseForBotAnswer,
  String? websiteFetchedData,
  String? website,
  String? openAIAssistentId,
  String? chatbotInstruction,
  String? company,
  String? vectorStoresId,
  String? uploadedFileName,
  String? fAQData,
  String? textOptimizationInstructions,
  String? reasonForAccount,
  String? userInstruction,
  String? adminDocumentId,
  String? userRole,
  Color? colorChatbotHeader,
  Color? colorChatbotMessageBackground,
  Color? colorChatbotMessageText,
  Color? colorUserMessageBackground,
  Color? colorUserMessageText,
  Color? colorSendButtonBackground,
  Color? colorSendButtonText,
  String? userLogo,
  Color? colorHeaderTextColor,
  int? visitorCount,
  int? usedToken,
  int? messagesCount,
  double? usedStorageFile,
  String? chatbotName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'user_name': userName,
      'phone_number': phoneNumber,
      'chatbot_descripation': chatbotDescripation,
      'chatbot_logo': chatbotLogo,
      'welcome_message_for_visitor': welcomeMessageForVisitor,
      'chatbot_text_box_placeholder': chatbotTextBoxPlaceholder,
      'NoAnswerBotReplyText': noAnswerBotReplyText,
      'CollectUserData': collectUserData,
      'MaximumTokenToUseForBotAnswer': maximumTokenToUseForBotAnswer,
      'websiteFetchedData': websiteFetchedData,
      'website': website,
      'openAI_AssistentId': openAIAssistentId,
      'chatbot_instruction': chatbotInstruction,
      'company': company,
      'vector_stores_id': vectorStoresId,
      'uploadedFileName': uploadedFileName,
      'FAQ_data': fAQData,
      'textOptimizationInstructions': textOptimizationInstructions,
      'Reason_for_account': reasonForAccount,
      'user_instruction': userInstruction,
      'admin_document_id': adminDocumentId,
      'user_role': userRole,
      'Color_Chatbot_header': colorChatbotHeader,
      'Color_ChatbotMessageBackground': colorChatbotMessageBackground,
      'color_ChatbotMessageText': colorChatbotMessageText,
      'color_UserMessageBackground': colorUserMessageBackground,
      'color_userMessageText': colorUserMessageText,
      'color_sendButtonBackground': colorSendButtonBackground,
      'color_sendButtonText': colorSendButtonText,
      'user_logo': userLogo,
      'color_HeaderTextColor': colorHeaderTextColor,
      'visitor_count': visitorCount,
      'used_token': usedToken,
      'messages_count': messagesCount,
      'used_storage_file': usedStorageFile,
      'chatbot_name': chatbotName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserTableRecordDocumentEquality implements Equality<UserTableRecord> {
  const UserTableRecordDocumentEquality();

  @override
  bool equals(UserTableRecord? e1, UserTableRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userName == e2?.userName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.chatbotDescripation == e2?.chatbotDescripation &&
        e1?.chatbotLogo == e2?.chatbotLogo &&
        e1?.welcomeMessageForVisitor == e2?.welcomeMessageForVisitor &&
        e1?.chatbotTextBoxPlaceholder == e2?.chatbotTextBoxPlaceholder &&
        e1?.noAnswerBotReplyText == e2?.noAnswerBotReplyText &&
        e1?.collectUserData == e2?.collectUserData &&
        listEquality.equals(
            e1?.collectUserDataFields, e2?.collectUserDataFields) &&
        e1?.maximumTokenToUseForBotAnswer ==
            e2?.maximumTokenToUseForBotAnswer &&
        e1?.websiteFetchedData == e2?.websiteFetchedData &&
        e1?.website == e2?.website &&
        e1?.openAIAssistentId == e2?.openAIAssistentId &&
        e1?.chatbotInstruction == e2?.chatbotInstruction &&
        listEquality.equals(e1?.chatbotModel, e2?.chatbotModel) &&
        e1?.company == e2?.company &&
        e1?.vectorStoresId == e2?.vectorStoresId &&
        e1?.uploadedFileName == e2?.uploadedFileName &&
        e1?.fAQData == e2?.fAQData &&
        e1?.textOptimizationInstructions == e2?.textOptimizationInstructions &&
        e1?.reasonForAccount == e2?.reasonForAccount &&
        e1?.userInstruction == e2?.userInstruction &&
        e1?.adminDocumentId == e2?.adminDocumentId &&
        e1?.userRole == e2?.userRole &&
        e1?.colorChatbotHeader == e2?.colorChatbotHeader &&
        e1?.colorChatbotMessageBackground ==
            e2?.colorChatbotMessageBackground &&
        e1?.colorChatbotMessageText == e2?.colorChatbotMessageText &&
        e1?.colorUserMessageBackground == e2?.colorUserMessageBackground &&
        e1?.colorUserMessageText == e2?.colorUserMessageText &&
        e1?.colorSendButtonBackground == e2?.colorSendButtonBackground &&
        e1?.colorSendButtonText == e2?.colorSendButtonText &&
        e1?.userLogo == e2?.userLogo &&
        e1?.colorHeaderTextColor == e2?.colorHeaderTextColor &&
        e1?.visitorCount == e2?.visitorCount &&
        e1?.usedToken == e2?.usedToken &&
        e1?.messagesCount == e2?.messagesCount &&
        e1?.usedStorageFile == e2?.usedStorageFile &&
        e1?.chatbotName == e2?.chatbotName &&
        listEquality.equals(e1?.expectedQuestions, e2?.expectedQuestions);
  }

  @override
  int hash(UserTableRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.userName,
        e?.phoneNumber,
        e?.chatbotDescripation,
        e?.chatbotLogo,
        e?.welcomeMessageForVisitor,
        e?.chatbotTextBoxPlaceholder,
        e?.noAnswerBotReplyText,
        e?.collectUserData,
        e?.collectUserDataFields,
        e?.maximumTokenToUseForBotAnswer,
        e?.websiteFetchedData,
        e?.website,
        e?.openAIAssistentId,
        e?.chatbotInstruction,
        e?.chatbotModel,
        e?.company,
        e?.vectorStoresId,
        e?.uploadedFileName,
        e?.fAQData,
        e?.textOptimizationInstructions,
        e?.reasonForAccount,
        e?.userInstruction,
        e?.adminDocumentId,
        e?.userRole,
        e?.colorChatbotHeader,
        e?.colorChatbotMessageBackground,
        e?.colorChatbotMessageText,
        e?.colorUserMessageBackground,
        e?.colorUserMessageText,
        e?.colorSendButtonBackground,
        e?.colorSendButtonText,
        e?.userLogo,
        e?.colorHeaderTextColor,
        e?.visitorCount,
        e?.usedToken,
        e?.messagesCount,
        e?.usedStorageFile,
        e?.chatbotName,
        e?.expectedQuestions
      ]);

  @override
  bool isValidKey(Object? o) => o is UserTableRecord;
}

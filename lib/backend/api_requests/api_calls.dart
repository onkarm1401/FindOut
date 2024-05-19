import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start openAI Assistent Group Code

class OpenAIAssistentGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
    'OpenAI-Beta': 'assistants=v2',
  };
  static CreateThreadCall createThreadCall = CreateThreadCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static CreateRunCall createRunCall = CreateRunCall();
  static RetriveRunCall retriveRunCall = RetriveRunCall();
  static MessageCall messageCall = MessageCall();
  static FileCall fileCall = FileCall();
  static CreateAssistentCall createAssistentCall = CreateAssistentCall();
  static AddFileToAssistentCall addFileToAssistentCall =
      AddFileToAssistentCall();
  static DeleteFileToAssistentCall deleteFileToAssistentCall =
      DeleteFileToAssistentCall();
  static GetAssistentDetailsCall getAssistentDetailsCall =
      GetAssistentDetailsCall();
}

class CreateThreadCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createThread',
      apiUrl: '$baseUrl/threads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? threadId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? content = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "role": "user",
  "content": "$content"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createMessage',
      apiUrl: '$baseUrl/threads/$threadId/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? assistantId = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "assistant_id": "$assistantId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createRun',
      apiUrl: '$baseUrl/threads/$threadId/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? runId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class RetriveRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retriveRun',
      apiUrl: '$baseUrl/threads/$threadId/runs/$runId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? promptTokens(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.prompt_tokens''',
      ));
  int? completionToken(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.completion_tokens''',
      ));
  int? totalToken(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.total_tokens''',
      ));
}

class MessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'message',
      apiUrl: '$baseUrl/threads/$threadId/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[0].content[0]''',
      );
  String? responseText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].content[:].text.value''',
      ));
}

class FileCall {
  Future<ApiCallResponse> call({
    String? purpose = '',
    FFUploadedFile? file,
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'file',
      apiUrl: '$baseUrl/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {
        'purpose': purpose,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateAssistentCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? instruction = '',
    String? chatbotName = '',
    int? temperature,
    int? topP,
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "model": "$model",
  "tools": [],
  "name": "$chatbotName",
  "instructions": "$instruction",
  "tool_resources": {
    "code_interpreter": {
      "file_ids": []
    },
    "file_search": {
      "vector_store_ids": []
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAssistent',
      apiUrl: '$baseUrl/assistants',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? assistentid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AddFileToAssistentCall {
  Future<ApiCallResponse> call({
    String? assistantsId = '',
    String? instructions = '',
    String? chatbotName = '',
    String? vectorStoreIds = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "tools": [
    {
      "type": "file_search"
    }
  ],
  "name": "$chatbotName",
  "instructions": "$instructions",
  "tool_resources": {
    "code_interpreter": {
      "file_ids": []
    },
    "file_search": {
      "vector_store_ids": [
        "$vectorStoreIds"
      ]
    }
  },
  "temperature": 1,
  "top_p": 1,
  "response_format": "auto"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addFileToAssistent',
      apiUrl: '$baseUrl/assistants/$assistantsId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFileToAssistentCall {
  Future<ApiCallResponse> call({
    String? assistantsId = '',
    String? instructions = '',
    String? chatbotName = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "$chatbotName",
  "description": "",
  "instructions": "$instructions",
  "model": "gpt-3.5-turbo",
  "tools": [
    {
      "type": "file_search"
    }
  ],
  "tool_resources": {
    "file_search": {
      "vector_store_ids": []
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteFileToAssistent ',
      apiUrl: '$baseUrl/assistants/$assistantsId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssistentDetailsCall {
  Future<ApiCallResponse> call({
    String? assistentId = '',
    String? token = '',
  }) async {
    final baseUrl = OpenAIAssistentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAssistentDetails',
      apiUrl: '$baseUrl/assistants/$assistentId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? vectorstoreids(dynamic response) => (getJsonField(
        response,
        r'''$.tool_resources.file_search.vector_store_ids''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End openAI Assistent Group Code

/// Start vectorStorage Group Code

class VectorStorageGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
    'OpenAI-Beta': 'assistants=v2',
  };
  static DeleteStorageFileCall deleteStorageFileCall = DeleteStorageFileCall();
  static CreateVectorStorageCall createVectorStorageCall =
      CreateVectorStorageCall();
  static LinkUploadedFileToVectorStorageCall
      linkUploadedFileToVectorStorageCall =
      LinkUploadedFileToVectorStorageCall();
  static RenameVectorStorageCall renameVectorStorageCall =
      RenameVectorStorageCall();
  static DeleteVectorStorageCall deleteVectorStorageCall =
      DeleteVectorStorageCall();
  static DeleteVectorStoreFileCall deleteVectorStoreFileCall =
      DeleteVectorStoreFileCall();
  static ListOfUploadedFileCall listOfUploadedFileCall =
      ListOfUploadedFileCall();
  static FilenameUploadedFileCall filenameUploadedFileCall =
      FilenameUploadedFileCall();
  static UploadFileCall uploadFileCall = UploadFileCall();
}

class DeleteStorageFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteStorageFile',
      apiUrl: '$baseUrl/files/$fileId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStorageCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStorage',
      apiUrl: '$baseUrl/vector_stores',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? vectorStorageId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class LinkUploadedFileToVectorStorageCall {
  Future<ApiCallResponse> call({
    String? vectorStorageId = '',
    String? fileId = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "file_ids": [
    "$fileId"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'linkUploadedFileToVectorStorage',
      apiUrl: '$baseUrl/vector_stores/$vectorStorageId/file_batches',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RenameVectorStorageCall {
  Future<ApiCallResponse> call({
    String? vectorStorageId = '',
    String? renamedOfVectorStorage = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "$renamedOfVectorStorage"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renameVectorStorage',
      apiUrl: '$baseUrl/vector_stores/$vectorStorageId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVectorStorageCall {
  Future<ApiCallResponse> call({
    String? vectorStorageId = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVectorStorage',
      apiUrl: '$baseUrl/vector_stores/$vectorStorageId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? storeId = '',
    String? fileId = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVectorStoreFile',
      apiUrl: '$baseUrl/vector_stores/$storeId/files/$fileId',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ListOfUploadedFileCall {
  Future<ApiCallResponse> call({
    String? vsId = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listOfUploadedFile',
      apiUrl: '$baseUrl/vector_stores/$vsId/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uploadedFileID(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? usagebytes(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].usage_bytes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class FilenameUploadedFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'filenameUploadedFile',
      apiUrl: '$baseUrl/files',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {
        'ids[]': fileId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? fileID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  String? filename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].filename''',
      ));
  int? bytes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].bytes''',
      ));
}

class UploadFileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? token = '',
  }) async {
    final baseUrl = VectorStorageGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'uploadFile',
      apiUrl: '$baseUrl/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {
        'file': file,
        'purpose': "assistants",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End vectorStorage Group Code

class GenerateAndUploadFileCall {
  static Future<ApiCallResponse> call({
    String? filename = '',
    String? websiteData = '',
    String? faq = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "file": "$filename",
  "Website Data": "$websiteData",
  "FAQ": "$faq"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateAndUploadFile',
      apiUrl: 'http://18.215.244.49:5005/generate_json_and_upload',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'OpenAI-API-Key': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? fileId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? filename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.filename''',
      ));
  static int? byte(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.bytes''',
      ));
}

class OpenAICall {
  static Future<ApiCallResponse> call({
    String? textOptimizationInstructions = '',
    String? inputDate = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "$textOptimizationInstructions"
    },
    {
      "role": "user",
      "content": "$inputDate"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'openAI',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
  static int? promptToken(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.prompt_tokens''',
      ));
  static int? completionToken(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.completion_tokens''',
      ));
  static int? totalToken(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.total_tokens''',
      ));
}

class FetchUniqueLinksCall {
  static Future<ApiCallResponse> call({
    String? website = '',
  }) async {
    final ffApiRequestBody = '''
{
  "authorization_key": "website_link",
  "url": "$website"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchUniqueLinks',
      apiUrl: 'http://18.215.244.49:5002/api/get_unique_links',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uniquelinks(dynamic response) => (getJsonField(
        response,
        r'''$.unique_links''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? uniquelinksCount(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class FetchDataCall {
  static Future<ApiCallResponse> call({
    String? url = '',
    String? openaiKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "urls": [
    "$url"
  ],
  "openai_api_key": "$openaiKey",
  "password": "YourPassword123",
  "prompt": "Optimize the data for faster readability by OpenAI assistant while ensuring that the meaning remains unchanged. Return the data. Remove duplicate data.",
  "model": "gpt-3.5-turbo"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchData',
      apiUrl: 'http://18.215.244.49:5003/fetch_data_and_format',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? outputData(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.formatted_data''',
      ));
}

class CreatePaymentOrderCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    double? orderAmount,
    String? orderCurrency = '',
    String? customerId = '',
    String? customerEmail = '',
    String? customerPhone = '',
    String? customerName = '',
    String? customerBankAccountNumber = '',
    String? customerBankIfsc = '',
    int? customerBankCode,
    String? customerUid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "customer_details": {
    "customer_id": "$customerId",
    "customer_email": "$customerEmail",
    "customer_phone": "$customerPhone",
    "customer_name": "$customerName",
    "customer_bank_account_number": "$customerBankAccountNumber",
    "customer_bank_ifsc": "$customerBankIfsc",
    "customer_bank_code": $customerBankCode,
    "customer_uid": "$customerUid"
  },
  "order_id": "$orderId",
  "order_amount": $orderAmount,
  "order_currency": "$orderCurrency"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create payment order',
      apiUrl: 'https://sandbox.cashfree.com/pg/orders',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'x-api-version': '2023-08-01',
        'x-client-id': 'TEST101939721d32948958acc003e45627939101',
        'x-client-secret':
            'cfsk_ma_test_9133f2f5ad1dbe5f5c479bbf39a9c776_c76de864',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QRCodeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'QR code',
      apiUrl:
          'https://cac-api.cashfree.com/cac/v1/createDynamicQRCode?virtualVpaId=john&amount=50',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer TEST101939721d32948958acc003e45627939101',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AuthorizeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'authorize',
      apiUrl: 'https://cac-gamma.cashfree.com/cac/v1/authorize',
      callType: ApiCallType.POST,
      headers: {
        'X-Client-ID': 'TEST101939721d32948958acc003e45627939101',
        'X-Client-Secret':
            'cfsk_ma_test_9133f2f5ad1dbe5f5c479bbf39a9c776_c76de864',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

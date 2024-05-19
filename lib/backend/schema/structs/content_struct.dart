// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentStruct extends FFFirebaseStruct {
  ContentStruct({
    TextStruct? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        super(firestoreUtilData);

  // "text" field.
  TextStruct? _text;
  TextStruct get text => _text ?? TextStruct();
  set text(TextStruct? val) => _text = val;
  void updateText(Function(TextStruct) updateFn) =>
      updateFn(_text ??= TextStruct());
  bool hasText() => _text != null;

  static ContentStruct fromMap(Map<String, dynamic> data) => ContentStruct(
        text: TextStruct.maybeFromMap(data['text']),
      );

  static ContentStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentStruct(
        text: deserializeStructParam(
          data['text'],
          ParamType.DataStruct,
          false,
          structBuilder: TextStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentStruct && text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([text]);
}

ContentStruct createContentStruct({
  TextStruct? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentStruct(
      text: text ?? (clearUnsetFields ? TextStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentStruct? updateContentStruct(
  ContentStruct? content, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    content
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentStructData(
  Map<String, dynamic> firestoreData,
  ContentStruct? content,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (content == null) {
    return;
  }
  if (content.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && content.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentData = getContentFirestoreData(content, forFieldValue);
  final nestedData = contentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = content.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentFirestoreData(
  ContentStruct? content, [
  bool forFieldValue = false,
]) {
  if (content == null) {
    return {};
  }
  final firestoreData = mapToFirestore(content.toMap());

  // Handle nested data for "text" field.
  addTextStructData(
    firestoreData,
    content.hasText() ? content.text : null,
    'text',
    forFieldValue,
  );

  // Add any Firestore field values
  content.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentListFirestoreData(
  List<ContentStruct>? contents,
) =>
    contents?.map((e) => getContentFirestoreData(e, true)).toList() ?? [];

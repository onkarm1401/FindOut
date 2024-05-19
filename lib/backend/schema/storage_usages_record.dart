import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StorageUsagesRecord extends FirestoreRecord {
  StorageUsagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "filename" field.
  String? _filename;
  String get filename => _filename ?? '';
  bool hasFilename() => _filename != null;

  // "fileID" field.
  String? _fileID;
  String get fileID => _fileID ?? '';
  bool hasFileID() => _fileID != null;

  // "uploadedDate" field.
  DateTime? _uploadedDate;
  DateTime? get uploadedDate => _uploadedDate;
  bool hasUploadedDate() => _uploadedDate != null;

  // "DeletedData" field.
  DateTime? _deletedData;
  DateTime? get deletedData => _deletedData;
  bool hasDeletedData() => _deletedData != null;

  // "billStartedDate" field.
  DateTime? _billStartedDate;
  DateTime? get billStartedDate => _billStartedDate;
  bool hasBillStartedDate() => _billStartedDate != null;

  // "fileSize" field.
  int? _fileSize;
  int get fileSize => _fileSize ?? 0;
  bool hasFileSize() => _fileSize != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _filename = snapshotData['filename'] as String?;
    _fileID = snapshotData['fileID'] as String?;
    _uploadedDate = snapshotData['uploadedDate'] as DateTime?;
    _deletedData = snapshotData['DeletedData'] as DateTime?;
    _billStartedDate = snapshotData['billStartedDate'] as DateTime?;
    _fileSize = castToType<int>(snapshotData['fileSize']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storageUsages');

  static Stream<StorageUsagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StorageUsagesRecord.fromSnapshot(s));

  static Future<StorageUsagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StorageUsagesRecord.fromSnapshot(s));

  static StorageUsagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StorageUsagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StorageUsagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StorageUsagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StorageUsagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StorageUsagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStorageUsagesRecordData({
  String? userID,
  String? filename,
  String? fileID,
  DateTime? uploadedDate,
  DateTime? deletedData,
  DateTime? billStartedDate,
  int? fileSize,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'filename': filename,
      'fileID': fileID,
      'uploadedDate': uploadedDate,
      'DeletedData': deletedData,
      'billStartedDate': billStartedDate,
      'fileSize': fileSize,
    }.withoutNulls,
  );

  return firestoreData;
}

class StorageUsagesRecordDocumentEquality
    implements Equality<StorageUsagesRecord> {
  const StorageUsagesRecordDocumentEquality();

  @override
  bool equals(StorageUsagesRecord? e1, StorageUsagesRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.filename == e2?.filename &&
        e1?.fileID == e2?.fileID &&
        e1?.uploadedDate == e2?.uploadedDate &&
        e1?.deletedData == e2?.deletedData &&
        e1?.billStartedDate == e2?.billStartedDate &&
        e1?.fileSize == e2?.fileSize;
  }

  @override
  int hash(StorageUsagesRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.filename,
        e?.fileID,
        e?.uploadedDate,
        e?.deletedData,
        e?.billStartedDate,
        e?.fileSize
      ]);

  @override
  bool isValidKey(Object? o) => o is StorageUsagesRecord;
}

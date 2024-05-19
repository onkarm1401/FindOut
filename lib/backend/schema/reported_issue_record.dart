import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportedIssueRecord extends FirestoreRecord {
  ReportedIssueRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "reported_problem" field.
  String? _reportedProblem;
  String get reportedProblem => _reportedProblem ?? '';
  bool hasReportedProblem() => _reportedProblem != null;

  // "reporter_email" field.
  String? _reporterEmail;
  String get reporterEmail => _reporterEmail ?? '';
  bool hasReporterEmail() => _reporterEmail != null;

  // "reporter_phone_number" field.
  int? _reporterPhoneNumber;
  int get reporterPhoneNumber => _reporterPhoneNumber ?? 0;
  bool hasReporterPhoneNumber() => _reporterPhoneNumber != null;

  // "reporter_date" field.
  DateTime? _reporterDate;
  DateTime? get reporterDate => _reporterDate;
  bool hasReporterDate() => _reporterDate != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _reportedProblem = snapshotData['reported_problem'] as String?;
    _reporterEmail = snapshotData['reporter_email'] as String?;
    _reporterPhoneNumber =
        castToType<int>(snapshotData['reporter_phone_number']);
    _reporterDate = snapshotData['reporter_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reported_issue');

  static Stream<ReportedIssueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportedIssueRecord.fromSnapshot(s));

  static Future<ReportedIssueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportedIssueRecord.fromSnapshot(s));

  static ReportedIssueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportedIssueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportedIssueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportedIssueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportedIssueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportedIssueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportedIssueRecordData({
  String? userID,
  String? reportedProblem,
  String? reporterEmail,
  int? reporterPhoneNumber,
  DateTime? reporterDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'reported_problem': reportedProblem,
      'reporter_email': reporterEmail,
      'reporter_phone_number': reporterPhoneNumber,
      'reporter_date': reporterDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportedIssueRecordDocumentEquality
    implements Equality<ReportedIssueRecord> {
  const ReportedIssueRecordDocumentEquality();

  @override
  bool equals(ReportedIssueRecord? e1, ReportedIssueRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.reportedProblem == e2?.reportedProblem &&
        e1?.reporterEmail == e2?.reporterEmail &&
        e1?.reporterPhoneNumber == e2?.reporterPhoneNumber &&
        e1?.reporterDate == e2?.reporterDate;
  }

  @override
  int hash(ReportedIssueRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.reportedProblem,
        e?.reporterEmail,
        e?.reporterPhoneNumber,
        e?.reporterDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportedIssueRecord;
}

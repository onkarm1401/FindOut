import '/backend/api_requests/api_calls.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'storage_widget.dart' show StorageWidget;
import 'package:flutter/material.dart';

class StorageModel extends FlutterFlowModel<StorageWidget> {
  ///  Local state fields for this page.

  List<String> fileID = [];
  void addToFileID(String item) => fileID.add(item);
  void removeFromFileID(String item) => fileID.remove(item);
  void removeAtIndexFromFileID(int index) => fileID.removeAt(index);
  void insertAtIndexInFileID(int index, String item) =>
      fileID.insert(index, item);
  void updateFileIDAtIndex(int index, Function(String) updateFn) =>
      fileID[index] = updateFn(fileID[index]);

  List<int> usuages = [];
  void addToUsuages(int item) => usuages.add(item);
  void removeFromUsuages(int item) => usuages.remove(item);
  void removeAtIndexFromUsuages(int index) => usuages.removeAt(index);
  void insertAtIndexInUsuages(int index, int item) =>
      usuages.insert(index, item);
  void updateUsuagesAtIndex(int index, Function(int) updateFn) =>
      usuages[index] = updateFn(usuages[index]);

  int? counter = 0;

  List<String> filename = [];
  void addToFilename(String item) => filename.add(item);
  void removeFromFilename(String item) => filename.remove(item);
  void removeAtIndexFromFilename(int index) => filename.removeAt(index);
  void insertAtIndexInFilename(int index, String item) =>
      filename.insert(index, item);
  void updateFilenameAtIndex(int index, Function(String) updateFn) =>
      filename[index] = updateFn(filename[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in storage widget.
  ApiCallResponse? apiResultv1d;
  // Stores action output result for [Backend Call - API (filenameUploadedFile)] action in storage widget.
  ApiCallResponse? apiResult3z8;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadFile)] action in Button widget.
  ApiCallResponse? apiResultj8t;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? apiResult0ou;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? apiResult8zm;
  // Stores action output result for [Backend Call - API (deleteStorageFile)] action in Button widget.
  ApiCallResponse? apiResult8qo;
  // Stores action output result for [Backend Call - API (deleteVectorStoreFile)] action in Button widget.
  ApiCallResponse? apiResult817;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }
}

import '/backend/api_requests/api_calls.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'website_infromation_fetch_widget.dart'
    show WebsiteInfromationFetchWidget;
import 'package:flutter/material.dart';

class WebsiteInfromationFetchModel
    extends FlutterFlowModel<WebsiteInfromationFetchWidget> {
  ///  Local state fields for this page.

  int? uniqueLinksCount;

  List<String> uniqueURL = [];
  void addToUniqueURL(String item) => uniqueURL.add(item);
  void removeFromUniqueURL(String item) => uniqueURL.remove(item);
  void removeAtIndexFromUniqueURL(int index) => uniqueURL.removeAt(index);
  void insertAtIndexInUniqueURL(int index, String item) =>
      uniqueURL.insert(index, item);
  void updateUniqueURLAtIndex(int index, Function(String) updateFn) =>
      uniqueURL[index] = updateFn(uniqueURL[index]);

  int? totalIteration = 0;

  int? currentIteration = 0;

  List<String> fetchedInfo = [];
  void addToFetchedInfo(String item) => fetchedInfo.add(item);
  void removeFromFetchedInfo(String item) => fetchedInfo.remove(item);
  void removeAtIndexFromFetchedInfo(int index) => fetchedInfo.removeAt(index);
  void insertAtIndexInFetchedInfo(int index, String item) =>
      fetchedInfo.insert(index, item);
  void updateFetchedInfoAtIndex(int index, Function(String) updateFn) =>
      fetchedInfo[index] = updateFn(fetchedInfo[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (fetchUniqueLinks)] action in Button widget.
  ApiCallResponse? uniqueLinks;
  // Stores action output result for [Backend Call - API (fetchData)] action in Button widget.
  ApiCallResponse? uniqueLinkData;
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Button widget.
  ApiCallResponse? getAssistentDetails;
  // Stores action output result for [Backend Call - API (deleteStorageFile)] action in Button widget.
  ApiCallResponse? deleteAsistentFile;
  // Stores action output result for [Backend Call - API (deleteVectorStorage)] action in Button widget.
  ApiCallResponse? deleteVectorStore;
  // Stores action output result for [Backend Call - API (createVectorStorage)] action in Button widget.
  ApiCallResponse? recreateVectorStore;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? fileGenerationAPI;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? addFileToVectorStorage;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? addFileToAsistent;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? fileGeneration;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? linkFIleToVectorStorage;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? addVectorStorageToAssisent;
  // Stores action output result for [Backend Call - API (getAssistentDetails)] action in Button widget.
  ApiCallResponse? mGetAssistentDetails;
  // Stores action output result for [Backend Call - API (deleteStorageFile)] action in Button widget.
  ApiCallResponse? mDeleteAsistentFile;
  // Stores action output result for [Backend Call - API (deleteVectorStorage)] action in Button widget.
  ApiCallResponse? mDeleteVectorStore;
  // Stores action output result for [Backend Call - API (createVectorStorage)] action in Button widget.
  ApiCallResponse? mRecreateVectorStore;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? mFileGenerationAPI;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? mAddFileToVectorStorage;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? mAddFileToAsistent;
  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? mFileGeneration;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? mLinkFIleToVectorStorage;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? mAddVectorStorageToAssisent;
  // State field(s) for existingData widget.
  FocusNode? existingDataFocusNode;
  TextEditingController? existingDataTextController;
  String? Function(BuildContext, String?)? existingDataTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    existingDataFocusNode?.dispose();
    existingDataTextController?.dispose();
  }
}
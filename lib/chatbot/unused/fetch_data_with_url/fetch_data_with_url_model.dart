import '/backend/api_requests/api_calls.dart';
import '/chatbot/component/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'fetch_data_with_url_widget.dart' show FetchDataWithUrlWidget;
import 'package:flutter/material.dart';

class FetchDataWithUrlModel extends FlutterFlowModel<FetchDataWithUrlWidget> {
  ///  Local state fields for this page.

  int? uniqueLinksCount = 0;

  List<String> uniqueURL = ['Hello World'];
  void addToUniqueURL(String item) => uniqueURL.add(item);
  void removeFromUniqueURL(String item) => uniqueURL.remove(item);
  void removeAtIndexFromUniqueURL(int index) => uniqueURL.removeAt(index);
  void insertAtIndexInUniqueURL(int index, String item) =>
      uniqueURL.insert(index, item);
  void updateUniqueURLAtIndex(int index, Function(String) updateFn) =>
      uniqueURL[index] = updateFn(uniqueURL[index]);

  int? totalIteration = 0;

  int? currentIteration = 0;

  List<String> ouputData = [];
  void addToOuputData(String item) => ouputData.add(item);
  void removeFromOuputData(String item) => ouputData.remove(item);
  void removeAtIndexFromOuputData(int index) => ouputData.removeAt(index);
  void insertAtIndexInOuputData(int index, String item) =>
      ouputData.insert(index, item);
  void updateOuputDataAtIndex(int index, Function(String) updateFn) =>
      ouputData[index] = updateFn(ouputData[index]);

  List<String> selectedURL = [];
  void addToSelectedURL(String item) => selectedURL.add(item);
  void removeFromSelectedURL(String item) => selectedURL.remove(item);
  void removeAtIndexFromSelectedURL(int index) => selectedURL.removeAt(index);
  void insertAtIndexInSelectedURL(int index, String item) =>
      selectedURL.insert(index, item);
  void updateSelectedURLAtIndex(int index, Function(String) updateFn) =>
      selectedURL[index] = updateFn(selectedURL[index]);

  bool uniqueLinkFlag = true;

  bool dataFlag = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in sideNav widget.
  ApiCallResponse? apiResultwlo;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (fetchUniqueLinks)] action in Button widget.
  ApiCallResponse? uniqueLinks;
  // Stores action output result for [Backend Call - API (fetchData)] action in Button widget.
  ApiCallResponse? uniqueLinkDataCopy;
  // Stores action output result for [Backend Call - API (openAI)] action in Button widget.
  ApiCallResponse? formatedData;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Stores action output result for [Backend Call - API (generateAndUploadFile)] action in Button widget.
  ApiCallResponse? fileGeneration;
  // Stores action output result for [Backend Call - API (linkUploadedFileToVectorStorage)] action in Button widget.
  ApiCallResponse? linkFIleToVectorStorage;
  // Stores action output result for [Backend Call - API (addFileToAssistent)] action in Button widget.
  ApiCallResponse? addVectorStorageToAssisent;
  // Stores action output result for [Backend Call - API (listOfUploadedFile)] action in Button widget.
  ApiCallResponse? apiResultwlo2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}

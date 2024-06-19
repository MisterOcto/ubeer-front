import '/components/custom_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'beer_details_widget.dart' show BeerDetailsWidget;
import 'package:flutter/material.dart';

class BeerDetailsModel extends FlutterFlowModel<BeerDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for customAppBar component.
  late CustomAppBarModel customAppBarModel;

  @override
  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppBarModel.dispose();
  }
}

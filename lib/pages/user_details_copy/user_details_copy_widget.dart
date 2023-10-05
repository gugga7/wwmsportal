import '/components/modal_sections/user_details_main/user_details_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_details_copy_model.dart';
export 'user_details_copy_model.dart';

class UserDetailsCopyWidget extends StatefulWidget {
  const UserDetailsCopyWidget({
    Key? key,
    bool? showBack,
  })  : this.showBack = showBack ?? true,
        super(key: key);

  final bool showBack;

  @override
  _UserDetailsCopyWidgetState createState() => _UserDetailsCopyWidgetState();
}

class _UserDetailsCopyWidgetState extends State<UserDetailsCopyWidget> {
  late UserDetailsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDetailsCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'userDetailsCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: wrapWithModel(
            model: _model.userDetailsMainModel,
            updateCallback: () => setState(() {}),
            child: UserDetailsMainWidget(
              showBack: widget.showBack,
            ),
          ),
        ));
  }
}

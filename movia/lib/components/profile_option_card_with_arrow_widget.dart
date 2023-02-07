import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileOptionCardWithArrowWidget extends StatefulWidget {
  const ProfileOptionCardWithArrowWidget({
    Key? key,
    this.icon,
    this.title,
  }) : super(key: key);

  final Widget? icon;
  final String? title;

  @override
  _ProfileOptionCardWithArrowWidgetState createState() =>
      _ProfileOptionCardWithArrowWidgetState();
}

class _ProfileOptionCardWithArrowWidgetState
    extends State<ProfileOptionCardWithArrowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: widget.icon!,
          ),
          Expanded(
            child: Text(
              widget.title!,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: Icon(
              FFIcons.knameRightArrow2,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

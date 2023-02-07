import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCardWidget extends StatefulWidget {
  const ThemeCardWidget({
    Key? key,
    this.isActive,
    this.icon,
    this.title,
    this.isRightIcon,
  }) : super(key: key);

  final bool? isActive;
  final Widget? icon;
  final String? title;
  final bool? isRightIcon;

  @override
  _ThemeCardWidgetState createState() => _ThemeCardWidgetState();
}

class _ThemeCardWidgetState extends State<ThemeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!widget.isRightIcon!)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: widget.icon!,
            ),
          if (widget.isRightIcon ?? true) Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Text(
              widget.title!,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          if (widget.isRightIcon ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: widget.icon!,
            ),
        ],
      ),
    );
  }
}

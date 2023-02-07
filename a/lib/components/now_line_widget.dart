import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NowLineWidget extends StatefulWidget {
  const NowLineWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  final int? height;

  @override
  _NowLineWidgetState createState() => _NowLineWidgetState();
}

class _NowLineWidgetState extends State<NowLineWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: widget.height?.toDouble(),
          decoration: BoxDecoration(),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.03,
              height: MediaQuery.of(context).size.width * 0.03,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 2,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

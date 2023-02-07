import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HourBackgroundWidget extends StatefulWidget {
  const HourBackgroundWidget({
    Key? key,
    this.time,
    this.period,
  }) : super(key: key);

  final String? time;
  final String? period;

  @override
  _HourBackgroundWidgetState createState() => _HourBackgroundWidgetState();
}

class _HourBackgroundWidgetState extends State<HourBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: FFAppState().hourHeight.toDouble(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                SelectionArea(
                                    child: Text(
                                  widget.time!,
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      ),
                                )),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0.45),
                                  child: SelectionArea(
                                      child: Text(
                                    valueOrDefault<String>(
                                      widget.period,
                                      'am',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Color(0x80E0E3E7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

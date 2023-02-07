import '../components/event_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({
    Key? key,
    this.start,
    this.duration,
    this.title,
    this.color,
    this.attendees,
    this.description,
    this.startTimestamp,
    this.endTimestamp,
    this.alert,
    this.location,
  }) : super(key: key);

  final int? start;
  final int? duration;
  final String? title;
  final Color? color;
  final dynamic attendees;
  final String? description;
  final DateTime? startTimestamp;
  final DateTime? endTimestamp;
  final String? alert;
  final String? location;

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxHeight: functions.add(widget.start!, widget.duration!).toDouble(),
      ),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: widget.start?.toDouble(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          InkWell(
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: EventDetailsWidget(
                      attendees: widget.attendees,
                      title: widget.title,
                      description: widget.description,
                      start: widget.startTimestamp,
                      end: widget.endTimestamp,
                      alert: widget.alert,
                      color: widget.color,
                      location: widget.location,
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: widget.duration?.toDouble(),
                constraints: BoxConstraints(
                  maxWidth: 250,
                ),
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    widget.color,
                    Color(0xFFCAD2C5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  widget.title!,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  '${dateTimeFormat('jm', widget.startTimestamp)} - ${dateTimeFormat('jm', widget.endTimestamp)}',
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (widget.duration! > 100)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100,
                              child: Stack(
                                children: [
                                  if (getJsonField(
                                        widget.attendees,
                                        r'''$[0]''',
                                      ) !=
                                      null)
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            getJsonField(
                                              widget.attendees,
                                              r'''$[0].img''',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.attendees,
                                        r'''$[1]''',
                                      ) !=
                                      null)
                                    Align(
                                      alignment: AlignmentDirectional(-0.45, 0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              getJsonField(
                                                widget.attendees,
                                                r'''$[1].img''',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.attendees,
                                        r'''$[2]''',
                                      ) !=
                                      null)
                                    Align(
                                      alignment: AlignmentDirectional(0.1, 0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              getJsonField(
                                                widget.attendees,
                                                r'''$[2].img''',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

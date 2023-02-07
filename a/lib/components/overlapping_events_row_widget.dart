import '../components/event_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OverlappingEventsRowWidget extends StatefulWidget {
  const OverlappingEventsRowWidget({
    Key? key,
    this.overlappingEvents,
  }) : super(key: key);

  final dynamic overlappingEvents;

  @override
  _OverlappingEventsRowWidgetState createState() =>
      _OverlappingEventsRowWidgetState();
}

class _OverlappingEventsRowWidgetState
    extends State<OverlappingEventsRowWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: functions
            .overlappingDuration(
                widget.overlappingEvents, FFAppState().hourHeight)
            .toDouble(),
        decoration: BoxDecoration(),
        child: Builder(
          builder: (context) {
            final event =
                (widget.overlappingEvents?.toList() ?? []).take(5).toList();
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(event.length, (eventIndex) {
                final eventItem = event[eventIndex];
                return Visibility(
                  visible: getJsonField(
                        eventItem,
                        r'''$.visible''',
                      ) ==
                      FFAppState().trueValue,
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: EventWidget(
                        key: UniqueKey(),
                        start: functions.startOffset(widget.overlappingEvents,
                            FFAppState().hourHeight, eventItem),
                        duration: functions.eventDuration(
                            eventItem, FFAppState().hourHeight),
                        title: getJsonField(
                          eventItem,
                          r'''$.title''',
                        ).toString(),
                        color: colorFromCssString(
                          getJsonField(
                            eventItem,
                            r'''$.color''',
                          ).toString(),
                          defaultColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        attendees: getJsonField(
                          eventItem,
                          r'''$.guests''',
                        ),
                        description: getJsonField(
                          eventItem,
                          r'''$.description''',
                        ).toString(),
                        alert: getJsonField(
                          eventItem,
                          r'''$.alert''',
                        ).toString(),
                        location: getJsonField(
                          eventItem,
                          r'''$.location''',
                        ).toString(),
                        startTimestamp:
                            functions.timestampFromString(getJsonField(
                          eventItem,
                          r'''$.start_time''',
                        ).toString()),
                        endTimestamp:
                            functions.timestampFromString(getJsonField(
                          eventItem,
                          r'''$.end_time''',
                        ).toString()),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

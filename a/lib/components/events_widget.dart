import '../components/overlapping_events_row_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  final int? height;

  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
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
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
              child: Builder(
                builder: (context) {
                  final overlappingEvents = functions
                      .insertBlankRows(
                          functions
                              .rowsFromEvents(functions.getEvents(),
                                  FFAppState().selectedDay!)
                              .toList(),
                          FFAppState().selectedDay!)
                      .toList();
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(overlappingEvents.length,
                        (overlappingEventsIndex) {
                      final overlappingEventsItem =
                          overlappingEvents[overlappingEventsIndex];
                      return OverlappingEventsRowWidget(
                        key: UniqueKey(),
                        overlappingEvents: overlappingEventsItem,
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

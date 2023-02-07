import '../components/hour_background_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  final int? height;

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height?.toDouble(),
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Builder(
          builder: (context) {
            final hours = getJsonField(
              functions.getHours(),
              r'''$.hours[*]''',
            ).toList();
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(hours.length, (hoursIndex) {
                final hoursItem = hours[hoursIndex];
                return HourBackgroundWidget(
                  key: UniqueKey(),
                  time: getJsonField(
                    hoursItem,
                    r'''$.hour''',
                  ).toString(),
                  period: getJsonField(
                    hoursItem,
                    r'''$.period''',
                  ).toString(),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

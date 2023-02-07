import '../components/day_picker_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({
    Key? key,
    this.callback,
  }) : super(key: key);

  final Future<dynamic> Function()? callback;

  @override
  _WeekDaysWidgetState createState() => _WeekDaysWidgetState();
}

class _WeekDaysWidgetState extends State<WeekDaysWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'rowOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final day = functions
            .generateSurroundingDays(FFAppState().selectedDay)
            .toList();
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(day.length, (dayIndex) {
            final dayItem = day[dayIndex];
            return InkWell(
              onTap: () async {
                if (dayItem != FFAppState().selectedDay) {
                  FFAppState().update(() {
                    FFAppState().selectedDayIndicator = dayItem;
                  });
                  await Future.delayed(const Duration(milliseconds: 200));
                  FFAppState().update(() {
                    FFAppState().selectedDay = dayItem;
                  });
                  await widget.callback?.call();
                }
              },
              child: DayPickerWidget(
                key: UniqueKey(),
                day: getJsonField(
                  functions.dateInfo(dayItem),
                  r'''$.day''',
                ),
                weekday: getJsonField(
                  functions.dateInfo(dayItem),
                  r'''$.weekday''',
                ).toString(),
                selected: dayItem == FFAppState().selectedDay,
                tapped: dayItem == FFAppState().selectedDayIndicator,
              ),
            );
          }),
        ).animateOnActionTrigger(
          animationsMap['rowOnActionTriggerAnimation']!,
        );
      },
    );
  }
}

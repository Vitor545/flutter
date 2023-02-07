import '../components/background_widget.dart';
import '../components/events_widget.dart';
import '../components/now_line_widget.dart';
import '../components/week_days_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'eventsOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(47, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  ScrollController? scrollableColumn;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().selectedDay = getCurrentTimestamp;
      });
      if (animationsMap['eventsOnActionTriggerAnimation'] != null) {
        await animationsMap['eventsOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
    });

    scrollableColumn = ScrollController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    scrollableColumn?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await scrollableColumn?.animateTo(
            scrollableColumn!.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).white,
          size: 24,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          alignment: AlignmentDirectional(0, -1),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 235, 0, 0),
              child: SingleChildScrollView(
                controller: scrollableColumn,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        BackgroundWidget(
                          height:
                              functions.multiply(FFAppState().hourHeight, 23),
                        ),
                        if (dateTimeFormat('d/M/y', FFAppState().selectedDay) ==
                            dateTimeFormat('d/M/y', getCurrentTimestamp))
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: NowLineWidget(
                              height:
                                  functions.nowHeight(FFAppState().hourHeight),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: EventsWidget(
                            height:
                                functions.multiply(FFAppState().hourHeight, 24),
                          ).animateOnActionTrigger(
                            animationsMap['eventsOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 235,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x11000000),
                    offset: Offset(0, 6),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          child: Stack(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/turo-deals-1599612493143.appspot.com/o/demo_images%2Fmichael.jpg?alt=media&token=81bd1338-4ff5-44c0-b4c8-097d8dee8fc6',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.calendar_today,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20,
                          ),
                          onPressed: () async {
                            FFAppState().update(() {
                              FFAppState().selectedDay = getCurrentTimestamp;
                            });
                            if (animationsMap[
                                    'eventsOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'eventsOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectionArea(
                              child: Text(
                            getJsonField(
                              functions.dateInfo(FFAppState().selectedDay!),
                              r'''$.month''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x7A57636C),
                                      fontSize: 32,
                                    ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
                      child: WeekDaysWidget(
                        callback: () async {
                          FFAppState().update(() {
                            FFAppState().selectedDay = FFAppState().selectedDay;
                          });
                          if (animationsMap['eventsOnActionTriggerAnimation'] !=
                              null) {
                            await animationsMap[
                                    'eventsOnActionTriggerAnimation']!
                                .controller
                                .forward(from: 0.0);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.85, 0.95),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).overlayWhite,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: FaIcon(
                            FontAwesomeIcons.minus,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 10,
                          ),
                          onPressed: () async {
                            FFAppState().update(() {
                              FFAppState().hourHeight =
                                  FFAppState().hourHeight + -10;
                            });
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15,
                          ),
                          onPressed: () async {
                            FFAppState().update(() {
                              FFAppState().hourHeight =
                                  FFAppState().hourHeight + 10;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

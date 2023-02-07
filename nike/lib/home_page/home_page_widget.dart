import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  PageController? pageViewController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).borderIcons,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      FFIcons.kmenu,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                  ),
                  Icon(
                    FFIcons.knike,
                    color: Color(0xFFEEEEF0),
                    size: 50,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).borderIcons,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      FFIcons.kbag,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
              child: SelectionArea(
                  child: Text(
                'New Collection',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              )),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: SelectionArea(
                  child: Text(
                'Nike original 2022',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFE05946),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              )),
            ),
            Builder(
              builder: (context) {
                final itemsStock = getJsonField(
                  FFAppState().nikeStock,
                  r'''$.items[?(@.newCollection)]''',
                ).toList();
                return Container(
                  width: double.infinity,
                  height: 220,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: PageView.builder(
                          controller: pageViewController ??= PageController(
                              initialPage: min(0, itemsStock.length - 1)),
                          scrollDirection: Axis.horizontal,
                          itemCount: itemsStock.length,
                          itemBuilder: (context, itemsStockIndex) {
                            final itemsStockItem = itemsStock[itemsStockIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                child: Stack(
                                  alignment: AlignmentDirectional(1, 0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 20, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF2F7FA),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    120, 0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          getJsonField(
                                                            itemsStockItem,
                                                            r'''$..name''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        )),
                                                      ),
                                                      SelectionArea(
                                                          child: Text(
                                                        'Men´s shoes',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0x80101213),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      )),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        10,
                                                                        0,
                                                                        0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  'DetailsPage',
                                                                  queryParams: {
                                                                    'item':
                                                                        serializeParam(
                                                                      itemsStockItem,
                                                                      ParamType
                                                                          .JSON,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              text: 'Shop now',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 110,
                                                                height: 40,
                                                                color: Colors
                                                                    .black,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Hero(
                                      tag: getJsonField(
                                        itemsStockItem,
                                        r'''$..image''',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: Image.network(
                                        getJsonField(
                                          itemsStockItem,
                                          r'''$..image''',
                                        ),
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: pageViewController ??= PageController(
                                initialPage: min(0, itemsStock.length - 1)),
                            count: itemsStock.length,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.SlideEffect(
                              spacing: 8,
                              radius: 16,
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor: Color(0xFFE1E1E1),
                              activeDotColor: Color(0xFFE05946),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().isLifestyleTab = true;
                      });
                      FFAppState().update(() {
                        FFAppState().isRunningTab = false;
                      });
                      FFAppState().update(() {
                        FFAppState().isTennisTab = false;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectionArea(
                            child: Text(
                          'Lifestyle',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: FFAppState().isLifestyleTab
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).inativeTab,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                        )),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SelectionArea(
                                child: Text(
                              '2 items',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FFAppState().isLifestyleTab
                                        ? FlutterFlowTheme.of(context).activeTab
                                        : FlutterFlowTheme.of(context)
                                            .inativeTab,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().isRunningTab = true;
                      });
                      FFAppState().update(() {
                        FFAppState().isLifestyleTab = false;
                      });
                      FFAppState().update(() {
                        FFAppState().isTennisTab = false;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectionArea(
                            child: Text(
                          'Running',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: valueOrDefault<Color>(
                                  FFAppState().isRunningTab
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).inativeTab,
                                  FlutterFlowTheme.of(context).inativeTab,
                                ),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                        )),
                        SelectionArea(
                            child: Text(
                          '2  items',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: FFAppState().isRunningTab
                                    ? FlutterFlowTheme.of(context).activeTab
                                    : FlutterFlowTheme.of(context).inativeTab,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().isTennisTab = true;
                      });
                      FFAppState().update(() {
                        FFAppState().isLifestyleTab = false;
                      });
                      FFAppState().update(() {
                        FFAppState().isRunningTab = false;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectionArea(
                            child: Text(
                          'Tennis',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: FFAppState().isTennisTab
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).inativeTab,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                        )),
                        SelectionArea(
                            child: Text(
                          '2 item',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color: FFAppState().isTennisTab
                                    ? FlutterFlowTheme.of(context).activeTab
                                    : FlutterFlowTheme.of(context).inativeTab,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (FFAppState().isLifestyleTab)
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Builder(
                    builder: (context) {
                      final itemsCategoryLifestyle = getJsonField(
                        FFAppState().nikeStock,
                        r'''$.items[?(@.category == 'Lifestyle')]''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsCategoryLifestyle.length,
                        itemBuilder: (context, itemsCategoryLifestyleIndex) {
                          final itemsCategoryLifestyleItem =
                              itemsCategoryLifestyle[
                                  itemsCategoryLifestyleIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Container(
                              width: 160,
                              height: 380,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: 170,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F7FA),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 20, 40, 0),
                                                child: SelectionArea(
                                                    child: AutoSizeText(
                                                  getJsonField(
                                                    itemsCategoryLifestyleItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final colorsItemLifestyle =
                                                      getJsonField(
                                                    itemsCategoryLifestyleItem,
                                                    r'''$.colors''',
                                                  ).toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        colorsItemLifestyle
                                                            .length,
                                                        (colorsItemLifestyleIndex) {
                                                      final colorsItemLifestyleItem =
                                                          colorsItemLifestyle[
                                                              colorsItemLifestyleIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                colorFromCssString(
                                                              colorsItemLifestyleItem
                                                                  .toString(),
                                                              defaultColor:
                                                                  Colors.black,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 20),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            '\$',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          )),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          getJsonField(
                                                            itemsCategoryLifestyleItem,
                                                            r'''$.price''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 24,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Price',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0x65101213),
                                                                fontSize: 10,
                                                              ),
                                                    )),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0x4D000000),
                                                      borderRadius: 15,
                                                      borderWidth: 2,
                                                      buttonSize: 50,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        FFIcons.karrowRight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 25,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'DetailsPage',
                                                          queryParams: {
                                                            'item':
                                                                serializeParam(
                                                              itemsCategoryLifestyleItem,
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Hero(
                                    tag: getJsonField(
                                      itemsCategoryLifestyleItem,
                                      r'''$.image''',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: Image.network(
                                      getJsonField(
                                        itemsCategoryLifestyleItem,
                                        r'''$.image''',
                                      ),
                                      width: 140,
                                      height: 140,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (FFAppState().isRunningTab)
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Builder(
                    builder: (context) {
                      final itemsCategoryRunning = getJsonField(
                        FFAppState().nikeStock,
                        r'''$.items[?(@.category == 'Running')]''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsCategoryRunning.length,
                        itemBuilder: (context, itemsCategoryRunningIndex) {
                          final itemsCategoryRunningItem =
                              itemsCategoryRunning[itemsCategoryRunningIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Container(
                              width: 160,
                              height: 380,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: 170,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F7FA),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 20, 40, 0),
                                                child: SelectionArea(
                                                    child: AutoSizeText(
                                                  getJsonField(
                                                    itemsCategoryRunningItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final colorsItemLifestyle =
                                                      getJsonField(
                                                    itemsCategoryRunningItem,
                                                    r'''$.colors''',
                                                  ).toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        colorsItemLifestyle
                                                            .length,
                                                        (colorsItemLifestyleIndex) {
                                                      final colorsItemLifestyleItem =
                                                          colorsItemLifestyle[
                                                              colorsItemLifestyleIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                colorFromCssString(
                                                              colorsItemLifestyleItem
                                                                  .toString(),
                                                              defaultColor:
                                                                  Colors.black,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 20),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            '\$',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          )),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          getJsonField(
                                                            itemsCategoryRunningItem,
                                                            r'''$.price''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 24,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Price',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0x65101213),
                                                                fontSize: 10,
                                                              ),
                                                    )),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0x4D000000),
                                                      borderRadius: 15,
                                                      borderWidth: 2,
                                                      buttonSize: 50,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        FFIcons.karrowRight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 25,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'DetailsPage',
                                                          queryParams: {
                                                            'item':
                                                                serializeParam(
                                                              itemsCategoryRunningItem,
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Hero(
                                    tag: getJsonField(
                                      itemsCategoryRunningItem,
                                      r'''$.image''',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: Image.network(
                                      getJsonField(
                                        itemsCategoryRunningItem,
                                        r'''$.image''',
                                      ),
                                      width: 140,
                                      height: 140,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (FFAppState().isTennisTab)
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Builder(
                    builder: (context) {
                      final itemsCategoryTennis = getJsonField(
                        FFAppState().nikeStock,
                        r'''$.items[?(@.category == 'Tennis')]''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsCategoryTennis.length,
                        itemBuilder: (context, itemsCategoryTennisIndex) {
                          final itemsCategoryTennisItem =
                              itemsCategoryTennis[itemsCategoryTennisIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Container(
                              width: 160,
                              height: 380,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: 170,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F7FA),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 20, 40, 0),
                                                child: SelectionArea(
                                                    child: AutoSizeText(
                                                  getJsonField(
                                                    itemsCategoryTennisItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final colorsItemLifestyle =
                                                      getJsonField(
                                                    itemsCategoryTennisItem,
                                                    r'''$.colors''',
                                                  ).toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        colorsItemLifestyle
                                                            .length,
                                                        (colorsItemLifestyleIndex) {
                                                      final colorsItemLifestyleItem =
                                                          colorsItemLifestyle[
                                                              colorsItemLifestyleIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                colorFromCssString(
                                                              colorsItemLifestyleItem
                                                                  .toString(),
                                                              defaultColor:
                                                                  Colors.black,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 20),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            '\$',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          )),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          getJsonField(
                                                            itemsCategoryTennisItem,
                                                            r'''$.price''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 24,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Price',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0x65101213),
                                                                fontSize: 10,
                                                              ),
                                                    )),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Color(0x4D000000),
                                                      borderRadius: 15,
                                                      borderWidth: 2,
                                                      buttonSize: 50,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        FFIcons.karrowRight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 25,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'DetailsPage',
                                                          queryParams: {
                                                            'item':
                                                                serializeParam(
                                                              itemsCategoryTennisItem,
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Hero(
                                    tag: getJsonField(
                                      itemsCategoryTennisItem,
                                      r'''$.image''',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: Image.network(
                                      getJsonField(
                                        itemsCategoryTennisItem,
                                        r'''$.image''',
                                      ),
                                      width: 140,
                                      height: 140,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 50),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 0,
                      ),
                    ),
                    child: Icon(
                      FFIcons.khome,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16,
                          color: Color(0x41000000),
                          offset: Offset(0, 10),
                        )
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      FFIcons.ksearch,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 0,
                      ),
                    ),
                    child: Icon(
                      FFIcons.kheart,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
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

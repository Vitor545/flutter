import '../backend/api_requests/api_calls.dart';
import '../components/movie_card_widget.dart';
import '../components/season_card_widget.dart';
import '../episodes/episodes_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TvShowsDetailsWidget extends StatefulWidget {
  const TvShowsDetailsWidget({
    Key? key,
    this.tvId,
  }) : super(key: key);

  final int? tvId;

  @override
  _TvShowsDetailsWidgetState createState() => _TvShowsDetailsWidgetState();
}

class _TvShowsDetailsWidgetState extends State<TvShowsDetailsWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: FutureBuilder<ApiCallResponse>(
            future: TvShowsInfoCall.call(
              tvId: widget.tvId,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final columnTvShowsInfoResponse = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            valueOrDefault<String>(
                              'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2${getJsonField(
                                columnTvShowsInfoResponse.jsonBody,
                                r'''$.backdrop_path''',
                              ).toString()}',
                              'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            height: 400,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  FlutterFlowTheme.of(context).primaryBackground
                                ],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Container(
                              width: double.infinity,
                              height: 96,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 16, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                columnTvShowsInfoResponse
                                                    .jsonBody,
                                                r'''$.name''',
                                              ).toString(),
                                              'Abu Anwar',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${getJsonField(
                                                    columnTvShowsInfoResponse
                                                        .jsonBody,
                                                    r'''$.episode_run_time[0]''',
                                                  ).toString()}m',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Container(
                                                    width: 4,
                                                    height: 4,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      columnTvShowsInfoResponse
                                                          .jsonBody,
                                                      r'''$.genres[0:2]..name''',
                                                    ).toString(),
                                                    'Thriller',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Container(
                                                    width: 4,
                                                    height: 4,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Num of Season ${getJsonField(
                                                      columnTvShowsInfoResponse
                                                          .jsonBody,
                                                      r'''$.number_of_seasons''',
                                                    ).toString()}',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.solidStar,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 16,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  getJsonField(
                                                    columnTvShowsInfoResponse
                                                        .jsonBody,
                                                    r'''$.vote_average''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 0, 0, 0),
                                                child: Text(
                                                  functions
                                                      .numOfReviewsFormater(
                                                          valueOrDefault<int>(
                                                    getJsonField(
                                                      columnTvShowsInfoResponse
                                                          .jsonBody,
                                                      r'''$.vote_count''',
                                                    ),
                                                    0,
                                                  )),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xB3272B30),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.arrow_back_ios_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xB3272B30),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.bookmark,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Story',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              getJsonField(
                                columnTvShowsInfoResponse.jsonBody,
                                r'''$.overview''',
                              ).toString(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 8),
                      child: Text(
                        'Seasons',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: Builder(
                        builder: (context) {
                          final season = getJsonField(
                            columnTvShowsInfoResponse.jsonBody,
                            r'''$.seasons''',
                          ).toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(season.length, (seasonIndex) {
                              final seasonItem = season[seasonIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EpisodesWidget(
                                          tvId: valueOrDefault<int>(
                                            getJsonField(
                                              columnTvShowsInfoResponse
                                                  .jsonBody,
                                              r'''$.id''',
                                            ),
                                            66732,
                                          ),
                                          seasonNum: valueOrDefault<int>(
                                            getJsonField(
                                              seasonItem,
                                              r'''$.season_number''',
                                            ),
                                            1,
                                          ),
                                          seasonName: valueOrDefault<String>(
                                            getJsonField(
                                              seasonItem,
                                              r'''$.name''',
                                            ).toString(),
                                            'Season',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: SeasonCardWidget(
                                    key: UniqueKey(),
                                    name: getJsonField(
                                      seasonItem,
                                      r'''$.name''',
                                    ).toString(),
                                    year: 2022,
                                    numOfEpisodes: valueOrDefault<int>(
                                      getJsonField(
                                        seasonItem,
                                        r'''$.episode_count''',
                                      ),
                                      1,
                                    ),
                                    poster: getJsonField(
                                      seasonItem,
                                      r'''$.poster_path''',
                                    ).toString(),
                                    overview: getJsonField(
                                      seasonItem,
                                      r'''$.overview''',
                                    ).toString(),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 8, 0, 8),
                      child: Text(
                        'Similar',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 224,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: SimilarTvShowsCall.call(
                          tvId: widget.tvId,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final listViewSimilarTvShowsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final similarTvShows = getJsonField(
                                listViewSimilarTvShowsResponse.jsonBody,
                                r'''$.results''',
                              ).toList().take(8).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: similarTvShows.length,
                                itemBuilder: (context, similarTvShowsIndex) {
                                  final similarTvShowsItem =
                                      similarTvShows[similarTvShowsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TvShowsDetailsWidget(
                                              tvId: getJsonField(
                                                similarTvShowsItem,
                                                r'''$.id''',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: MovieCardWidget(
                                        key: UniqueKey(),
                                        imagePath: valueOrDefault<String>(
                                          getJsonField(
                                            similarTvShowsItem,
                                            r'''$.poster_path''',
                                          ).toString(),
                                          '/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg',
                                        ),
                                        title: getJsonField(
                                          similarTvShowsItem,
                                          r'''$.name''',
                                        ).toString(),
                                        duration: '1h 37m',
                                        rating: valueOrDefault<String>(
                                          getJsonField(
                                            similarTvShowsItem,
                                            r'''$.vote_average''',
                                          ).toString(),
                                          '5.5',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import '../backend/api_requests/api_calls.dart';
import '../components/movie_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../movie_details/movie_details_widget.dart';
import '../tv_shows_details/tv_shows_details_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: TrendingCall.call(),
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
                  final pageViewTrendingResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final results = getJsonField(
                        pageViewTrendingResponse.jsonBody,
                        r'''$.results''',
                      ).toList().take(4).toList();
                      return Container(
                        width: double.infinity,
                        height: 400,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: pageViewController ??= PageController(
                                  initialPage: min(0, results.length - 1)),
                              scrollDirection: Axis.horizontal,
                              itemCount: results.length,
                              itemBuilder: (context, resultsIndex) {
                                final resultsItem = results[resultsIndex];
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetailsWidget(
                                          movieId: getJsonField(
                                            resultsItem,
                                            r'''$.id''',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailsWidget(
                                                movieId: getJsonField(
                                                  resultsItem,
                                                  r'''$.id''',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 400,
                                          child: custom_widgets.ImdbImage(
                                            width: double.infinity,
                                            height: 400,
                                            imagePath: valueOrDefault<String>(
                                              getJsonField(
                                                resultsItem,
                                                r'''$.backdrop_path''',
                                              ).toString(),
                                              '/393mh1AJ0GYWVD7Hsq5KkFaTAoT.jpg',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                              ],
                                              stops: [0, 1],
                                              begin:
                                                  AlignmentDirectional(0, -1),
                                              end: AlignmentDirectional(0, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, 0.85),
                                        child: Container(
                                          width: double.infinity,
                                          height: 68,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 24, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            resultsItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 20,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: Text(
                                                            'Action • Drama • Adventure',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0.7),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.play,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, 0.95),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: pageViewController ??=
                                    PageController(
                                        initialPage:
                                            min(0, results.length - 1)),
                                count: results.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) {
                                  pageViewController!.animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 12,
                                  dotHeight: 6,
                                  dotColor: Color(0x33EF233C),
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now Playing',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    Text(
                      'See all >',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: NowPlayingMoviesCall.call(),
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
                    final listViewNowPlayingMoviesResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final movies = getJsonField(
                          listViewNowPlayingMoviesResponse.jsonBody,
                          r'''$.results''',
                        ).toList().take(8).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, moviesIndex) {
                            final moviesItem = movies[moviesIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailsWidget(
                                        movieId: getJsonField(
                                          moviesItem,
                                          r'''$.id''',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: MovieCardWidget(
                                  key: UniqueKey(),
                                  imagePath: getJsonField(
                                    moviesItem,
                                    r'''$.poster_path''',
                                  ).toString(),
                                  title: getJsonField(
                                    moviesItem,
                                    r'''$.title''',
                                  ).toString(),
                                  duration: '1h 37m',
                                  rating: getJsonField(
                                    moviesItem,
                                    r'''$.vote_average''',
                                  ).toString(),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On TV',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    Text(
                      'See all >',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: TvShowsOnAirCall.call(),
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
                    final listViewTvShowsOnAirResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final tvshows = getJsonField(
                          listViewTvShowsOnAirResponse.jsonBody,
                          r'''$.results''',
                        ).toList().take(8).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: tvshows.length,
                          itemBuilder: (context, tvshowsIndex) {
                            final tvshowsItem = tvshows[tvshowsIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: TvShowsInfoCall.call(
                                  tvId: getJsonField(
                                    tvshowsItem,
                                    r'''$.id''',
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final movieCardTvShowsInfoResponse =
                                      snapshot.data!;
                                  return InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TvShowsDetailsWidget(
                                            tvId: getJsonField(
                                              tvshowsItem,
                                              r'''$.id''',
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: UniqueKey(),
                                      imagePath: getJsonField(
                                        tvshowsItem,
                                        r'''$.poster_path''',
                                      ).toString(),
                                      title: getJsonField(
                                        tvshowsItem,
                                        r'''$.name''',
                                      ).toString(),
                                      duration: 'S${getJsonField(
                                        movieCardTvShowsInfoResponse.jsonBody,
                                        r'''$.last_episode_to_air.season_number''',
                                      ).toString()}E${getJsonField(
                                        movieCardTvShowsInfoResponse.jsonBody,
                                        r'''$.last_episode_to_air.episode_number''',
                                      ).toString()}',
                                      rating: getJsonField(
                                        tvshowsItem,
                                        r'''$.vote_average''',
                                      ).toString(),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Movies',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    Text(
                      'See all >',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: PopularMoviesCall.call(),
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
                    final listViewPopularMoviesResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final popularMovies = getJsonField(
                          listViewPopularMoviesResponse.jsonBody,
                          r'''$.results''',
                        ).toList().take(8).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMovies.length,
                          itemBuilder: (context, popularMoviesIndex) {
                            final popularMoviesItem =
                                popularMovies[popularMoviesIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailsWidget(
                                        movieId: valueOrDefault<int>(
                                          getJsonField(
                                            popularMoviesItem,
                                            r'''$.id''',
                                          ),
                                          278,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: MovieCardWidget(
                                  key: UniqueKey(),
                                  imagePath: getJsonField(
                                    popularMoviesItem,
                                    r'''$.poster_path''',
                                  ).toString(),
                                  title: getJsonField(
                                    popularMoviesItem,
                                    r'''$.title''',
                                  ).toString(),
                                  duration: '1h 37m',
                                  rating: getJsonField(
                                    popularMoviesItem,
                                    r'''$.vote_average''',
                                  ).toString(),
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
        ),
      ),
    );
  }
}

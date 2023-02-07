import '../backend/api_requests/api_calls.dart';
import '../components/episode_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EpisodesBottomSheetWidget extends StatefulWidget {
  const EpisodesBottomSheetWidget({
    Key? key,
    this.tvShowName,
    this.seasonName,
    this.seasonId,
  }) : super(key: key);

  final String? tvShowName;
  final String? seasonName;
  final int? seasonId;

  @override
  _EpisodesBottomSheetWidgetState createState() =>
      _EpisodesBottomSheetWidgetState();
}

class _EpisodesBottomSheetWidgetState extends State<EpisodesBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
            child: Container(
              width: 80,
              height: 6,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stranger Things / ',
                maxLines: 1,
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              Text(
                'Season 1',
                maxLines: 1,
                style: FlutterFlowTheme.of(context).subtitle2,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: FutureBuilder<ApiCallResponse>(
                future: EpisodesCall.call(),
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
                  final listViewEpisodesResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final episode = getJsonField(
                        listViewEpisodesResponse.jsonBody,
                        r'''$.episodes''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: episode.length,
                        itemBuilder: (context, episodeIndex) {
                          final episodeItem = episode[episodeIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: EpisodeCardWidget(
                              key: UniqueKey(),
                              image: valueOrDefault<String>(
                                'https://www.themoviedb.org/t/p/w454_and_h254_bestv2${valueOrDefault<String>(
                                  getJsonField(
                                    episodeItem,
                                    r'''$.still_path''',
                                  ).toString(),
                                  '/cmCOUjjQ1TfCh1Gj9V4IFAd2XNu.jpg',
                                )}',
                                'https://www.themoviedb.org/t/p/w454_and_h254_bestv2/cmCOUjjQ1TfCh1Gj9V4IFAd2XNu.jpg',
                              ),
                              name: getJsonField(
                                episodeItem,
                                r'''$.name''',
                              ).toString(),
                              overview: getJsonField(
                                episodeItem,
                                r'''$.overview''',
                              ).toString(),
                              relaseDate: valueOrDefault<String>(
                                getJsonField(
                                  episodeItem,
                                  r'''$.air_date''',
                                ).toString(),
                                '2022',
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
          ),
        ],
      ),
    );
  }
}

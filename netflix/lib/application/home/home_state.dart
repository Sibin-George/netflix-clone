part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramasMovieList,
    required List<HotAndNewData> southIndianMovieList,    
    required List<HotAndNewData> Top10TvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomeState.initial() => HomeState(
      pastYearMovieList: [],
      trendingMovieList: [],
      tenseDramasMovieList: [],
      southIndianMovieList: [],
      Top10TvList:[],
      isLoading: false,
      hasError: false);
}

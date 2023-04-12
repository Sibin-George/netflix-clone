import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new_resp/hotandnew_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<GetHomescreenData>((event, emit) async {
      if (state.pastYearMovieList.isNotEmpty) {
        emit(
          HomeState(
              tenseDramasMovieList: state.tenseDramasMovieList,
              Top10TvList:state.Top10TvList,
              isLoading: false,
              pastYearMovieList:state.pastYearMovieList,
              hasError: false,
              southIndianMovieList: state.southIndianMovieList,
              trendingMovieList:state.trendingMovieList),
        );
        return;
      }
      emit(state.copyWith(isLoading: true, hasError: false));
      final _MovieResult = await _homeService.getHotAndNewMovieData();
      final _TvResult = await _homeService.getHotAndNewTvData();
      final _TrendingResult = await _homeService.TrendingTvData();
      final _Top10Result = await _homeService.Top10ListData();
      final _TenseDramaResult = await _homeService.TenseDramaData();
      final _SouthIndianResult = await _homeService.SouthIndianData();

      final _state1 = _MovieResult.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            Top10TvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;

        return HomeState(
            pastYearMovieList: pastYear,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            Top10TvList: state.Top10TvList,
            isLoading: false,
            hasError: false);
      });
      emit(_state1);
      final _state2 = _TvResult.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            Top10TvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final top10List = resp.results;

        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            Top10TvList: top10List,
            isLoading: false,
            hasError: false);
      });
      emit(_state2);
      final _state3 = _TrendingResult.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            Top10TvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final trending = resp.results;

        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: trending,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            Top10TvList: state.Top10TvList,
            isLoading: false,
            hasError: false);
      });
      emit(_state3);
      final _state4 = _Top10Result.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            Top10TvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final _Top10 = resp.results;

        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            Top10TvList: _Top10,
            isLoading: false,
            hasError: false);
      });
      emit(_state4);
      final _state5 = _TenseDramaResult.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            Top10TvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final tenseDrama = resp.results;

        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: tenseDrama,
            southIndianMovieList: state.southIndianMovieList,
            Top10TvList: state.Top10TvList,
            isLoading: false,
            hasError: false);
      });
      emit(_state5);
      final _state6 = _SouthIndianResult.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            Top10TvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final southIndian = resp.results;

        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: southIndian,
            Top10TvList: state.Top10TvList,
            isLoading: false,
            hasError: false);
      });
      emit(_state6);
    });
  }
}

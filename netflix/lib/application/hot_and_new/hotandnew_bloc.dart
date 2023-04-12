import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/hot_and_new_resp/hotandnew_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    // get movie data
    on<LoadDataInComingSoon>((event, emit) async {
    
        if (state.comingSoonList.isNotEmpty) {
        emit(
          HotandnewState(
          comingSoonList: state.comingSoonList,
          EveryOneIsWatchingList: state.EveryOneIsWatchingList,
          isLoading: false,
          hasError: false)
        );
        return;
      }
        //send loading to ui
      emit(const HotandnewState(
          comingSoonList: [],
          EveryOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      // get data
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      final newState=_result.fold((MainFailure failure) {
        return const HotandnewState(
            comingSoonList: [],
            EveryOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
         return  HotandnewState(
            comingSoonList:resp.results ,
            EveryOneIsWatchingList: state.EveryOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
    // get tv data
    on<LoadDataInEveryoneIsWatching>((event, emit)async {
      //send loading to ui
        if (state.EveryOneIsWatchingList.isNotEmpty) {
        emit(
          HotandnewState(
          comingSoonList:state.comingSoonList,
          EveryOneIsWatchingList: state.EveryOneIsWatchingList,
          isLoading: false,
          hasError: false)
        );
        return;
      }
      emit(const HotandnewState(
          comingSoonList: [],
          EveryOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      // get data
      final _result = await _hotAndNewService.getHotAndNewTvData();
      final newState=_result.fold((MainFailure failure) {
        return const HotandnewState(
            comingSoonList: [],
            EveryOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
         return  HotandnewState(
            comingSoonList:state.comingSoonList ,
            EveryOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });
      emit(newState);
    });
  }
}

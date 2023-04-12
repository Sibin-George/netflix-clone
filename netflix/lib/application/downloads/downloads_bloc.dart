import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/downloads/i_downloads_repo.dart';

import '../../domain/core/downloads/downloads.dart';
import '../../domain/core/failures/main_failures.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(isLoading: true, downoadsFailureOrSuccessOption: none()),
      );
      final Either<MainFailure, List<Downloads>> downlodsOptions =
          await _downloadsRepo.getDownloadsImages();
      log(downlodsOptions.toString());
      emit(downlodsOptions.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downoadsFailureOrSuccessOption: Some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downoadsFailureOrSuccessOption: Some(Right(success)))));
    });
  }
}

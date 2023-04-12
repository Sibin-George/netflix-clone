part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    List<Downloads>? downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downoadsFailureOrSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.inital() {
    return DownloadsState(
        isLoading: false, downoadsFailureOrSuccessOption: None());
  }
}

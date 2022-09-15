 import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/errors/failures.dart';


class FailingMessage {

static String getFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ErrorMessages.serverFailure;
      case OfflineFailure:
        return ErrorMessages.offlineFailure;
      case EmptyCacheFailure:
        return ErrorMessages.cacheFailure;
      default:
        return ErrorMessages.defaultMessage;
    }
  }
}


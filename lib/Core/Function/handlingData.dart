import 'package:e_commerce/Core/class/States_request.dart';

handlingData(response) {
  if (response is StatesRequest) {
    if (response == StatesRequest.offline ||
        response == StatesRequest.serverfailure ||
        response == StatesRequest.failure) {
      return response;
    }
  } else {
    return StatesRequest.success;
  }
}

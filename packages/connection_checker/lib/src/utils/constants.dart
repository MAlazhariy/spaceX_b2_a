import 'package:connection_wrapper/src/models/disconnection_oprions_model.dart';

class Constants {
  static late DisconnectionOptions disconnectionOptions;

  static const defaultTitle = "No internet connection";
  static const defaultDescription = "Check the internet connection"; // Should Appear when the connection status is none (wifi and all other network is off)
  static const defaultTryAgain = "Try again";

  static void setDisconnectionOptions(DisconnectionOptions? options) {
    disconnectionOptions = options ??
        const DisconnectionOptions(
          title: defaultTitle,
          tryAgain: defaultTryAgain,
          description: defaultDescription,
        );
  }
}

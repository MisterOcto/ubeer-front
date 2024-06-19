import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class UbeerAuthUser {
  UbeerAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<UbeerAuthUser> ubeerAuthUserSubject =
    BehaviorSubject.seeded(UbeerAuthUser(loggedIn: false));
Stream<UbeerAuthUser> ubeerAuthUserStream() =>
    ubeerAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);

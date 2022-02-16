import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GiftHubFirebaseUser {
  GiftHubFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

GiftHubFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GiftHubFirebaseUser> giftHubFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<GiftHubFirebaseUser>(
        (user) => currentUser = GiftHubFirebaseUser(user));

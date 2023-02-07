import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MoviaFirebaseUser {
  MoviaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MoviaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MoviaFirebaseUser> moviaFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MoviaFirebaseUser>(
      (user) {
        currentUser = MoviaFirebaseUser(user);
        return currentUser!;
      },
    );

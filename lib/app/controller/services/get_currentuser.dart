import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUser {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() {
    final User user = auth.currentUser!;
    final uid = user.uid;
    final email = user.email;
    final photoURL = user.photoURL;
    final emailVerified = user.emailVerified;
    final displayName = user.displayName;
    final phoneNumber = user.phoneNumber;
    final isAnonymous = user.isAnonymous;
    final creationTime = user.metadata.creationTime;
    final lastSignInTime = user.metadata.lastSignInTime;
    final providerData = user.providerData;
  }
}

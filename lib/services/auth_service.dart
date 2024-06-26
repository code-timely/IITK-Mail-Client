import 'package:enough_mail/enough_mail.dart';

class AuthService {
  static Future<bool> authenticate({
    required String username,
    required String password,
  }) async {
    final client = ImapClient(isLogEnabled: false);
    try {
      await client.connectToServer('qasid.iitk.ac.in', 993, isSecure: true);
      await client.login(username, password);
      await client.logout();
      return true;
    } on ImapException {
      return false;
    }
  }
}

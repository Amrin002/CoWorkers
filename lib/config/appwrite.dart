import 'package:appwrite/appwrite.dart';

class Appwrite {
  static const projectId = '668290a1002de206a7cf';
  static const endpoint = 'https://cloud.appwrite.io/v1';

  static const databaseId = '6682ad7a0001474ffcc8';
  static const collectionUsers = '6682ae1f002ccf9ea310';
  static const collectionWorkers = '6682ae44002778f7a3b3';
  static const collectionBooking = '6682ae57003280459bf0';
  static const bucketWorker = '6684687800079c4665b0';

  static Client client = Client();
  static late Account account;
  static late Databases databases;

  static init() {
    client
        .setEndpoint(endpoint)
        .setProject(projectId)
        .setSelfSigned(status: true);
    account = Account(client);
    databases = Databases(client);
    databases = Databases(client);
  }

  static String imageURL(String fileId) {
    return '$endpoint/storage/buckets/$bucketWorker/files/$fileId/view?project=$projectId';
  }
}

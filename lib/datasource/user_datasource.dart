import 'package:appwrite/appwrite.dart';
import 'package:coworker_mobile/config/app_log.dart';
import 'package:coworker_mobile/config/appwrite.dart';
import 'package:dartz/dartz.dart';

class UserDatasource {
  static Future<Either<String, Map>> signUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      final resultAuth = await Appwrite.account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      final response = await Appwrite.databases.createDocument(
        databaseId: Appwrite.databaseId,
        collectionId: Appwrite.collectionUsers,
        documentId: resultAuth.$id,
        data: {
          'name': name,
          'email': email,
        },
      );

      Map data = response.data;
      AppLog.success(
        body: data.toString(),
        title: 'User - SignUp',
      );

      return Right(data);
    } catch (e) {
      AppLog.error(
        body: e.toString(),
        title: 'User - SignUp',
      );

      String defaultMessage = 'terjadi suatu masalah';
      String message = defaultMessage;

      if (e is AppwriteException) {
        if (e.code == 409) {
          message = 'Email sudah terdaftar';
        } else {
          message = e.message ?? defaultMessage;
        }
      }
      return Left(message);
    }
  }

  // static Future<Either<String, Map>> signIn(
  //     String email,
  //     String password,
  //     ) async {
  //   try {
  //     final resultAuth = await Appwrite.account.createEmailSession(
  //       email: email,
  //       password: password,
  //     );
  //
  //     final response = await Appwrite.databases.getDocument(
  //       databaseId: Appwrite.databaseId,
  //       collectionId: Appwrite.collectionUsers,
  //       documentId: resultAuth.userId,
  //     );
  //
  //     Map data = response.data;
  //     AppLog.success(
  //       body: data.toString(),
  //       title: 'User - SignIn',
  //     );
  //
  //     return Right(data);
  //   } catch (e) {
  //     AppLog.error(
  //       body: e.toString(),
  //       title: 'User - SignIn',
  //     );
  //
  //     String defaultMessage = 'Terjadi suatu masalah';
  //     String message = defaultMessage;
  //
  //     if (e is AppwriteException) {
  //       if (e.code == 401) {
  //         message = 'Account tidak dikenali';
  //       } else {
  //         message = e.message ?? defaultMessage;
  //       }
  //     }
  //
  //     return Left(message);
  //   }
  // }
// chat gpt punya
  static Future<Either<String, Map>> signIn(
      String email,
      String password,
      ) async {
    try {
      final response = await Appwrite.databases.listDocuments(
        databaseId: Appwrite.databaseId,
        collectionId: Appwrite.collectionUsers,
        queries: [
          Query.equal('email', email),
          Query.equal('password', password),
        ],
      );

      if (response.documents.isEmpty) {
        return const Left('Account tidak dikenali');
      }

      Map data = response.documents[0].data;
      AppLog.success(
        body: data.toString(),
        title: 'User - SignIn',
      );

      return Right(data);
    } catch (e) {
      AppLog.error(
        body: e.toString(),
        title: 'User - SignIn',
      );

      String defaultMessage = 'Terjadi suatu masalah';
      String message = defaultMessage;

      if (e is AppwriteException) {
        message = e.message ?? defaultMessage;
      }

      return Left(message);
    }
  }
}

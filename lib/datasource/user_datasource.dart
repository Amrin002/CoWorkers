// import 'package:appwrite/appwrite.dart';
// import 'package:coworker_mobile/config/app_log.dart';
// import 'package:coworker_mobile/config/appwrite.dart';
// import 'package:dartz/dartz.dart';
//
// class UserDatasource {
//   static Future<Either<String, Map>> signUp(String name,
//       String email,
//       String password,) async {
//     try {
//       final resultAuth = await Appwrite.account.create(
//         userId: ID.unique(),
//         email: email,
//         password: password,
//       );
//       final response = await Appwrite.databases.createDocument(
//         databaseId: Appwrite.databaseId,
//         collectionId: Appwrite.collectionUsers,
//         documentId: resultAuth.$id,
//         data: {
//           'name': name,
//           'email': email,
//         },
//       );
//
//       Map data = response.data;
//       AppLog.success(
//         body: data.toString(),
//         title: 'User - SignUp',
//       );
//
//       return Right(data);
//     } catch (e) {
//       AppLog.error(
//         body: e.toString(),
//         title: 'User - SignUp',
//       );
//
//       String defaultMessage = 'terjadi suatu masalah';
//       String message = defaultMessage;
//
//       if (e is AppwriteException) {
//         if (e.code == 409) {
//           message = 'Email sudah terdaftar';
//         } else {
//           message = e.message ?? defaultMessage;
//         }
//       }
//       return Left(message);
//     }
//   }
//
//   static Future<Either<String, Map>> signIn(String email,
//       String password,) async {
//     try {
//       final resultAuth = await Appwrite.account.createEmailPasswordSession(
//         email: email,
//         password: password,
//       );
//
//       final response = await Appwrite.databases.getDocument(
//         databaseId: Appwrite.databaseId,
//         collectionId: Appwrite.collectionUsers,
//         documentId: resultAuth.userId,
//       );
//
//       Map data = response.data;
//       AppLog.success(
//         body: data.toString(),
//         title: 'User - SignIn',
//       );
//
//       return Right(data);
//     } catch (e) {
//       AppLog.error(
//         body: e.toString(),
//         title: 'User - SignIn',
//       );
//
//       String defaultMessage = 'Terjadi suatu masalah';
//       String message = defaultMessage;
//
//       if (e is AppwriteException) {
//         if (e.code == 401) {
//           message = 'Account tidak dikenali';
//         } else {
//           message = e.message ?? defaultMessage;
//         }
//       }
//
//       return Left(message);
//     }
//   }
// }


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

      String defaultMessage = 'Terjadi suatu masalah';
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

  static Future<Either<String, Map>> signIn(
      String email,
      String password,
      ) async {
    try {
      final resultAuth = await Appwrite.account.createEmailPasswordSession(
        email: email,
        password: password,
      );

      final response = await Appwrite.databases.getDocument(
        databaseId: Appwrite.databaseId,
        collectionId: Appwrite.collectionUsers,
        documentId: resultAuth.userId,
      );

      Map data = response.data;
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
        if (e.code == 401) {
          message = 'Account tidak dikenali';
        } else {
          message = e.message ?? defaultMessage;
        }
      }

      return Left(message);
    }
  }

  static Future<Either<String, Map>> updateAccount(
      String userId,
      String name,
      String email,
      String password,
      ) async {
    try {
      // Update user info in the database
      final response = await Appwrite.databases.updateDocument(
        databaseId: Appwrite.databaseId,
        collectionId: Appwrite.collectionUsers,
        documentId: userId,
        data: {
          'name': name,
          'email': email,
        },
      );

      // Optionally update the user's email and password
      if (email.isNotEmpty) {
        await Appwrite.account.updateEmail(email: email, password: '');
      }

      if (password.isNotEmpty) {
        await Appwrite.account.updatePassword(password: password);
      }

      Map data = response.data;
      AppLog.success(
        body: data.toString(),
        title: 'User - UpdateAccount',
      );

      return Right(data);
    } catch (e) {
      AppLog.error(
        body: e.toString(),
        title: 'User - UpdateAccount',
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

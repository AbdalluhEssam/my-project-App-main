import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../Check Internet/Check_Internet_Model.dart';
import '../Status Request/Status_Request_model.dart';

class Crud {
  Future<Either<StatusRequest, dynamic>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);

        print("🔵 Response Status Code: ${response.statusCode}");
        print("🟢 Raw Response Body: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            var responseBody = jsonDecode(response.body);

            if (responseBody is List) {
              print("✅ API returned a List");
              return Right(responseBody); // إذا كانت البيانات قائمة، نعيدها كما هي
            } else if (responseBody is Map<String, dynamic>) {
              print("✅ API returned a Map");
              return Right(responseBody); // إذا كانت خريطة، نعيدها كما هي
            } else {
              print("❌ Error: Unknown JSON format. Type: ${responseBody.runtimeType}");
              return const Left(StatusRequest.serverfailure);
            }
          } catch (e) {
            print("❌ JSON Parsing Error: $e");
            return const Left(StatusRequest.serverfailure);
          }
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("❌ Request Error: $e");
      return const Left(StatusRequest.serverfailure);
    }
  }
}


// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(Uri.parse(linkUrl), body: data);
//         print(response.statusCode);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (e) {
//       print("Request Error: $e");
//       return const Left(StatusRequest.serverfailure);
//     }
//   }
// }
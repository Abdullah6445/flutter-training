// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class BitcoinScreen extends StatelessWidget {
//   final BitcoinService bitcoinService = BitcoinService();

//   // Stream to fetch Bitcoin value only when it changes
//   Stream<double> bitcoinStream() async* {
//     double? lastBitcoinValue;

//     while (true) {
//       debugPrint("Checking Bitcoin value...");

//       try {
//         double currentBitcoinValue = await bitcoinService.fetchBitcoinValue();

//         // Only yield the value if it has changed
//         if (lastBitcoinValue == null ||
//             currentBitcoinValue != lastBitcoinValue) {
//           lastBitcoinValue = currentBitcoinValue;
//           debugPrint("=================");
//           debugPrint("changes occured");
//           debugPrint("=================");

//           yield currentBitcoinValue;
//         }
//       } catch (e) {
//         debugPrint('Error fetching Bitcoin value: $e');
//       }

//       // Add delay between checks (adjust as needed)
//       await Future.delayed(Duration(seconds: 10)); // Check every 10 seconds
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Live Bitcoin Value')),
//       body: StreamBuilder<double>(
//         stream: bitcoinStream(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             double bitcoinValue = snapshot.data!;
//             return Center(
//               child: Text(
//                 'Current Bitcoin Price: \$${bitcoinValue.toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 24),
//               ),
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }

// class BitcoinService {
//   final String apiKey = "929f3b6b-19f6-4339-9fa6-8c42893b0f02";
//   final String url =
//       'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

//   Future<double> fetchBitcoinValue() async {
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'X-CMC_PRO_API_KEY': apiKey,
//         'Accept': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       double bitcoinValue = data['data'][0]['quote']['USD']['price'];
//       return bitcoinValue;
//     } else {
//       throw Exception('Failed to load Bitcoin value');
//     }
//   }
// }

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide PaymentIntent;
import 'package:payment_gateway_learn/core/networking/api_service.dart';
import 'package:payment_gateway_learn/features/checkout/imports.dart';

import '../standards/init_payment_sheet_params.dart';

class StripeHelper {
  final ApiService apiService = ApiService();

  Future<String?> createCustomer() async {
    try {
      final response = await apiService.post(
        url: 'https://api.stripe.com/v1/customers',
        data: {'description': 'New Customer from Flutter Store', 'email': 'customer@example.com', 'name': 'Flutter Store Customer'},
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        return response.data['id'];
      } else {
        throw Exception('Failed to create customer: ${response.data}');
      }
    } catch (e) {
      log('Error creating customer: $e');
      return null;
    }
  }

  Future<String?> createEphemeralKey(String customerId) async {
    try {
      final response = await apiService.post(
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        data: {'customer': customerId},
        headers: {'Stripe-Version': '2025-09-30.clover', 'Stripe-Account': dotenv.env['ACCOUNT_ID']!},
      );
      if (response.statusCode == 200) {
        return response.data['secret'];
      } else {
        throw Exception('Failed to create ephemeral key: ${response.data}');
      }
    } on DioException catch (e) {
      log('Error creating ephemeral key: ${e.response?.data}');
      return null;
    }
  }

  Future<PaymentIntentModel> _createPaymentIntent(PaymentIntentParams params) async {
    final response = await apiService.post(url: 'https://api.stripe.com/v1/payment_intents', data: params.toMap());
    if (response.statusCode == 200) {
      return PaymentIntentModel.fromMap(response.data);
    } else {
      throw Exception('Failed to create payment intent: ${response.data}');
    }
  }

  Future<PaymentSheetPaymentOption?> _initPaymentSheet(InitPaymentSheetParams params) async {
    return await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: params.paymentIntentClientSecret,
        customerEphemeralKeySecret: params.customerEphemeralKeySecret,
        merchantDisplayName: "Flutter Store Example",
        customerId: params.customerId,
      ),
    );
  }

  Future<PaymentSheetPaymentOption?> _presentPaymentSheet() async {
    return await Stripe.instance.presentPaymentSheet();
  }

  Future<PaymentSheetPaymentOption?> handlePayment(PaymentIntentParams params) async {
    try {
      final ephemeralKey = await createEphemeralKey(params.customerID);
      final paymentIntent = await _createPaymentIntent(params);
      final initParams = InitPaymentSheetParams(
        paymentIntentClientSecret: paymentIntent.clientSecret,
        customerId: paymentIntent.customer,
        customerEphemeralKeySecret: ephemeralKey,
      );
      await _initPaymentSheet(initParams);
      final paymentOption = await _presentPaymentSheet();
      return paymentOption;
    } on StripeException catch (e) {
      throw Exception('${e.error.localizedMessage}');
    } catch (e) {
      throw Exception('Unforeseen error: $e');
    }
  }
}

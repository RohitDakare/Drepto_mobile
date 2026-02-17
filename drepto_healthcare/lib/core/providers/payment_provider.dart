import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/payment.dart';
import 'package:drepto_healthcare/core/repositories/i_payment_repository.dart';

@lazySingleton
class PaymentProvider extends ChangeNotifier {
  final IPaymentRepository _paymentRepository;

  PaymentProvider(this._paymentRepository);

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> createOrder(PaymentRecord paymentRecord) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _paymentRepository.createOrder(paymentRecord);
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> recordTransaction(RazorpayTransaction transaction) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _paymentRepository.recordTransaction(transaction);
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

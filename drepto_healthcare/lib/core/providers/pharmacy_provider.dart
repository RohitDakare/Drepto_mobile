import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/product.dart';
import 'package:drepto_healthcare/core/repositories/i_pharmacy_repository.dart';

@lazySingleton
class PharmacyProvider extends ChangeNotifier {
  final IPharmacyRepository _pharmacyRepository;

  PharmacyProvider(this._pharmacyRepository);

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _pharmacyRepository.getAllProducts();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

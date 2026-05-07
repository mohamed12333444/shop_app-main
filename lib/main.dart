import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'data/sources/product_remote_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/get_products_usecase.dart';
import 'presentation/providers/cart_provider.dart';
import 'presentation/providers/product_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection (Manual Setup for simplicity, can use GetIt in larger apps)
  final remoteSource = ProductRemoteSource();
  final productRepository = ProductRepositoryImpl(remoteSource);
  final getProductsUseCase = GetProductsUseCase(productRepository);

  runApp(
    MultiProvider(
      providers: [
        // Singleton Cart Provider (alive for the entire app lifecycle)
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        // Product Provider
        ChangeNotifierProvider(
          create: (_) => ProductProvider(getProductsUseCase),
        ),
      ],
      child: const ShopApp(),
    ),
  );
}

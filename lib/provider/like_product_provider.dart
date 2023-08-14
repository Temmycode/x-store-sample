import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_ecommerce/provider/like_product_notifier.dart';

final likeProductProvider = StateNotifierProvider<LikeNotifier, List>(
  (_) => LikeNotifier(),
);

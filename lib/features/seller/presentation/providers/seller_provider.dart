import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../../../catalog/data/repositories/catalog_repository.dart';

part 'seller_provider.g.dart';

@riverpod
Future<List<TProductCard>> sellerProducts(Ref ref, String vendorId) async {
  if (AppConfig.useMockData) {
    return _mockSellerProducts;
  }
  final repository = ref.watch(catalogRepositoryProvider);
  return await repository.getProductCards(vendorId: vendorId);
}

const List<TProductCard> _mockSellerProducts = [
  TProductCard(
    id: 'spu_1',
    name: 'Ví da bò sáp thủ công Classic',
    slug: 'vi-da-bo-sap-thu-cong-classic',
    price: 850000,
    thumbnail:
        'https://images.unsplash.com/photo-1627123424574-724758594e93?w=400',
    vendorName: 'CraftWoodStudio',
  ),
  TProductCard(
    id: 'spu_2',
    name: 'Bình giữ nhiệt Titan 750ml Matte Black',
    slug: 'binh-giu-nhiet-titan-750ml',
    price: 420000,
    thumbnail:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400',
    vendorName: 'CraftWoodStudio',
  ),
  TProductCard(
    id: 'spu_3',
    name: 'Set Tinh dầu thiên nhiên Relax Organics',
    slug: 'set-tinh-dau-thien-nhien-relax',
    price: 350000,
    thumbnail:
        'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=400',
    vendorName: 'CraftWoodStudio',
  ),
  TProductCard(
    id: 'spu_4',
    name: 'Khay để bàn bằng gỗ sồi tự nhiên',
    slug: 'khay-de-ban-go-soi-tu-nhien',
    price: 450000,
    thumbnail:
        'https://images.unsplash.com/photo-1544816155-12df9643f363?w=400',
    vendorName: 'CraftWoodStudio',
  ),
];

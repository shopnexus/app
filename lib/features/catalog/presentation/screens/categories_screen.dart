import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/catalog_provider.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tất cả danh mục',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0F172A),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: categoriesState.when(
        data: (categories) {
          // Lọc ra các danh mục gốc (không có parentId)
          final rootCategories = categories
              .where((c) => c.parentId == null)
              .toList();

          if (rootCategories.isEmpty) {
            return const Center(
              child: Text(
                'Chưa có danh mục nào được khởi tạo.',
                style: TextStyle(fontFamily: 'Inter', color: Color(0xFF64748B)),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            itemCount: rootCategories.length,
            itemBuilder: (context, index) {
              final parent = rootCategories[index];
              // Lọc ra danh mục con của danh mục gốc này
              final children = categories
                  .where((c) => c.parentId == parent.id)
                  .toList();

              if (children.isEmpty) {
                // Nếu không có danh mục con, hiển thị dạng dòng List Tile đơn giản
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 4.0,
                    ),
                    title: Text(
                      parent.name,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Color(0xFF64748B),
                    ),
                    onTap: () {
                      ref.read(activeSearchFiltersProvider.notifier).reset();
                      ref
                          .read(activeSearchFiltersProvider.notifier)
                          .setCategory(parent.id);
                      context.push('/search');
                    },
                  ),
                );
              }

              // Nếu có danh mục con, hiển thị dạng ExpansionTile
              return Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 4.0,
                    ),
                    title: Text(
                      parent.name,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    childrenPadding: const EdgeInsets.only(bottom: 12.0),
                    children: [
                      // Thêm một tùy chọn "Tất cả sản phẩm trong danh mục này"
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                        ),
                        title: Text(
                          'Tất cả ${parent.name}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B),
                            fontSize: 14,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: Color(0xFF94A3B8),
                        ),
                        onTap: () {
                          ref
                              .read(activeSearchFiltersProvider.notifier)
                              .reset();
                          ref
                              .read(activeSearchFiltersProvider.notifier)
                              .setCategory(parent.id);
                          context.push('/search');
                        },
                      ),
                      const Divider(
                        height: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFF1F5F9),
                      ),
                      ...children.map((child) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                              ),
                              title: Text(
                                child.name,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0F172A),
                                  fontSize: 14,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: Color(0xFF94A3B8),
                              ),
                              onTap: () {
                                ref
                                    .read(activeSearchFiltersProvider.notifier)
                                    .reset();
                                ref
                                    .read(activeSearchFiltersProvider.notifier)
                                    .setCategory(child.id);
                                context.push('/search');
                              },
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 56.0,
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            );
          },
        ),
        error: (err, stack) => Center(
          child: Text(
            'Lỗi xảy ra khi tải danh mục: $err',
            style: const TextStyle(fontFamily: 'Inter', color: Colors.red),
          ),
        ),
      ),
    );
  }
}

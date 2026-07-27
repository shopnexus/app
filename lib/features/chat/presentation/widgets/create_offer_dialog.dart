import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MockOfferProduct {
  final String id;
  final String title;
  final double price;
  final String image;

  const MockOfferProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}

class CreateOfferDialog extends StatefulWidget {
  final double initialPrice;
  final String? productId;
  final String? productTitle;
  final String? productImage;

  const CreateOfferDialog({
    super.key,
    this.initialPrice = 0.0,
    this.productId,
    this.productTitle,
    this.productImage,
  });

  static const List<MockOfferProduct> availableProducts = [
    MockOfferProduct(
      id: 'prod_leather_bag',
      title: 'Vintage Leather Messenger Bag',
      price: 420.0,
      image:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA79RdwijKBvGEHRxJYD_v0V9vughKGtFmqG2rooyupMMWVboduiLjPcXLASCqAwDjS7FlqfZBqh2USpPc0KhjV59VsL5KQzky1L1cocYSmfSgep1aLtOBut71rNNV-UjRsqJfCNJPvk-rC7qOmqCpxGBhi_556Erbq9meDm2VNpSOcwhXLJgIrRuGmLvZ9MKVW6K-S3wtxo0N4WTsnHO7HiDQSzIcAGwzzN6sFjIZjtCU-YuCBM3bfIraDRBvQu0uVN1o',
    ),
    MockOfferProduct(
      id: 'prod_ceramic_mug',
      title: 'Minimalist Ceramic Mug Set',
      price: 65.0,
      image:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCHaoLizXNur5_zZkemA_-2eSftqt-TIXARCPBt9cIzwLv95A5ZpyVVVk8EZVhRCnWebRqR0oJ7qt2L6JIrOULI8d2_kin4txIN3bq10Wj_KlU-7O603yY7YKbvm1Rjd8A8o2Azv0iVnPrExa6JAqP-6NHElULa33MyELHFj4E02XZNDmd5ipUhdBT9B3zSs1rag0TeLeCngJQMsW0ZauG0YDlSsCqtAiKrBasHg879wle6B_KxJWayow',
    ),
    MockOfferProduct(
      id: 'prod_armchair',
      title: 'Handmade Vintage Leather Armchair',
      price: 550.0,
      image:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAlzJwIkTsDAFXNeSgAuaDIIFSYRRcXJNmgaLcq7x5fL2U08yNSo_Tc5svBtca0KR9mydqyszAaPJPBRy8_Owku5VtCbNhCXGuyY6TVEUTn3xsumrJyF4kyOHSqp4dHPS0c5lnd53Xyft1IFIfnMybusIjc8Pyle0I9r0kafsHBS-_EGcsccYZb9zxCUzR-f_4PXlsaLfPbvTNUqnzMvP5DtkwYNd3EcYsf6sg3tQEOptj1Z4drnHdpAQ',
    ),
  ];

  @override
  State<CreateOfferDialog> createState() => _CreateOfferDialogState();
}

class _CreateOfferDialogState extends State<CreateOfferDialog> {
  late TextEditingController _priceController;
  late TextEditingController _noteController;
  final _formKey = GlobalKey<FormState>();

  late MockOfferProduct _selectedProduct;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();

    // Tìm sản phẩm được chọn mặc định hoặc dùng sản phẩm đầu tiên
    _selectedProduct = CreateOfferDialog.availableProducts.firstWhere(
      (p) => p.id == widget.productId || p.title == widget.productTitle,
      orElse: () => MockOfferProduct(
        id: widget.productId ?? 'prod_custom',
        title: widget.productTitle ?? 'Vintage Leather Messenger Bag',
        price: 420.0,
        image:
            widget.productImage ??
            CreateOfferDialog.availableProducts.first.image,
      ),
    );

    final defaultPrice = widget.initialPrice > 0
        ? widget.initialPrice
        : (_selectedProduct.price * 0.9); // Mặc định giảm ~10%

    _priceController = TextEditingController(
      text: defaultPrice.toStringAsFixed(2),
    );
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _showProductPicker() {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Product to Make Offer',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 8),
              ...CreateOfferDialog.availableProducts.map(
                (product) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Listing Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: _selectedProduct.id == product.id
                      ? Icon(
                          Icons.check_circle,
                          color: theme.colorScheme.primary,
                        )
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedProduct = product;
                      final suggestedPrice = product.price * 0.9;
                      _priceController.text = suggestedPrice.toStringAsFixed(2);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );

    final enteredPrice = double.tryParse(_priceController.text) ?? 0.0;
    final totalPrice = enteredPrice * _quantity;
    final discountPercent =
        _selectedProduct.price > 0 && enteredPrice < _selectedProduct.price
        ? (((_selectedProduct.price - enteredPrice) / _selectedProduct.price) *
                  100)
              .toStringAsFixed(1)
        : null;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Dialog
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Make an Offer',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Card xem trước Sản Phẩm & Nút Đổi Sản Phẩm
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant.withValues(
                        alpha: 0.4,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: _selectedProduct.image,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedProduct.title,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Listing: ${currencyFormatter.format(_selectedProduct.price)}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: OutlinedButton.icon(
                          onPressed: _showProductPicker,
                          icon: const Icon(Icons.swap_horiz_rounded, size: 18),
                          label: const Text('Change Product'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: theme.colorScheme.outline.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Giá đề nghị mỗi đơn vị
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: 'Offer Unit Price (\$)',
                    hintText: 'e.g. 380.00',
                    prefixText: '\$ ',
                    suffixText: discountPercent != null
                        ? '-$discountPercent%'
                        : null,
                    suffixStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter an offer price';
                    }
                    final parsed = double.tryParse(value);
                    if (parsed == null || parsed <= 0) {
                      return 'Enter a valid price > 0';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Bộ chọn số lượng (Quantity Selector)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.outlineVariant.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 18),
                            onPressed: _quantity > 1
                                ? () => setState(() => _quantity--)
                                : null,
                            padding: const EdgeInsets.all(6),
                            constraints: const BoxConstraints(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '$_quantity',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, size: 18),
                            onPressed: () => setState(() => _quantity++),
                            padding: const EdgeInsets.all(6),
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Ghi chú đề nghị
                TextFormField(
                  controller: _noteController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Offer Note (Optional)',
                    hintText: 'e.g. I can pay immediately via ShopNexus Wallet',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tổng số tiền đề nghị
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Proposed Value:',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        currencyFormatter.format(totalPrice),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Action Button: Send Offer
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final price = double.parse(_priceController.text);
                        final note = _noteController.text.trim();
                        Navigator.of(context).pop({
                          'price': price,
                          'quantity': _quantity,
                          'note': note.isNotEmpty ? note : null,
                          'productId': _selectedProduct.id,
                          'productTitle': _selectedProduct.title,
                          'productImage': _selectedProduct.image,
                          'productPrice': _selectedProduct.price,
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Send Offer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

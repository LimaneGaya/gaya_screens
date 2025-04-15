// translations.dart (Keep the previous version)
import 'package:flutter/material.dart';

// Simple locale representation for this example
enum AppLocale { en, ar }

class Translations {
  // --- Language Maps ---
  static Map<String, String> get en => {
        'fikriStore': 'Fikri Store',
        'products': 'Products',
        'searchHint': 'Search or Press \'/\' for commands',
        'productTitle': 'Macbook Pro 14 Inch 512GB M1 Pro',
        'skuPrefix': 'SKU',
        'createdDate': 'Created 30 Jan 2024',
        'lastUpdated': 'Last Updated Yesterday',
        'active': 'Active',
        'duplicate': 'Duplicate',
        'shareProducts': 'Share Products',
        'productCount': 'Product {current} out of {total}', // Placeholder usage
        'stock': 'Stock',
        'onHandStock': 'On hand stock',
        'reorder': 'Reorder',
        'mainWarehouse': 'Main warehouse',
        'reorderMethod': 'Reorder method',
        'purchaseOrder': 'Purchase order',
        'vendor': 'Vendor',
        'appleStore': 'Apple Store', // Example Vendor Name (EN)
        'quantity': 'Quantity',
        'reorderPoint': 'Reorder point',
        'setReorderPoint': '+Set reorder point',
        'continueSelling': 'Continue selling when out of stock',
        'addLocation': '+Add location',
        'shipping': 'Shipping',
        'shippingDescription':
            'Eu enim erat facilisi viverra non nisl. Scelerisque a malesuada facilisi aliquet consectetur. Eu enim erat facilisi viverra non nisl.',
        'physicalProduct': 'Physical product',
        'digitalProduct': 'Digital product or service',
        'weight': 'Weight',
        'length': 'Length',
        'height': 'Height',
        'unit': 'Unit',
        'kg': 'Kilogram (kg)',
        'cm': 'Centimeter (cm)',
        'shipInternationally': 'This product ship internationaly', // Typo kept from image
        'productOrganization': 'Product Organization',
        // 'sku': 'SKU', // Reusing skuPrefix
        'channel': 'Channel',
        'addChannel': '+', // Assuming '+' is universal
        'category': 'Category',
        'laptop': 'Laptop',
        'type': 'Type',
        'electronic': 'Electronic',
        // 'vendor': 'Vendor', // Reused
        'selectVendor': 'Select vendor',
        'tags': 'Tags',
        'tagApple': 'Apple',
        'tagMacbook': 'Macbook',
        'tagLaptop': 'Laptop', // Reusing 'laptop'
        'tagWorkspace': 'Workspace',
        'totalSales': 'Total sales',
        'totalSalesValue': '\$840.00', // Specific EN value
        'salesChange': '+1.34% vs last month',
         'vsLastMonth': 'vs last month',
      };

  static Map<String, String> get ar => {
        'fikriStore': 'متجر فكري',
        'products': 'المنتجات',
        'searchHint': 'ابحث أو اضغط \'/\' للأوامر',
        'productTitle': 'ماك بوك برو 14 بوصة 512 جيجابايت M1 برو', // Example Name (AR)
        'skuPrefix': 'رمز SKU',
        'createdDate': 'أنشئ في 30 يناير 2024',
        'lastUpdated': 'آخر تحديث بالأمس',
        'active': 'نشط',
        'duplicate': 'تكرار',
        'shareProducts': 'مشاركة المنتجات',
        'productCount': 'المنتج {current} من أصل {total}', // Placeholder usage
        'stock': 'المخزون',
        'onHandStock': 'المخزون المتوفر',
        'reorder': 'إعادة الطلب',
        'mainWarehouse': 'المستودع الرئيسي',
        'reorderMethod': 'طريقة إعادة الطلب',
        'purchaseOrder': 'أمر شراء',
        'vendor': 'المورد',
        'appleStore': 'متجر أبل', // Example Vendor Name (AR)
        'quantity': 'الكمية',
        'reorderPoint': 'نقطة إعادة الطلب',
        'setReorderPoint': '+تعيين نقطة إعادة الطلب',
        'continueSelling': 'الاستمرار في البيع عند نفاد المخزون',
        'addLocation': '+إضافة موقع',
        'shipping': 'الشحن',
        'shippingDescription':
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.', // Example Arabic description
        'physicalProduct': 'منتج مادي',
        'digitalProduct': 'منتج رقمي أو خدمة',
        'weight': 'الوزن',
        'length': 'الطول',
        'height': 'الارتفاع',
        'unit': 'الوحدة',
        'kg': 'كيلوجرام (كجم)',
        'cm': 'سنتيمتر (سم)',
        'shipInternationally': 'هذا المنتج يُشحن دوليًا',
        'productOrganization': 'تنظيم المنتج',
        // 'sku': 'رمز SKU', // Reusing skuPrefix
        'channel': 'القناة',
        'addChannel': '+', // Assuming '+' is universal
        'category': 'الفئة',
        'laptop': 'لابتوب',
        'type': 'النوع',
        'electronic': 'إلكتروني',
        // 'vendor': 'المورد', // Reused
        'selectVendor': 'اختر المورد',
        'tags': 'الوسوم',
        'tagApple': 'أبل',
        'tagMacbook': 'ماك بوك',
        'tagLaptop': 'لابتوب', // Reusing 'laptop'
        'tagWorkspace': 'مساحة عمل',
        'totalSales': 'إجمالي المبيعات',
        'totalSalesValue': '115,000 د.ج', // Specific AR value (approximate DZD)
        'salesChange': '+1.34% مقارنة بالشهر الماضي',
        'vsLastMonth': 'مقارنة بالشهر الماضي',
      };

  // --- Getter Function ---
  static String getString(String key, AppLocale locale) {
    final map = locale == AppLocale.ar ? ar : en;
    return map[key] ??
        en[key] ??
        key; // Fallback to English, then to the key itself
  }

    // Helper for formatted strings like product count
  static String getFormattedString(String key, AppLocale locale, Map<String, String> replacements) {
    String template = getString(key, locale);
    replacements.forEach((placeholder, value) {
      template = template.replaceAll('{$placeholder}', value);
    });
    return template;
  }
}

// --- Simple Line Painter (Keep the previous version) ---
class SimpleLinePainter extends CustomPainter {
  final AppLocale locale;

  SimpleLinePainter({required this.locale});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange // Graph line color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    // Simple placeholder path - adjust points as needed for a better look
    path.moveTo(0, size.height * 0.6);
    path.lineTo(size.width * 0.2, size.height * 0.7);
    path.lineTo(size.width * 0.4, size.height * 0.5);
    path.lineTo(size.width * 0.6, size.height * 0.6);
    path.lineTo(size.width * 0.8, size.height * 0.3);
    path.lineTo(size.width * 0.95, size.height * 0.2); // End point slightly before edge

    canvas.drawPath(path, paint);

     // Optional: Draw a dashed line for the axis/baseline
    final dashPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    double dashWidth = 4, dashSpace = 4;
    double startX = 0;
    final y = size.height * 0.85; // Position baseline lower
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), dashPaint);
      startX += dashWidth + dashSpace;
    }
  }
   @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
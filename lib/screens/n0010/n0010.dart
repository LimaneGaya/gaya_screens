import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/n0010/translation.dart';
import 'package:gaya_screens/screens/screen_shot.dart';

class N0010 extends StatefulWidget {
  // You could pass an initial locale if needed from outside
  // final AppLocale initialLocale;
  // const ProductDetailScaffold({super.key, this.initialLocale = AppLocale.en});

  const N0010({super.key}); // Simple constructor

  @override
  State<N0010> createState() => _ProductDetailScaffoldState();
}

class _ProductDetailScaffoldState extends State<N0010> {
  // Internal state for managing the locale
  AppLocale _currentLocale = AppLocale.en; // Default to English

  // Method to switch the locale
  void _switchLocale() {
    setState(() {
      _currentLocale = (_currentLocale == AppLocale.en) ? AppLocale.ar : AppLocale.en;
    });
  }

  // Helper to get translated string easily using the current state's locale
  String t(String key) {
    return Translations.getString(key, _currentLocale);
  }

   // Helper for formatted strings using the current state's locale
  String tf(String key, Map<String, String> replacements) {
    return Translations.getFormattedString(key, _currentLocale, replacements);
  }

  @override
  Widget build(BuildContext context) {
    // Define colors (can be moved outside build if they don't depend on context/theme)
    const Color primaryTextColor = Color(0xFF1A1A1A);
    const Color secondaryTextColor = Color(0xFF6B7280);
    const Color borderColor = Color(0xFFE5E7EB);
    const Color backgroundColor = Color(0xFFF9FAFB); // For Scaffold background/AppBar
    const Color contentBackgroundColor = Colors.white; // For the main card area
    const Color chipBackgroundColor = Color(0xFFF3F4F6);
    const Color activeColor = Color(0xFF10B981);
    const Color iconColor = Color(0xFF6B7280);

    // Apply specific theme overrides for widgets within this Scaffold
    return Theme(
      data: Theme.of(context).copyWith(
        // Override input decoration theme for TextFields and Dropdowns
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          ),
          hintStyle: TextStyle(color: secondaryTextColor, fontSize: 14),
        ),
        // You can override other theme properties here if needed
        // e.g., textTheme, buttonTheme, chipTheme
      ),
      child: ScreenShot(
        widgetName: 'N0010',
        colorBG: backgroundColor,
        languageCode: _currentLocale == AppLocale.en ? 'en' : 'ar',
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: _buildAppBar(context, primaryTextColor, iconColor, borderColor, backgroundColor),
          body: Directionality(
            textDirection: _currentLocale == AppLocale.ar ? TextDirection.rtl : TextDirection.ltr,
            child:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: contentBackgroundColor, 
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: borderColor, width: 1.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftNavigationRail(iconColor, contentBackgroundColor, borderColor),
                     Expanded( 
                       child: Container(
                         color: contentBackgroundColor,
                         child: SingleChildScrollView(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Flexible(
                                 flex: 2,
                                 child: Padding(
                                   padding: const EdgeInsets.all(24.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       _buildProductHeader(context, primaryTextColor, secondaryTextColor, activeColor, borderColor),
                                       const SizedBox(height: 16),
                                       _buildStockSection(context, primaryTextColor, secondaryTextColor, borderColor, contentBackgroundColor),
                                       const SizedBox(height: 16),
                                       _buildMainWarehouseSection(context, primaryTextColor, secondaryTextColor, iconColor, activeColor, borderColor, contentBackgroundColor),
                                       const SizedBox(height: 16),
                                       _buildShippingSection(context, primaryTextColor, secondaryTextColor, borderColor, chipBackgroundColor, iconColor, contentBackgroundColor),
                                     ],
                                   ),
                                 ),
                               ),
                               Container(width: 1, color: borderColor),
                               Flexible(
                                 flex: 1,
                                 child: Padding(
                                   padding: const EdgeInsets.all(24.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       _buildProductOrganizationSection(context, primaryTextColor, secondaryTextColor, borderColor, chipBackgroundColor, iconColor, contentBackgroundColor),
                                       const SizedBox(height: 32),
                                       _buildTotalSalesSection(context, primaryTextColor, secondaryTextColor, activeColor, iconColor),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  // --- AppBar Builder ---
 PreferredSizeWidget _buildAppBar(BuildContext context, Color primaryTextColor, Color iconColor, Color borderColor, Color appBarBackgroundColor) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: primaryTextColor), 
      titleSpacing: 0,
      title: Row(
          children: [
            const CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 16,
                child: Icon(Icons.storefront, color: Colors.white, size: 18)),
            const SizedBox(width: 8),
            Text(t('fikriStore'), style: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 16)),
            Icon(Icons.keyboard_arrow_down, size: 20, color: iconColor),
            VerticalDivider(indent: 10, endIndent: 10, color: borderColor.withValues(alpha: 0.5)),
             Text(t('products'), style: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 16)),
          ],
        ),
      centerTitle: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(color: borderColor, height: 1.0),
      ),
      actions: [
        // Search Bar Placeholder
        Container(
          width: 300,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: TextField( // Use TextField directly here
                  decoration: InputDecoration(
                    hintText: t('searchHint'),
                    // Use hintStyle from Theme, or define specific if needed
                    // hintStyle: TextStyle(color: secondaryTextColor, fontSize: 14),
                    border: InputBorder.none, // Remove TextField border within decorated container
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false, // Container provides background
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(color: primaryTextColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Action Icons
        _buildAppBarIconButton(Icons.notifications_none, iconColor, borderColor),
        const SizedBox(width: 8),
        _buildAppBarIconButton(Icons.chat_bubble_outline, iconColor, borderColor),
        const SizedBox(width: 8),
        // Language Switch Button (Added here as an example)
        IconButton(
          icon: const Icon(Icons.language),
          color: iconColor,
          tooltip: t('switchLanguage'),
          onPressed: _switchLocale, // Call the state's method
        ),
        const SizedBox(width: 8),
        // User Avatar
        Padding(
          padding: EdgeInsets.only(right: _currentLocale == AppLocale.ar ? 0 : 16.0, left: _currentLocale == AppLocale.ar ? 16.0 : 0),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF4B5563),
            child: Text('FIK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ),
      ],
    );
  }

  // --- All other _build... helper methods remain the same as in the previous response ---
  // Just ensure they use t() and tf() which now refer to the state's locale.
  // Also make sure they use colors passed down or defined at the top of build().
  // Pass `contentBackgroundColor` to helpers that need it for text fields/dropdowns/etc.

  Widget _buildAppBarIconButton(IconData icon, Color iconColor, Color borderColor) {
    // (Keep implementation from previous response)
     return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white, // White background for icons
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: borderColor),
      ),
      child: Stack( // Stack for notification badge
        alignment: Alignment.center,
        children: [
          Icon(icon, color: iconColor, size: 20),
          if (icon == Icons.notifications_none) // Add badge only to notification icon
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1)
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeftNavigationRail(Color iconColor, Color navRailBackgroundColor, Color borderColor) {
     // (Keep implementation from previous response, ensuring locale checks for border/radius)
      return Container(
      width: 64,
      height: double.infinity, // Take full height within the Row
      padding: const EdgeInsets.symmetric(vertical: 20.0),
       decoration: BoxDecoration(
        color: navRailBackgroundColor, // Use the content background color
        border: Border(
          right: _currentLocale == AppLocale.en ? BorderSide(color: borderColor, width: 1.0) : BorderSide.none,
          left: _currentLocale == AppLocale.ar ? BorderSide(color: borderColor, width: 1.0) : BorderSide.none,
        ),
         borderRadius: _currentLocale == AppLocale.ar
            ? const BorderRadius.only(topRight: Radius.circular(16.0), bottomRight: Radius.circular(16.0))
            : const BorderRadius.only(topLeft: Radius.circular(16.0), bottomLeft: Radius.circular(16.0)),
      ),
      child: Column(
        children: [
          FloatingActionButton(
            onPressed: () {}, mini: true, backgroundColor: Colors.orange, elevation: 1,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 24),
          _buildNavIcon(Icons.home_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.bar_chart_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.shopping_bag_outlined, iconColor, isSelected: true),
          _buildNavIcon(Icons.folder_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.people_alt_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.campaign_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.receipt_long_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.show_chart_outlined, iconColor, isSelected: false),
          const Spacer(),
          _buildNavIcon(Icons.settings_outlined, iconColor, isSelected: false),
          _buildNavIcon(Icons.apps_outlined, iconColor, isSelected: false),
          const Divider(height: 20, thickness: 1, indent: 15, endIndent: 15),
          _buildNavIcon(Icons.chevron_right, iconColor, isSelected: false),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

   Widget _buildNavIcon(IconData icon, Color iconColor, {bool isSelected = false}) {
     // (Keep implementation from previous response)
     return Container(
       margin: const EdgeInsets.symmetric(vertical: 4),
       padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE0E7FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF4F46E5) : iconColor,
        size: 24,
      ),
    );
   }

  Widget _buildProductHeader(BuildContext context, Color primaryTextColor, Color secondaryTextColor, Color activeColor, Color borderColor) {
     // (Keep implementation from previous response)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
            mainAxisAlignment: MainAxisAlignment.end,
           children: [
             TextButton(onPressed: () {}, child: Text(t('duplicate'), style: TextStyle(color: primaryTextColor, fontSize: 14, fontWeight: FontWeight.w500))),
             const SizedBox(width: 8),
             TextButton(onPressed: () {}, child: Text(t('shareProducts'), style: TextStyle(color: primaryTextColor, fontSize: 14, fontWeight: FontWeight.w500))),
             const SizedBox(width: 16),
             Container( width: 36, height: 28, decoration: BoxDecoration( color: Colors.white, shape: BoxShape.circle, border: Border.all(color: borderColor), ), child: Icon(Icons.chevron_left, color: secondaryTextColor, size: 24), ),
             const SizedBox(width: 8),
             Container( width: 36, height: 28, decoration: BoxDecoration( color: Colors.white, shape: BoxShape.circle, border: Border.all(color: borderColor), ), child: Icon(Icons.chevron_right, color: secondaryTextColor, size: 24), ),
           ],
         ),
         const SizedBox(height: 8),
         Text( tf('productCount', {'current': '12.567', 'total': '32.068'}), style: TextStyle(color: secondaryTextColor, fontSize: 12), ),
        const SizedBox(height: 8),
        Row( crossAxisAlignment: CrossAxisAlignment.center, children: [ Expanded( child: Text( t('productTitle'), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryTextColor), overflow: TextOverflow.ellipsis, ), ), const SizedBox(width: 16), Container( padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration( color: activeColor.withValues(alpha:0.1), borderRadius: BorderRadius.circular(12), ), child: Row( mainAxisSize: MainAxisSize.min, children: [ Icon(Icons.check_circle, color: activeColor, size: 16), const SizedBox(width: 4), Text(t('active'), style: TextStyle(color: activeColor, fontWeight: FontWeight.w500, fontSize: 12)), ], ), ), const SizedBox(width: 8), Icon(Icons.more_horiz, color: secondaryTextColor), ], ),
        const SizedBox(height: 4),
        Text( '${t('skuPrefix')} MAC-09485  •  ${t('createdDate')}  •  ${t('lastUpdated')}', style: TextStyle(color: secondaryTextColor, fontSize: 12), ),
      ],
    );
  }

  Widget _buildStockSection(BuildContext context, Color primaryTextColor, Color secondaryTextColor, Color borderColor, Color contentBackgroundColor) {
     // (Keep implementation from previous response, pass contentBackgroundColor)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t('stock'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextColor)),
        const SizedBox(height: 16),
        _buildLabeledTextField(
          label: t('onHandStock'),
          initialValue: '30',
          readOnly: true,
          textFieldBackgroundColor: contentBackgroundColor, // Use the card's background
          suffixWidget: Padding(
            padding: const EdgeInsets.only(right: 8.0),
             child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom( side: BorderSide(color: borderColor), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)), ),
              child: Text(t('reorder'), style: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w500)),
            ),
          ),
          primaryTextColor: primaryTextColor,
          secondaryTextColor: secondaryTextColor,
          borderColor: borderColor
        ),
      ],
    );
  }

  Widget _buildMainWarehouseSection(BuildContext context, Color primaryTextColor, Color secondaryTextColor, Color iconColor, Color activeColor, Color borderColor, Color contentBackgroundColor) {
    // (Keep implementation from previous response)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text(t('mainWarehouse'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextColor)), Row( children: [ Switch( value: true, onChanged: (value) {}, activeColor: Colors.white, activeTrackColor: activeColor, inactiveThumbColor: Colors.white, inactiveTrackColor: Colors.grey.shade300, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, ), const SizedBox(width: 8), Icon(Icons.more_horiz, color: iconColor), ], ), ], ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration( color: contentBackgroundColor, borderRadius: BorderRadius.circular(8.0), border: Border.all(color: borderColor), ),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ _buildWarehouseDetailItem(t('reorderMethod'), t('purchaseOrder'), primaryTextColor, secondaryTextColor), _buildWarehouseDetailItem(t('vendor'), t('appleStore'), primaryTextColor, secondaryTextColor), _buildWarehouseDetailItem(t('quantity'), '30', primaryTextColor, secondaryTextColor, isBoldValue: true), Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text(t('reorderPoint'), style: TextStyle(fontSize: 12, color: secondaryTextColor)), const SizedBox(height: 4), TextButton( onPressed: () {}, style: TextButton.styleFrom( padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap, alignment: Alignment.centerLeft ), child: Text(t('setReorderPoint'), style: TextStyle(fontSize: 14, color: const Color(0xFF4F46E5), fontWeight: FontWeight.w500)), ) ], ), ), ], ), const SizedBox(height: 16), Divider(color: borderColor), const SizedBox(height: 16), Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Row( children: [ Checkbox( value: false, onChanged: (value) {}, visualDensity: VisualDensity.compact, side: BorderSide(color: secondaryTextColor), activeColor: const Color(0xFF4F46E5), ), Text(t('continueSelling'), style: TextStyle(fontSize: 14, color: primaryTextColor)), ], ), TextButton( onPressed: () {}, style: TextButton.styleFrom( padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap, ), child: Text(t('addLocation'), style: TextStyle(fontSize: 14, color: const Color(0xFF4F46E5), fontWeight: FontWeight.w500)), ) ], ), ], ),
        ),
      ],
    );
  }

   Widget _buildWarehouseDetailItem(String label, String value, Color primaryTextColor, Color secondaryTextColor, {bool isBoldValue = false}) {
     // (Keep implementation from previous response)
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: secondaryTextColor)),
              const SizedBox(height: 4),
              Text( value, style: TextStyle( fontSize: 14, color: primaryTextColor, fontWeight: isBoldValue ? FontWeight.bold : FontWeight.normal, ), overflow: TextOverflow.ellipsis, ),
            ],
          ),
        ),
      );
   }

  Widget _buildShippingSection(BuildContext context, Color primaryTextColor, Color secondaryTextColor, Color borderColor, Color chipBackgroundColor, Color iconColor, Color contentBackgroundColor) {
    // (Keep implementation from previous response, pass contentBackgroundColor)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t('shipping'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextColor)),
        const SizedBox(height: 8),
        Text( t('shippingDescription'), style: TextStyle(fontSize: 14, color: secondaryTextColor, height: 1.5), ),
        const SizedBox(height: 16),
        Row( children: [ _buildChoiceChip(t('physicalProduct'), Icons.local_shipping_outlined, true, primaryTextColor, chipBackgroundColor, borderColor, iconColor), const SizedBox(width: 12), _buildChoiceChip(t('digitalProduct'), Icons.important_devices_outlined, false, primaryTextColor, chipBackgroundColor, borderColor, iconColor), ], ),
        const SizedBox(height: 20),
        Row( children: [ Expanded( child: _buildLabeledTextField( label: t('weight'), initialValue: '5', textFieldBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ), ), const SizedBox(width: 16), Expanded( child: _buildLabeledDropdown( label: t('unit'), value: t('kg'), items: [t('kg'), 'g', 'lb', 'oz'], onChanged: (value) {}, dropdownBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ), ), ], ),
        const SizedBox(height: 16),
         Row( children: [ Expanded( child: _buildLabeledTextField( label: t('length'), initialValue: '40', textFieldBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ), ), const SizedBox(width: 16), Expanded( child: _buildLabeledDropdown( label: t('unit'), value: t('cm'), items: [t('cm'), 'm', 'in'], onChanged: (value) {}, dropdownBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ), ), ], ),
         const SizedBox(height: 16),
         Row( children: [ Expanded( child: _buildLabeledTextField( label: t('height'), initialValue: '32', textFieldBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ), ), const SizedBox(width: 16), Expanded( child: _buildLabeledDropdown( label: t('unit'), value: t('cm'), items: [t('cm'), 'm', 'in'], onChanged: (value) {}, dropdownBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ), ), ], ),
        const SizedBox(height: 16),
        Row( children: [ Checkbox( value: false, onChanged: (value) {}, visualDensity: VisualDensity.compact, side: BorderSide(color: secondaryTextColor), activeColor: const Color(0xFF4F46E5), ), Text(t('shipInternationally'), style: TextStyle(fontSize: 14, color: primaryTextColor)), ], ),
      ],
    );
  }

  Widget _buildChoiceChip(String label, IconData icon, bool isSelected, Color textColor, Color chipBgColor, Color borderColor, Color iconColor) {
    // (Keep implementation from previous response)
     return ChoiceChip( label: Text(label), selected: isSelected, onSelected: (selected) {}, avatar: Icon(icon, size: 18, color: isSelected ? const Color(0xFF4F46E5) : iconColor), labelStyle: TextStyle( color: isSelected ? const Color(0xFF4F46E5) : textColor, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal, fontSize: 14 ), backgroundColor: chipBgColor, selectedColor: const Color(0xFFE0E7FF), shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8.0), side: BorderSide(color: isSelected ? const Color(0xFFC7D2FE) : borderColor), ), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), showCheckmark: false, );
  }

  Widget _buildProductOrganizationSection(BuildContext context, Color primaryTextColor, Color secondaryTextColor, Color borderColor, Color chipBackgroundColor, Color iconColor, Color contentBackgroundColor) {
    // (Keep implementation from previous response, pass contentBackgroundColor)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t('productOrganization'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextColor)),
        const SizedBox(height: 16),
        _buildLabeledTextField( label: t('skuPrefix'), initialValue: 'MAC-09485', readOnly: true, textFieldBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ),
        const SizedBox(height: 16),
        Text(t('channel'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryTextColor)),
        const SizedBox(height: 8),
        Row( children: [ Chip( avatar: Icon(Icons.storefront, size: 16, color: primaryTextColor), label: Text(t('fikriStore')), backgroundColor: chipBackgroundColor, side: BorderSide(color: borderColor), labelStyle: TextStyle(color: primaryTextColor, fontSize: 13), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, ), const SizedBox(width: 8), Container( width: 32, height: 32, decoration: BoxDecoration( color: chipBackgroundColor, borderRadius: BorderRadius.circular(6.0), border: Border.all(color: borderColor) ), child: Icon(Icons.add, size: 20, color: secondaryTextColor), ) ], ),
        const SizedBox(height: 16),
         _buildLabeledDropdown( label: t('category'), value: t('laptop'), items: [t('laptop'), 'Desktop', 'Accessory'], onChanged: (value) {}, dropdownBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ),
        const SizedBox(height: 16),
        _buildLabeledDropdown( label: t('type'), value: t('electronic'), items: [t('electronic'), 'Software', 'Service'], onChanged: (value) {}, dropdownBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ),
        const SizedBox(height: 16),
        _buildLabeledDropdown( label: t('vendor'), value: null, hint: t('selectVendor'), items: [t('appleStore'), 'Other Vendor'], onChanged: (value) {}, dropdownBackgroundColor: contentBackgroundColor, primaryTextColor: primaryTextColor, secondaryTextColor: secondaryTextColor, borderColor: borderColor ),
         const SizedBox(height: 16),
         Text(t('tags'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryTextColor)),
        const SizedBox(height: 8),
         Wrap( spacing: 8.0, runSpacing: 8.0, children: [ _buildTagChip(t('tagApple'), chipBackgroundColor, primaryTextColor, borderColor, secondaryTextColor), _buildTagChip(t('tagMacbook'), chipBackgroundColor, primaryTextColor, borderColor, secondaryTextColor), _buildTagChip(t('tagLaptop'), chipBackgroundColor, primaryTextColor, borderColor, secondaryTextColor), _buildTagChip(t('tagWorkspace'), chipBackgroundColor, primaryTextColor, borderColor, secondaryTextColor), ], )
      ],
    );
  }

  Widget _buildTagChip(String label, Color bgColor, Color textColor, Color borderColor, Color closeIconColor) {
    // (Keep implementation from previous response)
     return Chip( label: Text(label), onDeleted: () {}, deleteIcon: Icon(Icons.close, size: 14, color: closeIconColor), backgroundColor: bgColor, side: BorderSide(color: borderColor), labelStyle: TextStyle(color: textColor, fontSize: 13), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(6.0), side: BorderSide(color: borderColor), ), );
  }

   Widget _buildTotalSalesSection(BuildContext context, Color primaryTextColor, Color secondaryTextColor, Color positiveChangeColor, Color iconColor) {
     // (Keep implementation from previous response)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row( children: [ Icon(Icons.leaderboard_outlined, color: primaryTextColor, size: 20), const SizedBox(width: 8), Text(t('totalSales'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextColor)), const SizedBox(width: 4), Icon(Icons.info_outline, color: secondaryTextColor, size: 16), ], ),
         const SizedBox(height: 16),
         Text( t('totalSalesValue'), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryTextColor) ),
         const SizedBox(height: 8),
          Row( children: [ Icon(Icons.arrow_upward, size: 16, color: positiveChangeColor), const SizedBox(width: 4), Text( t('salesChange').split(' ').first, style: TextStyle(color: positiveChangeColor, fontWeight: FontWeight.w500, fontSize: 14), ), const SizedBox(width: 4), Text( t('vsLastMonth'), style: TextStyle(color: secondaryTextColor, fontSize: 14), ), ], ),
         const SizedBox(height: 24),
        SizedBox( height: 60, child: CustomPaint( painter: SimpleLinePainter(locale: _currentLocale), size: Size.infinite, ), ),
      ],
    );
   }

  // --- Helper Widgets ---
  Widget _buildLabeledTextField({ required String label, required String initialValue, bool readOnly = false, Widget? suffixWidget, required Color primaryTextColor, required Color secondaryTextColor, required Color borderColor, required Color textFieldBackgroundColor, }) {
    // (Keep implementation from previous response)
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryTextColor)),
        const SizedBox(height: 8),
        SizedBox(
          height: 42,
          child: TextField(
             controller: TextEditingController(text: initialValue),
             readOnly: readOnly,
             style: TextStyle(color: primaryTextColor, fontSize: 14),
             decoration: InputDecoration(
              fillColor: textFieldBackgroundColor, // Use passed background color
              // Use theme's contentPadding
              // border, enabledBorder, focusedBorder comes from Theme
               suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: suffixWidget,
            ),
          ),
        ),
      ],
    );
  }

   Widget _buildLabeledDropdown({ required String label, required String? value, String? hint, required List<String> items, required ValueChanged<String?> onChanged, required Color primaryTextColor, required Color secondaryTextColor, required Color borderColor, required Color dropdownBackgroundColor, }) {
     // (Keep implementation from previous response)
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryTextColor)),
        const SizedBox(height: 8),
        SizedBox(
          height: 42,
          child: DropdownButtonFormField<String>(
            value: value,
            hint: hint != null ? Text(hint /*, style: Theme.of(context).inputDecorationTheme.hintStyle */ ) : null, // Use theme hintStyle
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 14, color: primaryTextColor)),
              );
            }).toList(),
            onChanged: onChanged,
             style: TextStyle(color: primaryTextColor, fontSize: 14),
            icon: Icon(Icons.keyboard_arrow_down, color: secondaryTextColor),
            decoration: InputDecoration(
               fillColor: dropdownBackgroundColor, // Use passed background color
               // Use theme's contentPadding
               // border, enabledBorder, focusedBorder comes from Theme
            ),
            isDense: true,
            dropdownColor: dropdownBackgroundColor,
          ),
        ),
      ],
    );
   }
}
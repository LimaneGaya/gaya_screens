import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/screen_shot.dart';
// No external packages like intl are used, formatting is done manually.

// Localization Data and Function (Updated with names, product, currency, prices)
// -----------------------------------------------------------------------------
const Map<String, Map<String, String>> _localizedStrings = {
  'en': {
    // Original Texts
    'commented_in': 'Commented in',
    'saas_management': 'SaaS Management',
    'saas_product': 'SaaS Product',
    'reply': 'Reply',
    'offer_request': 'Offer Request',
    'offering_number': 'Offering Number',
    'shipping': 'Shipping',
    'vat': 'VAT (12.00%)', // VAT rate might differ, kept as example
    'total': 'Total',
    'location': 'Location',
    'jakarta_indonesia': 'Jakarta, Indonesia', // Location kept same for example
    'meeting_client': 'Meeting Client',
    'collaborate_with': 'Collaborate with',
    'min': 'Min',
    'team_standup': 'Team Standup',
    'design_review': 'Design Review',
    'feedback_session': 'Feedback session with stakeholders',
    'workflow_project': 'Workflow Project',
    'workflow_subtitle':
        'Set up your project workflow for management and efficiency',
    'project_initiation': 'Project Initiation',
    'planning': 'Planning',
    'design': 'Design',
    'development': 'Development',
    'testing': 'Testing',
    'overview': 'Overview',
    'activity': 'Activity',
    'details': 'Details',
    'impressions': 'Impressions',
    'replies': 'Replies',
    'engagements': 'Engagements',
    'new_follows': 'New Follows',
    'likes': 'Likes',
    'repost': 'Repost',
    'invited_you_to': 'invited you to',
    'dashboard_payment': 'Dashboard Payment',
    'new_product': 'New Product',
    'decline': 'Decline',
    'accept': 'Accept',
    'friday': 'Friday',
    'thursday': 'Thursday',

    // New/Modified Texts
    'insan_kamil': 'Jake Smith',
    'john': 'John Doe',
    'attendees_m_j_h':
        'Mike, John, Hannah', // Combined attendees for Meeting/Standup
    'product_name': 'CloudSync Pro',
    'product_code': '#CS-PRO-2024',
    'currency_symbol': '\$',
    'price_shipping': '20.00',
    'price_vat': '79.00',
    'price_total': '1099.00',
  },
  'fr': {
    // Original Texts (Translated)
    'commented_in': 'A commenté dans',
    'saas_management': 'Gestion SaaS',
    'saas_product': 'Produit SaaS',
    'reply': 'Répondre',
    'offer_request': 'Demande d\'offre',
    'offering_number': 'Numéro d\'offre',
    'shipping': 'Livraison',
    'vat': 'TVA (12.00%)', // Example rate
    'total': 'Total',
    'location': 'Lieu',
    'jakarta_indonesia': 'Jakarta, Indonésie',
    'meeting_client': 'Réunion Client',
    'collaborate_with': 'Collaborer avec',
    'min': 'Min',
    'team_standup': 'Réunion d\'équipe',
    'design_review': 'Revue de Conception',
    'feedback_session': 'Session de feedback avec les parties prenantes',
    'workflow_project': 'Projet de Flux de Travail',
    'workflow_subtitle':
        'Configurez le flux de travail de votre projet pour la gestion et l\'efficacité',
    'project_initiation': 'Initiation du Projet',
    'planning': 'Planification',
    'design': 'Conception',
    'development': 'Développement',
    'testing': 'Tests',
    'overview': 'Aperçu',
    'activity': 'Activité',
    'details': 'Détails',
    'impressions': 'Impressions',
    'replies': 'Réponses',
    'engagements': 'Engagements',
    'new_follows': 'Nouveaux Abonnés',
    'likes': 'J\'aime',
    'repost': 'Repartager',
    'invited_you_to': 'vous a invité à',
    'dashboard_payment': 'Tableau de Bord Paiement',
    'new_product': 'Nouveau Produit',
    'decline': 'Refuser',
    'accept': 'Accepter',
    'friday': 'Vendredi',
    'thursday': 'Jeudi',

    // New/Modified Texts (Translated)
    'insan_kamil': 'Lucas Dubois',
    'john': 'Jean Martin',
    'attendees_m_j_h': 'Michel, Jean, Hélène', // Combined attendees
    'product_name': 'SynchroNuage Pro',
    'product_code': '#SN-PRO-2024',
    'currency_symbol': '€',
    'price_shipping': '18.00', // Approx $20
    'price_vat': '71.00', // Approx $79
    'price_total': '989.00', // Approx $1099
  },
  'ar': {
    // Original Texts (Translated)
    'commented_in': 'علق في',
    'saas_management': 'إدارة SaaS',
    'saas_product': 'منتج SaaS',
    'reply': 'رد',
    'offer_request': 'طلب عرض',
    'offering_number': 'رقم العرض',
    'shipping': 'الشحن',
    'vat': 'ضريبة القيمة المضافة (12.00%)', // Example rate
    'total': 'المجموع',
    'location': 'الموقع',
    'jakarta_indonesia': 'جاكرتا، إندونيسيا',
    'meeting_client': 'اجتماع العميل',
    'collaborate_with': 'التعاون مع',
    'min': 'دقيقة',
    'team_standup': 'اجتماع الفريق اليومي',
    'design_review': 'مراجعة التصميم',
    'feedback_session': 'جلسة ملاحظات مع أصحاب المصلحة',
    'workflow_project': 'مشروع سير العمل',
    'workflow_subtitle': 'قم بإعداد سير عمل مشروعك للإدارة والكفاءة',
    'project_initiation': 'بدء المشروع',
    'planning': 'التخطيط',
    'design': 'التصميم',
    'development': 'التطوير',
    'testing': 'الاختبار',
    'overview': 'نظرة عامة',
    'activity': 'النشاط',
    'details': 'التفاصيل',
    'impressions': 'الانطباعات',
    'replies': 'الردود',
    'engagements': 'التفاعلات',
    'new_follows': 'متابعون جدد',
    'likes': 'الإعجابات',
    'repost': 'إعادة النشر',
    'invited_you_to': 'دعاك إلى',
    'dashboard_payment': 'لوحة تحكم الدفع',
    'new_product': 'منتج جديد',
    'decline': 'رفض',
    'accept': 'قبول',
    'friday': 'الجمعة',
    'thursday': 'الخميس',

    // New/Modified Texts (Translated)
    'insan_kamil': 'أحمد منصور',
    'john': 'خالد علي',
    'attendees_m_j_h': 'محمد، جمال، هناء', // Combined attendees
    'product_name': 'مزامنة سحابية برو',
    'product_code': '#MS-PRO-2024',
    'currency_symbol': 'د.ج', // Algerian Dinar symbol
    'price_shipping': '2700', // Approx $20 -> 2700 DZD
    'price_vat': '10700', // Approx $79 -> 10665 DZD -> Rounded 10700
    'price_total': '148000', // Approx $1099 -> 148365 DZD -> Rounded 148000
  },
};

// Translation helper function
String tr(String key, String langCode) {
  // Fallback to English if langCode or key is not found
  return _localizedStrings[langCode]?[key] ??
      _localizedStrings['en']?[key] ??
      key;
}

// Simple Price Formatting Helper
String formatPrice(String amount, String currencySymbol, String langCode) {
  if (langCode == 'ar') {
    // Basic formatting for DZD (right-to-left symbol placement)
    // You might want more sophisticated formatting for thousands separators in a real app
    return '$amount $currencySymbol';
  } else {
    // Default formatting (left-to-right symbol placement)
    return '$currencySymbol$amount';
  }
}
// -----------------------------------------------------------------------------

// Main Screen Widget - Designed to be embedded in an existing app
class N0009 extends StatefulWidget {
  final String languageCode; // Language code ('en', 'fr', 'ar')

  const N0009({super.key, this.languageCode = 'ar'});

  @override
  State<N0009> createState() => _N0009State();
}

class _N0009State extends State<N0009> {

  late final textDirection =
      widget.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    // Apply the theme directly here using the Theme widget
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(
          0xFFF8F9FA,
        ), // Light grey background
        fontFamily: 'Roboto', // Example font, adjust if needed
        cardTheme: CardThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black87,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.black45),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey[600], size: 20.0),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xFF0D6EFD,
            ), // Blue color for primary buttons
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey[700],
            side: BorderSide(color: Colors.grey[300]!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
      ),
      child: Directionality(
        textDirection: textDirection,
        child: Scaffold(
          body: SingleChildScrollView(
            child: ScreenShot(
              widgetName: 'N0009',
              colorBG: const Color(0xFFF8F9FA),
              languageCode: widget.languageCode,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 20,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column Widgets
                        Expanded(
                          flex: 2, // Adjust flex factor as needed
                          child: Column(
                            children: [
                              _CommentCard(languageCode: widget.languageCode),
                              const SizedBox(height: 16),
                              _ProductCard(languageCode: widget.languageCode),
                              const SizedBox(height: 16),
                              _LocationTimerCard(
                                languageCode: widget.languageCode,
                              ),
                              const SizedBox(height: 16),
                              // Use the combined attendees key
                              _MeetingCard(
                                languageCode: widget.languageCode,
                                titleKey: 'meeting_client',
                                time: '02:20 PM - 03:30 PM',
                                descriptionKey: 'collaborate_with',
                                attendeesKey:
                                    'attendees_m_j_h', // Use combined key
                                duration: 80,
                                avatarUrls: const [
                                  // Using Picsum with seeds
                                  'https://picsum.photos/seed/M/40/40',
                                  'https://picsum.photos/seed/J/40/40',
                                  'https://picsum.photos/seed/H/40/40',
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Use the combined attendees key
                              _MeetingCard(
                                languageCode: widget.languageCode,
                                titleKey: 'team_standup',
                                time: '09:00 AM - 09:30 AM',
                                descriptionKey: 'collaborate_with',
                                attendeesKey:
                                    'attendees_m_j_h', // Use combined key
                                duration: 30,
                                avatarUrls: const [
                                  // Different seeds
                                  'https://picsum.photos/seed/M2/40/40',
                                  'https://picsum.photos/seed/J2/40/40',
                                  'https://picsum.photos/seed/H2/40/40',
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Feedback session doesn't list specific names in the original
                              _MeetingCard(
                                languageCode: widget.languageCode,
                                titleKey: 'design_review',
                                time: '10:00 AM - 11:00 AM',
                                descriptionKey: 'feedback_session',
                                attendeesKey:
                                    '', // No specific attendees key needed here
                                duration: 60,
                                avatarUrls: const [
                                  // Stakeholder seeds
                                  'https://picsum.photos/seed/S1/40/40',
                                  'https://picsum.photos/seed/S2/40/40',
                                  'https://picsum.photos/seed/S3/40/40',
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16), // Space between columns
                        // Right Column Widgets
                        Expanded(
                          flex: 3, // Adjust flex factor as needed
                          child: Column(
                            children: [
                              _WorkflowProjectCard(
                                languageCode: widget.languageCode,
                              ),
                              const SizedBox(height: 16),
                              _AnalyticsCard(
                                languageCode: widget.languageCode,
                              ),
                              const SizedBox(height: 16),
                              _InvitationCard(
                                languageCode: widget.languageCode,
                              ),
                            ],
                          ),
                        ),
                      ],
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
}

class _CommentCard extends StatelessWidget {
  final String languageCode;
  const _CommentCard({required this.languageCode});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/${tr('insan_kamil', languageCode)}/96/96',
                      ), // Seed with name
                      backgroundColor: Colors.grey[300],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // Use Wrap for better flexibility if needed
                        children: [
                          Text(
                            tr('insan_kamil', languageCode), // Translated Name
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tr('commented_in', languageCode),
                            style: textTheme.bodySmall?.copyWith(fontSize: 13),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tr('saas_management', languageCode),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            '${tr('friday', languageCode)} 3:12 PM',
                            style: textTheme.bodySmall,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            tr('saas_product', languageCode),
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                // User content - kept in English
                'Really love this appproach. I think this is the best solution for the document for sync Automation issue.',
                style: TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.reply, size: 18),
                label: Text(tr('reply', languageCode)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Product Card Widget
class _ProductCard extends StatelessWidget {
  final String languageCode;
  const _ProductCard({required this.languageCode});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final currencySymbol = tr('currency_symbol', languageCode);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos/seed/${tr('product_name', languageCode)}/60/60', // Seed with product name
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: Icon(Icons.image_not_supported),
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(
                          'product_name',
                          languageCode,
                        ), // Translated Product Name
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tr(
                          'product_code',
                          languageCode,
                        ), // Translated Product Code
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.sell_outlined, size: 18),
                  label: Text(tr('offer_request', languageCode)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3DFFF),
                    foregroundColor: const Color(0xFF5A4FFC),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            _buildPriceRow(context, tr('offering_number', languageCode), '-'),
            const SizedBox(height: 8),
            // Use translated prices and currency symbol
            _buildPriceRow(
              context,
              tr('shipping', languageCode),
              formatPrice(
                tr('price_shipping', languageCode),
                currencySymbol,
                languageCode,
              ),
            ),
            const SizedBox(height: 8),
            _buildPriceRow(
              context,
              tr('vat', languageCode),
              formatPrice(
                tr('price_vat', languageCode),
                currencySymbol,
                languageCode,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            _buildPriceRow(
              context,
              tr('total', languageCode),
              formatPrice(
                tr('price_total', languageCode),
                currencySymbol,
                languageCode,
              ),
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final valueStyle =
        isTotal
            ? const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 16,
            )
            : textTheme.bodyMedium?.copyWith(color: Colors.black87);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              isTotal
                  ? textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  )
                  : textTheme.bodyMedium,
        ),
        Text(value, style: valueStyle),
      ],
    );
  }
}

// Location and Timer Card (No language-specific changes needed here besides text)
class _LocationTimerCard extends StatelessWidget {
  final String languageCode;
  const _LocationTimerCard({required this.languageCode});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('location', languageCode), style: textTheme.bodySmall),
                Text(
                  tr('jakarta_indonesia', languageCode),
                  style: textTheme.bodyMedium?.copyWith(color: Colors.black87),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.access_time, size: 18),
                  SizedBox(width: 6),
                  Text(
                    '04:30:40',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_up, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

// Meeting Card Widget (Uses combined attendeesKey)
class _MeetingCard extends StatelessWidget {
  final String languageCode;
  final String titleKey;
  final String time;
  final String descriptionKey;
  final String
  attendeesKey; // Key for the full translated attendee string (e.g., 'attendees_m_j_h') or empty
  final int duration;
  final List<String> avatarUrls;

  const _MeetingCard({
    required this.languageCode,
    required this.titleKey,
    required this.time,
    required this.descriptionKey,
    required this.attendeesKey,
    required this.duration,
    required this.avatarUrls,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr(titleKey, languageCode), style: textTheme.titleMedium),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time_outlined, size: 18),
                const SizedBox(width: 8),
                Text(time, style: textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  width: 70,
                  height: 32,
                  child: Stack(
                    children: List.generate(avatarUrls.length, (index) {
                      return Positioned(
                        left: index * 18.0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(avatarUrls[index]),
                          backgroundColor: Colors.grey[300],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    // If attendeesKey is provided, combine description and attendees, otherwise just show description
                    attendeesKey.isNotEmpty
                        ? '${tr(descriptionKey, languageCode)} ${tr(attendeesKey, languageCode)}'
                        : tr(descriptionKey, languageCode),
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$duration ${tr('min', languageCode)}',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Workflow Project Card (No language-specific changes needed here besides text)
class _WorkflowProjectCard extends StatelessWidget {
  final String languageCode;
  const _WorkflowProjectCard({required this.languageCode});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('workflow_project', languageCode),
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              tr('workflow_subtitle', languageCode),
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            _WorkflowItem(
              languageCode: languageCode,
              titleKey: 'project_initiation',
            ),
            _WorkflowItem(languageCode: languageCode, titleKey: 'planning'),
            _WorkflowItem(languageCode: languageCode, titleKey: 'design'),
            _WorkflowItem(languageCode: languageCode, titleKey: 'development'),
            _WorkflowItem(languageCode: languageCode, titleKey: 'testing'),
          ],
        ),
      ),
    );
  }
}

// Single Workflow Item (No language-specific changes needed here besides text)
class _WorkflowItem extends StatelessWidget {
  final String languageCode;
  final String titleKey;
  const _WorkflowItem({required this.languageCode, required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(Icons.drag_indicator, color: Colors.grey[400]),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                tr(titleKey, languageCode),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 18),
              onPressed: () {},
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(),
              tooltip: 'Edit',
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.delete_outline, size: 18),
              onPressed: () {},
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(),
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}

// Analytics Card (No language-specific changes needed here besides text)
class _AnalyticsCard extends StatelessWidget {
  final String languageCode;
  const _AnalyticsCard({required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                _buildTab(
                  context,
                  tr('overview', languageCode),
                  isSelected: true,
                ),
                _buildTab(context, tr('activity', languageCode)),
                _buildTab(context, tr('details', languageCode)),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2.5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _StatBox(
                  languageCode: languageCode,
                  labelKey: 'impressions',
                  value: '1.4M',
                  percentage: 200,
                ),
                _StatBox(
                  languageCode: languageCode,
                  labelKey: 'replies',
                  value: '2K',
                  percentage: 1000,
                ),
                _StatBox(
                  languageCode: languageCode,
                  labelKey: 'engagements',
                  value: '52.3K',
                  percentage: 120,
                ),
                _StatBox(
                  languageCode: languageCode,
                  labelKey: 'new_follows',
                  value: '200',
                  percentage: 70,
                ),
                _StatBox(
                  languageCode: languageCode,
                  labelKey: 'likes',
                  value: '27K',
                  percentage: 40,
                ),
                _StatBox(
                  languageCode: languageCode,
                  labelKey: 'repost',
                  value: '1,1K',
                  percentage: 1000,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String text, {
    bool isSelected = false,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color:
            isSelected
                ? theme.primaryColor.withValues(alpha:0.1)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? theme.primaryColor : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// Single Stat Box Widget (No language-specific changes needed here besides text)
class _StatBox extends StatelessWidget {
  final String languageCode;
  final String labelKey;
  final String value;
  final int percentage;
  const _StatBox({
    required this.languageCode,
    required this.labelKey,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final String percentageString =
        percentage >= 1000
            ? '${(percentage / 1000).toStringAsFixed(0)}K%'
            : '$percentage%';
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr(labelKey, languageCode),
            style: textTheme.bodySmall?.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      percentageString,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Invitation Card Widget
class _InvitationCard extends StatelessWidget {
  final String languageCode;
  const _InvitationCard({required this.languageCode});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/seed/${tr('john', languageCode)}/80/80',
                  ), // Seed with name
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: '${tr('john', languageCode)} ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ), // Translated name
                        TextSpan(
                          text: '${tr('invited_you_to', languageCode)} ',
                        ),
                        TextSpan(
                          text: tr('dashboard_payment', languageCode),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 52),
              child: Row(
                children: [
                  Text(
                    '${tr('thursday', languageCode)} 2:20 PM',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    tr('new_product', languageCode),
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(tr('decline', languageCode)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(tr('accept', languageCode)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

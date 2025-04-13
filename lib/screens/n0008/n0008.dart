import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// --- Constants for Styling (Keep these as before) ---
const Color _primaryTextColor = Color(0xFF111827);
const Color _secondaryTextColor = Color(0xFF6B7280);
const Color _orangeAccent = Color(0xFFF97316);
const Color _darkBackground = Color(0xFF1F2937);
const Color _lightBackground = Colors.white;
const Color _buttonTextColorLight = Colors.white;
const Color _buttonTextColorDark = Colors.black;
const Color _borderColor = Color(0xFFE5E7EB);

const double _cardPadding = 28.0;
const double _outerPadding = 20.0;
const double _interCardSpacing = 20.0;
const double _featureSpacing = 12.0;

// --- Localization Data (Embedded in the file - NOT recommended for production) ---

// Helper class to access translations
class _AppLocalizations {
  final Locale locale;

  _AppLocalizations(this.locale);

  // Static map holding all translations
  // Keys: string identifiers, Values: Map<languageCode, translation>
  static final Map<String, Map<String, String>> _localizedValues = {
    // Header
    'pricing': {'en': 'Pricing', 'fr': 'Tarification', 'ar': 'التسعير'},
    'simple_plans': {
      'en': 'Simple Plans,\nSeamless Experience',
      'fr': 'Plans Simples,\nExpérience Fluide',
      'ar': 'خطط بسيطة،\nتجربة سلسة', // Note: Arabic reads right-to-left
    },
    'choose_plan_desc': {
      'en':
          'Choose the plan that works for you and enjoy a smooth, transparent\ndesign process from start to finish.',
      'fr':
          'Choisissez le plan qui vous convient et profitez d\'un processus de conception\nfluide et transparent du début à la fin.',
      'ar':
          'اختر الخطة التي تناسبك واستمتع بعملية تصميم سلسة وشفافة\nمن البداية إلى النهاية.',
    },

    // One-Off Card
    'one_off_title': {'en': 'One-Off', 'fr': 'Unique', 'ar': 'مرة واحدة'},
    'one_off_desc': {
      'en': 'A one-time investment for a custom design solution.',
      'fr': 'Investissement pour une solution de design sur mesure.',
      'ar': 'استثمار لمرة واحدة لحل تصميم مخصص.',
    },
    'one_off_price': {
      'en': '\$2,000',
      'fr': '2 000 €',
      'ar': 'د.ج 299,000'}, // Format might vary
    'one_off_period': {'en': '/project', 'fr': '/projet', 'ar': '/مشروع'},
    'one_off_feat1': {
      'en': 'Branding, web, or UI/UX design',
      'fr': 'Image de marque, web, ou design UI/UX',
      'ar': 'علامة تجارية، ويب، أو تصميم واجهة/تجربة المستخدم',
    },
    'one_off_feat2': {
      'en': 'Tailored strategy & creative direction',
      'fr': 'Stratégie sur mesure & direction créative',
      'ar': 'استراتيجية مخصصة وتوجيه إبداعي',
    },
    'one_off_feat3': {
      'en': 'Framer development',
      'fr': 'Développement Framer',
      'ar': 'تطوير Framer',
    },
    'one_off_feat4': {
      'en': 'Seamless handoff & support',
      'fr': 'Transfert et support fluides',
      'ar': 'تسليم ودعم سلس',
    },
    'one_off_feat5': {
      'en': 'Fixed deadline',
      'fr': 'Délai fixe',
      'ar': 'موعد نهائي ثابت',
    },
    'one_off_button': {
      'en': 'Start a project',
      'fr': 'Démarrer un projet',
      'ar': 'ابدأ مشروعًا',
    },

    // Subscription Card
    'subs_title': {'en': 'Subscription', 'fr': 'Abonnement', 'ar': 'اشتراك'},
    'subs_desc': {
      'en': 'Ongoing design support to keep your brand evolving.',
      'fr': 'Support design continu pour faire évoluer votre marque.',
      'ar': 'دعم تصميم مستمر للحفاظ على تطور علامتك التجارية.',
    },
    'subs_price': {'en': '\$1,499', 'fr': '1 499 €', 'ar': 'د.ج 197,268.4'},
    'subs_period': {'en': '/month', 'fr': '/mois', 'ar': '/شهر'},
    'subs_popular': {
      'en': 'Most Popular',
      'fr': 'Le plus populaire',
      'ar': 'الأكثر شيوعًا',
    },
    'subs_feat1': {
      'en': 'New designs & updates every month',
      'fr': 'Nouveaux designs & mises à jour chaque mois',
      'ar': 'تصاميم وتحديثات جديدة كل شهر',
    },
    'subs_feat2': {
      'en': '3 Senior designers',
      'fr': '3 Designers seniors',
      'ar': '3 مصممين كبار',
    },
    'subs_feat3': {
      'en': 'Consistent brand refinement',
      'fr': 'Affinement constant de la marque',
      'ar': 'تحسين مستمر للعلامة التجارية',
    },
    'subs_feat4': {
      'en': 'Fast turnaround & priority support',
      'fr': 'Délai rapide & support prioritaire',
      'ar': 'تنفيذ سريع ودعم ذو أولوية',
    },
    'subs_feat5': {
      'en': 'Pause or cancel anytime',
      'fr': 'Pause ou annulation à tout moment',
      'ar': 'إيقاف مؤقت أو إلغاء في أي وقت',
    },
    'subs_button': {
      'en': 'Subscribe Now',
      'fr': 'S\'abonner',
      'ar': 'اشترك الآن',
    },

    // Need Different Section
    'need_diff_title': {
      'en': 'Need something\ndifferent?',
      'fr': 'Besoin de quelque\nchose de différent ?',
      'ar': 'هل تحتاج شيئًا\nمختلفًا؟',
    },
    'need_diff_desc': {
      'en': 'Let\'s create a plan that works for you.',
      'fr': 'Créons un plan qui fonctionne pour vous.',
      'ar': 'دعنا ننشئ خطة تناسبك.',
    },
    'need_diff_button': {
      'en': 'Book an Intro Call',
      'fr': 'Réserver un appel découverte',
      'ar': 'احجز مكالمة تمهيدية',
    },
    // Language Switcher Buttons
    'lang_en': {'en': 'English', 'fr': 'Anglais', 'ar': 'الإنجليزية'},
    'lang_fr': {'en': 'French', 'fr': 'Français', 'ar': 'الفرنسية'},
    'lang_ar': {'en': 'Arabic', 'fr': 'Arabe', 'ar': 'العربية'},
  };

  String get(String key) {
    return _localizedValues[key]?[locale.languageCode] ??
        _localizedValues[key]?['en'] ??
        '[$key]';
  }
}

class N0008 extends StatefulWidget {
  const N0008({super.key});

  @override
  State<N0008> createState() => _PricingPageState();
}

class _PricingPageState extends State<N0008> {
  Locale _currentLocale = const Locale('en');
  final key = GlobalKey();

  void _changeLanguage(Locale newLocale) {
    setState(() => _currentLocale = newLocale);
    paitScreen();
  }

  void paitScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 2);
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        if (byteData != null) {
          final pngBytes = byteData.buffer.asUint8List();
          File(
            'screenshot ${_currentLocale.languageCode}.png',
          ).writeAsBytes(pngBytes);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = _AppLocalizations(_currentLocale);

    return Directionality(
      textDirection:
          _currentLocale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: RepaintBoundary(
            key: key,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(_outerPadding * 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // --- Language Switcher ---
                    _LanguageSwitcher(
                      currentLocale: _currentLocale,
                      onLocaleChanged: _changeLanguage,
                      localizations:
                          localizations, // Pass localizations for button text
                    ),
                    const SizedBox(height: 20),

                    // --- End Language Switcher ---
                    _PricingHeader(
                      localizations: localizations,
                    ), // Pass localizations
                    const SizedBox(height: 40),
                    LayoutBuilder(
                      // Use LayoutBuilder for potential responsiveness
                      builder: (context, constraints) {
                        // Simple example: Stack vertically on narrow screens
                        bool isNarrow =
                            constraints.maxWidth <
                            750; // Adjust breakpoint as needed

                        if (isNarrow) {
                          // Column layout for narrow screens
                          return Column(
                            mainAxisSize:
                                MainAxisSize
                                    .min, // Prevent column taking infinite height
                            children: [
                              _buildOneOffCard(localizations),
                              const SizedBox(height: _interCardSpacing),
                              _buildSubscriptionCard(localizations),
                            ],
                          );
                        } else {
                          // Row layout for wider screens
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildOneOffCard(localizations)),
                              const SizedBox(width: _interCardSpacing),
                              Expanded(
                                child: _buildSubscriptionCard(localizations),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    _NeedDifferentSection(
                      localizations: localizations,
                    ), // Pass localizations
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper methods to build cards (avoids code duplication in LayoutBuilder)
  Widget _buildOneOffCard(_AppLocalizations localizations) {
    return _PlanCard(
      localizations: localizations, // Pass it down
      titleKey: 'one_off_title',
      descriptionKey: 'one_off_desc',
      price: localizations.get('one_off_price'), // Price might need formatting
      pricePeriodKey: 'one_off_period',
      featureKeys: const [
        'one_off_feat1',
        'one_off_feat2',
        'one_off_feat3',
        'one_off_feat4',
        'one_off_feat5',
      ],
      buttonTextKey: 'one_off_button',
      buttonColor: _primaryTextColor,
      textColor: _primaryTextColor,
      backgroundColor: _lightBackground,
      buttonTextColor: _buttonTextColorLight,
      borderColor: _borderColor,
      onButtonPressed: () => print('Start a project pressed'),
    );
  }

  Widget _buildSubscriptionCard(_AppLocalizations localizations) {
    return _PlanCard(
      localizations: localizations, // Pass it down
      titleKey: 'subs_title',
      descriptionKey: 'subs_desc',
      price: localizations.get('subs_price'), // Price might need formatting
      pricePeriodKey: 'subs_period',
      featureKeys: const [
        'subs_feat1',
        'subs_feat2',
        'subs_feat3',
        'subs_feat4',
        'subs_feat5',
      ],
      buttonTextKey: 'subs_button',
      buttonColor: _orangeAccent,
      textColor: _buttonTextColorLight,
      backgroundColor: _darkBackground,
      buttonTextColor: _buttonTextColorLight,
      isPopular: true,
      popularTextKey: 'subs_popular',
      onButtonPressed: () => print('Subscribe Now pressed'),
    );
  }
}

// --- Language Switcher Widget ---
class _LanguageSwitcher extends StatelessWidget {
  final Locale currentLocale;
  final Function(Locale) onLocaleChanged;
  final _AppLocalizations localizations; // To translate button text itself

  const _LanguageSwitcher({
    required this.currentLocale,
    required this.onLocaleChanged,
    required this.localizations,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Use Wrap for buttons to flow
      spacing: 8.0, // Horizontal space between buttons
      runSpacing: 4.0, // Vertical space if they wrap
      alignment: WrapAlignment.center,
      children: [
        _buildLangButton(context, 'en', localizations.get('lang_en')),
        _buildLangButton(context, 'fr', localizations.get('lang_fr')),
        _buildLangButton(context, 'ar', localizations.get('lang_ar')),
      ],
    );
  }

  Widget _buildLangButton(BuildContext context, String langCode, String label) {
    bool isActive = currentLocale.languageCode == langCode;
    return ElevatedButton(
      onPressed: isActive ? null : () => onLocaleChanged(Locale(langCode)),
      style: ElevatedButton.styleFrom(
        foregroundColor: isActive ? Colors.white : _orangeAccent, // Text color
        backgroundColor:
            isActive ? _orangeAccent : Colors.white, // Background color
        side:
            isActive
                ? null
                : const BorderSide(color: _orangeAccent), // Border for inactive
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}

// --- Header Widget (Accepts Localizations) ---
class _PricingHeader extends StatelessWidget {
  final _AppLocalizations localizations;
  const _PricingHeader({required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          localizations.get('pricing'), // Use localization
          style: const TextStyle(
            color: _orangeAccent,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          localizations.get('simple_plans'), // Use localization
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          localizations.get('choose_plan_desc'), // Use localization
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: _secondaryTextColor,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// --- Reusable Plan Card Widget (Accepts Localizations & Keys) ---
class _PlanCard extends StatelessWidget {
  final _AppLocalizations localizations; // Instance for translation
  final String titleKey;
  final String descriptionKey;
  final String price; // Keep price as direct string for simplicity here
  final String pricePeriodKey;
  final List<String> featureKeys;
  final String buttonTextKey;
  final Color buttonColor;
  final Color textColor;
  final Color backgroundColor;
  final Color buttonTextColor;
  final Color? borderColor;
  final bool isPopular;
  final String? popularTextKey; // Key for "Most Popular" text
  final VoidCallback onButtonPressed;

  const _PlanCard({
    required this.localizations,
    required this.titleKey,
    required this.descriptionKey,
    required this.price,
    required this.pricePeriodKey,
    required this.featureKeys,
    required this.buttonTextKey,
    required this.buttonColor,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonTextColor,
    required this.onButtonPressed,
    this.borderColor,
    this.isPopular = false,
    this.popularTextKey,
  });

  @override
  Widget build(BuildContext context) {
    // Get translated strings
    final title = localizations.get(titleKey);
    final description = localizations.get(descriptionKey);
    final pricePeriod = localizations.get(pricePeriodKey);
    final buttonText = localizations.get(buttonTextKey);
    final popularText =
        isPopular ? localizations.get(popularTextKey ?? '') : '';
    final features = featureKeys.map((key) => localizations.get(key)).toList();

    return Container(
      padding: const EdgeInsets.all(_cardPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border:
            borderColor != null
                ? Border.all(color: borderColor!, width: 1)
                : null,
        boxShadow:
            borderColor == null
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
                : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Popular Badge (Conditional)
          // Use a Row for alignment flexibility, especially with RTL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    popularText,
                    style: const TextStyle(
                      color: _buttonTextColorLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else
                // Placeholder SizedBox to maintain structure if needed,
                // but often just omitting it is fine if alignment handles it.
                const SizedBox(height: 43), // Approx badge height for spacing
            ],
          ),
          if (isPopular)
            const SizedBox(height: 16), // Consistent space below badge row

          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: textColor.withOpacity(0.8),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            // Ensure price/period align correctly in RTL
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                price, // Already localized string passed in
                style: TextStyle(
                  color: textColor,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  pricePeriod,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: buttonTextColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            onPressed: onButtonPressed,
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1, thickness: 1, color: _borderColor),
          const SizedBox(height: 24),

          // Features List
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                features
                    .map(
                      (feature) =>
                          _FeatureItem(text: feature, textColor: textColor),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

// --- Feature Item Widget (No localization needed here, text passed in) ---
class _FeatureItem extends StatelessWidget {
  final String text;
  final Color textColor;

  const _FeatureItem({required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _featureSpacing),
      child: Row(
        children: [
          Icon(Icons.add, color: textColor.withOpacity(0.8), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor.withOpacity(0.9), fontSize: 14),
              // Let TextDirectionality handle alignment
            ),
          ),
        ],
      ),
    );
  }
}

// --- "Need Something Different?" Section Widget (Accepts Localizations) ---
class _NeedDifferentSection extends StatelessWidget {
  final _AppLocalizations localizations;
  const _NeedDifferentSection({required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(_cardPadding * 1.2),
      decoration: BoxDecoration(
        color: _darkBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        // Use LayoutBuilder for responsiveness
        builder: (context, constraints) {
          bool isNarrow = constraints.maxWidth < 600; // Breakpoint for stacking

          if (isNarrow) {
            // Stack vertically on narrow screens
            return Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text left/start
              children: [
                _buildTextContent(localizations),
                const SizedBox(height: 20),
                _buildButton(
                  localizations,
                  alignment: Alignment.center,
                ), // Center button
              ],
            );
          } else {
            // Row layout for wider screens
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: _buildTextContent(localizations)),
                const SizedBox(width: 20),
                _buildButton(localizations),
              ],
            );
          }
        },
      ),
    );
  }

  // Helper for text content
  Widget _buildTextContent(_AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Important for Flexible
      children: [
        Text(
          localizations.get('need_diff_title'), // Use localization
          style: const TextStyle(
            color: _buttonTextColorLight,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.get('need_diff_desc'), // Use localization
          style: TextStyle(
            color: _buttonTextColorLight.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Helper for button content (allows optional alignment)
  Widget _buildButton(_AppLocalizations localizations, {Alignment? alignment}) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _buttonTextColorLight,
        foregroundColor: _buttonTextColorDark,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      onPressed: () {
        print('Book an Intro Call pressed');
      },
      child: Text(
        localizations.get('need_diff_button'), // Use localization
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center, // Ensure text centers within button
      ),
    );

    if (alignment != null) {
      return Align(alignment: alignment, child: button);
    }
    return button;
  }
}

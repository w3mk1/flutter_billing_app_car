import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAR STYLE',
      debugShowCheckedModeBanner: false,

      // ==========================================
      // 1. إعدادات الثيم (الوضع الداكن والفاتح)
      // ==========================================
      themeMode: ThemeMode.system, // يتكيف تلقائياً مع وضع الهاتف (فاتح / داكن)
      
      // إعدادات الوضع الفاتح (Light Theme)
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),

      // إعدادات الوضع الداكن (Dark Theme)
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          centerTitle: true,
          elevation: 0,
        ),
      ),

      // ==========================================
      // 2. إعدادات اللغة العربية والاتجاه (RTL)
      // ==========================================
      locale: const Locale('ar', ''), // تحديد اللغة العربية كافتراضية
      supportedLocales: const [
        Locale('ar', ''), // العربية
        Locale('en', ''), // الإنجليزية
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const BillingHomeScreen(),
    );
  }
}

// ==========================================
// 3. الشاشة الرئيسية لتطبيق الفواتير
// ==========================================
class BillingHomeScreen extends StatefulWidget {
const BillingHomeScreen({super.key});
  
  @override
  State<BillingHomeScreen> createState() => _BillingHomeScreenState();
}

class _BillingHomeScreenState extends State<BillingHomeScreen> {
  // قائمة نموذجية للفواتير
  final List<Map<String, dynamic>> _invoices = [
    {'id': 'INV-001', 'client': 'أحمد محمد', 'amount': '1250.00', 'date': '2026-08-15'},
    {'id': 'INV-002', 'client': 'شركة الأمل', 'amount': '3400.00', 'date': '2026-08-16'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نظام الفواتير'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة ملخص المبيعات
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('إجمالي الفواتير', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Text('4650.00 د.ج', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(Icons.receipt_long, size: 40, color: Theme.of(context).colorScheme.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'سجل الفواتير الأخيرة',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            
            // قائمة الفواتير
            Expanded(
              child: ListView.builder(
                itemCount: _invoices.length,
                itemBuilder: (context, index) {
                  final invoice = _invoices[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(invoice['client']),
                      subtitle: Text('${invoice['id']} • ${invoice['date']}'),
                      trailing: Text(
                        '${invoice['amount']} د.ج',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // إجراء إضافة فاتورة جديدة
        },
        icon: const Icon(Icons.add),
        label: const Text('فاتورة جديدة'),
      ),
    );
  }
}

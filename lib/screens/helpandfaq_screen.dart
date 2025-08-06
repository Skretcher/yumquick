import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/utils/theme.dart';

class HelpAndFaqScreen extends StatelessWidget {
  const HelpAndFaqScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How do I place an order?',
      'answer': 'Browse the menu, add items to cart, and proceed to checkout.'
    },
    {
      'question': 'Can I schedule a delivery?',
      'answer': 'Yes, choose your preferred delivery time during checkout.'
    },
    {
      'question': 'What if I have allergies?',
      'answer': 'Tap on an item to view ingredients and allergy information.'
    },
    {
      'question': 'How do I contact support?',
      'answer': 'Go to Profile > Support or email us at support@yumquick.com.'
    },
    {
      'question': 'Is there a minimum order?',
      'answer': 'Yes, the minimum order value is \$10.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController queryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & FAQs'),
        backgroundColor: AppColors.yellowDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                  title: Text(
                    faq['question']!,
                    style: AppTextStyles.title,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        faq['answer']!,
                        style: const TextStyle(color: AppColors.text),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Have a question?', style: AppTextStyles.title),
                const SizedBox(height: 8),
                TextField(
                  controller: queryController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Type your question here...',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepOrange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

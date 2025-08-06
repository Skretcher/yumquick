import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:yumquick/utils/theme.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<dynamic> recipes = []; // Stores fetched recipes
  bool isLoading = true; // Tracks loading state

  @override
  void initState() {
    super.initState();
    fetchRecipes(); // Trigger fetch on load
  }

  // Fetches mock recipe data from placeholder API
  Future<void> fetchRecipes() async {
    setState(() => isLoading = true);
    final url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Add mock images to alternate entries
        for (int i = 0; i < jsonData.length; i++) {
          jsonData[i]['image'] = i % 2 == 0
              ? 'https://via.placeholder.com/400x200.png?text=Recipe+${i + 1}'
              : null;
        }

        debugPrint('Fetched Recipes: $jsonData');
        setState(() {
          recipes = jsonData;
          isLoading = false;
        });
      } else {
        debugPrint('Error: ${response.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint('Exception: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.yellowDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/home'),
        ),
        title: const Text('Recipes', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: fetchRecipes,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : recipes.isEmpty
              ? const Center(child: Text('No recipes available.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              image: recipe['image'] != null
                                  ? DecorationImage(
                                      image: NetworkImage(recipe['image']),
                                      fit: BoxFit.cover,
                                      onError: (exception, stackTrace) {
                                        debugPrint(
                                            'Image load error: $exception');
                                      },
                                    )
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: recipe['image'] == null
                                ? const Icon(Icons.fastfood,
                                    size: 80, color: Colors.orange)
                                : null,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            recipe['title'] ?? 'No Title',
                            style: AppTextStyles.title.copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            recipe['body'] ?? '',
                            style: AppTextStyles.subtitle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}

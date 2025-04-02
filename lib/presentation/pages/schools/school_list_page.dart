import 'dart:async';

import 'package:champions_chromo_app/presentation/animations/fade_slide_animation.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_icon_button.dart';
import 'package:champions_chromo_app/presentation/pages/schools/components/school_list_item.dart';
import 'package:champions_chromo_app/presentation/providers/school/filtered_schools_provider.dart';
import 'package:champions_chromo_app/presentation/providers/school/school_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchoolListPage extends ConsumerStatefulWidget {
  const SchoolListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SchoolListPage();
}

class _SchoolListPage extends ConsumerState<SchoolListPage> {
  Timer? _debounce;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Implementar busca quando estiver disponível
    });
  }

  Future<void> _refreshSchools() async {
    return ref.read(schoolsProvider.notifier).getAllSchools();
  }

  void _toggleFavoritesFilter() {
    HapticFeedback.lightImpact();
    ref.read(showOnlyFavoritesProvider.notifier).update((state) => !state);
  }

  @override
  Widget build(BuildContext context) {
    final filteredSchoolsAsync = ref.watch(filteredSchoolsProvider);
    final showOnlyFavorites = ref.watch(showOnlyFavoritesProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: _refreshSchools,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade700,
                    Colors.blue.shade500,
                    Colors.blue.shade400,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.school,
                                color: Colors.white, size: 28),
                            const SizedBox(width: 8),
                            Text(
                              'Encontre sua escola',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const CartIconButton(Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Hero(
                tag: 'searchBar',
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Pesquisar escola...',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon:
                            Icon(Icons.search, color: Colors.blue.shade700),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: _buildFilterChip(
                      'Favoritas',
                      showOnlyFavorites
                          ? Icons.favorite
                          : Icons.favorite_border,
                      isSelected: showOnlyFavorites,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredSchoolsAsync.when(
                data: (schools) {
                  return schools.isEmpty
                      ? _buildEmptyState(showOnlyFavorites)
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: schools.length,
                          itemBuilder: (BuildContext context, int index) {
                            final school = schools[index];
                            return FadeSlideAnimation(
                              index: index,
                              child: Hero(
                                tag: 'school_${school.id}',
                                child: SchoolListItem(school: school),
                              ),
                            );
                          },
                        );
                },
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 48, color: Colors.red.shade300),
                      const SizedBox(height: 16),
                      const Text('Erro ao carregar escolas',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon,
      {bool isSelected = false}) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.white : Colors.blue.shade700,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      selectedColor: Colors.blue.shade600,
      selected: isSelected,
      onSelected: (bool selected) {
        HapticFeedback.selectionClick();
        _toggleFavoritesFilter();
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.blue.shade400),
      ),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildEmptyState(bool showingOnlyFavorites) {
    if (showingOnlyFavorites) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Nenhuma escola favorita',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Adicione escolas aos favoritos',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _toggleFavoritesFilter,
              icon: const Icon(Icons.list),
              label: const Text('Mostrar todas as escolas'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school_outlined, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Nenhuma escola encontrada',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tente outros termos de busca',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

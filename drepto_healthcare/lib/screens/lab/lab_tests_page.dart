import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:drepto_healthcare/widgets/inputs/app_inputs.dart';
import 'package:drepto_healthcare/models/lab_test_category.dart';
import 'package:drepto_healthcare/widgets/cards/category_card.dart';
import 'package:drepto_healthcare/widgets/cards/lab_test_card_enhanced.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LabTestsPage extends StatefulWidget {
  const LabTestsPage({super.key});

  @override
  State<LabTestsPage> createState() => _LabTestsPageState();
}

class _LabTestsPageState extends State<LabTestsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedCategoryId;
  String _searchQuery = '';
  final Set<String> _favoriteTests = {};
  bool _showGridView = false;

  List<LabTestItem> get _filteredTests {
    List<LabTestItem> tests;

    if (_selectedCategoryId != null) {
      tests = LabTestData.getTestsByCategory(_selectedCategoryId!);
    } else {
      tests = LabTestData.allTests;
    }

    if (_searchQuery.isNotEmpty) {
      tests = tests.where((test) {
        final query = _searchQuery.toLowerCase();
        return test.name.toLowerCase().contains(query) ||
            test.shortName.toLowerCase().contains(query) ||
            test.description.toLowerCase().contains(query);
      }).toList();
    }

    return tests;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Lab Tests & Diagnostics',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _showGridView ? Icons.view_list : Icons.grid_view,
              color: AppColors.textPrimary,
            ),
            onPressed: () => setState(() => _showGridView = !_showGridView),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.textPrimary,
                ),
                onPressed: () {},
              ),
              if (_favoriteTests.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${_favoriteTests.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Location bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            color: AppColors.surfaceLight,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 18,
                ),
                SizedBox(width: 8.w),
                Text('Delivering to ', style: AppTextStyles.caption),
                Text(
                  'Home - Upper West Side, NY',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: AppSearchField(
              hint: 'Search for tests or packages...',
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),

          // Tab bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: AppSpacing.borderRadiusFull,
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: AppSpacing.borderRadiusFull,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              labelColor: AppColors.textPrimary,
              unselectedLabelColor: AppColors.textSecondary,
              labelStyle: AppTextStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Individual Tests'),
                Tab(text: 'Health Packages'),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Categories section
          if (_searchQuery.isEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Browse by Category',
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (_selectedCategoryId != null)
                    TextButton(
                      onPressed: () =>
                          setState(() => _selectedCategoryId = null),
                      child: Text(
                        'View All',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            // Category grid
            SizedBox(
              height: 140.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: LabTestData.categories.length,
                itemBuilder: (context, index) {
                  final category = LabTestData.categories[index];
                  return Container(
                    width: 120.w,
                    margin: EdgeInsets.only(right: 12.w),
                    child: CategoryCard(
                      category: category,
                      isSelected: _selectedCategoryId == category.id,
                      onTap: () {
                        setState(() {
                          _selectedCategoryId =
                              _selectedCategoryId == category.id
                                  ? null
                                  : category.id;
                        });
                      },
                    ),
                  );
                },
              ).animate().fadeIn(duration: 400.ms).slideX(
                    begin: 0.2,
                    curve: Curves.easeOut,
                  ),
            ),
            SizedBox(height: 16.h),
          ],

          // Home sample collection banner
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.05),
                  AppColors.accent.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppSpacing.borderRadiusMd,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: AppSpacing.borderRadiusSm,
                  ),
                  child: Icon(
                    Icons.home,
                    color: AppColors.primary,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home Sample Collection',
                        style: AppTextStyles.labelMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Free for orders above \$50. Certified phlebotomists.',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColors.primary,
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
          SizedBox(height: 16.h),

          // Tests header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedCategoryId != null
                      ? '${LabTestData.getCategoryById(_selectedCategoryId!)?.name ?? 'Tests'} (${_filteredTests.length})'
                      : 'All Tests (${_filteredTests.length})',
                  style: AppTextStyles.h4.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_filteredTests.isNotEmpty)
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.sort,
                      color: AppColors.textSecondary,
                      size: 20.sp,
                    ),
                    onSelected: (value) {
                      // TODO: Implement sorting
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'price_low',
                        child: Text('Price: Low to High'),
                      ),
                      const PopupMenuItem(
                        value: 'price_high',
                        child: Text('Price: High to Low'),
                      ),
                      const PopupMenuItem(
                        value: 'popular',
                        child: Text('Most Popular'),
                      ),
                      const PopupMenuItem(
                        value: 'name',
                        child: Text('Name: A to Z'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // Test list
          Expanded(
            child: _filteredTests.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64.sp,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'No tests found',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Try adjusting your search or filters',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  )
                : _showGridView
                    ? GridView.builder(
                        padding: EdgeInsets.all(16.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: _filteredTests.length,
                        itemBuilder: (context, index) {
                          final test = _filteredTests[index];
                          final category =
                              LabTestData.getCategoryById(test.categoryId)!;
                          return LabTestCardEnhanced(
                            test: test,
                            category: category,
                            isFavorite: _favoriteTests.contains(test.id),
                            onFavorite: () {
                              setState(() {
                                if (_favoriteTests.contains(test.id)) {
                                  _favoriteTests.remove(test.id);
                                } else {
                                  _favoriteTests.add(test.id);
                                }
                              });
                            },
                            onBookNow: () {
                              // TODO: Implement booking
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Booking ${test.shortName}...'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                          );
                        },
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(16.w),
                        itemCount: _filteredTests.length,
                        itemBuilder: (context, index) {
                          final test = _filteredTests[index];
                          final category =
                              LabTestData.getCategoryById(test.categoryId)!;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: LabTestCardEnhanced(
                              test: test,
                              category: category,
                              isFavorite: _favoriteTests.contains(test.id),
                              onFavorite: () {
                                setState(() {
                                  if (_favoriteTests.contains(test.id)) {
                                    _favoriteTests.remove(test.id);
                                  } else {
                                    _favoriteTests.add(test.id);
                                  }
                                });
                              },
                              onBookNow: () {
                                // TODO: Implement booking
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Booking ${test.shortName}...'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                            ),
                          )
                              .animate()
                              .fadeIn(
                                delay: Duration(milliseconds: index * 50),
                                duration: 400.ms,
                              )
                              .slideX(
                                begin: 0.1,
                                curve: Curves.easeOut,
                              );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

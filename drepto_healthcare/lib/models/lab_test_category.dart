import 'package:flutter/material.dart';

/// Represents a medical category for lab tests
class LabTestCategory {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color primaryColor;
  final Color backgroundColor;
  final List<LabTestItem> tests;

  const LabTestCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.primaryColor,
    required this.backgroundColor,
    required this.tests,
  });

  int get testCount => tests.length;
}

/// Represents an individual lab test
class LabTestItem {
  final String id;
  final String name;
  final String shortName;
  final String description;
  final String categoryId;
  final int parameters;
  final String sampleType;
  final bool fastingRequired;
  final String fastingDuration;
  final String reportTime;
  final double price;
  final double? originalPrice;
  final bool isTopSeller;
  final bool isPopular;
  final List<String> includes;
  final String? preparation;

  const LabTestItem({
    required this.id,
    required this.name,
    required this.shortName,
    required this.description,
    required this.categoryId,
    required this.parameters,
    required this.sampleType,
    required this.fastingRequired,
    this.fastingDuration = '',
    required this.reportTime,
    required this.price,
    this.originalPrice,
    this.isTopSeller = false,
    this.isPopular = false,
    this.includes = const [],
    this.preparation,
  });

  double get discountPercentage {
    if (originalPrice == null || originalPrice! <= price) return 0;
    return ((originalPrice! - price) / originalPrice!) * 100;
  }
}

/// All lab test categories with their tests
class LabTestData {
  static final List<LabTestCategory> categories = [
    // 1. Blood & Immunity (Hematology)
    const LabTestCategory(
      id: 'blood_immunity',
      name: 'Blood & Immunity',
      description: 'Complete blood analysis and immune system health',
      icon: Icons.bloodtype,
      primaryColor: Color(0xFFE53E3E),
      backgroundColor: Color(0xFFFFF5F5),
      tests: [
        LabTestItem(
          id: 'cbc',
          name: 'Complete Blood Count (CBC)',
          shortName: 'CBC',
          description: 'Comprehensive blood cell analysis',
          categoryId: 'blood_immunity',
          parameters: 28,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '6 hours',
          price: 15.00,
          originalPrice: 25.00,
          isTopSeller: true,
          isPopular: true,
          includes: [
            'RBC Count',
            'WBC Count',
            'Hemoglobin',
            'Platelet Count',
            'Differential Count'
          ],
        ),
        LabTestItem(
          id: 'esr',
          name: 'Erythrocyte Sedimentation Rate (ESR)',
          shortName: 'ESR',
          description: 'Inflammation and infection marker',
          categoryId: 'blood_immunity',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '4 hours',
          price: 8.00,
          originalPrice: 12.00,
          includes: ['ESR Value'],
        ),
        LabTestItem(
          id: 'blood_group',
          name: 'Blood Grouping & Rh Typing',
          shortName: 'Blood Group',
          description: 'Determine blood type and Rh factor',
          categoryId: 'blood_immunity',
          parameters: 2,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '3 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['ABO Grouping', 'Rh Factor'],
        ),
      ],
    ),

    // 2. Diabetes & Sugar (Metabolism)
    const LabTestCategory(
      id: 'diabetes',
      name: 'Diabetes & Sugar',
      description: 'Blood sugar monitoring and diabetes management',
      icon: Icons.monitor_heart,
      primaryColor: Color(0xFF9333EA),
      backgroundColor: Color(0xFFFAF5FF),
      tests: [
        LabTestItem(
          id: 'hba1c',
          name: 'HbA1c (Glycated Hemoglobin)',
          shortName: 'HbA1c',
          description: '3-month average blood sugar control',
          categoryId: 'diabetes',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 19.00,
          originalPrice: 25.00,
          isTopSeller: true,
          isPopular: true,
          includes: ['HbA1c Level', 'Average Glucose'],
          preparation: 'No special preparation needed',
        ),
        LabTestItem(
          id: 'fbs',
          name: 'Fasting Blood Sugar (FBS)',
          shortName: 'FBS',
          description: 'Blood glucose after overnight fasting',
          categoryId: 'diabetes',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '8-12 hours',
          reportTime: '4 hours',
          price: 7.00,
          originalPrice: 10.00,
          isPopular: true,
          includes: ['Fasting Glucose Level'],
          preparation: 'Fast for 8-12 hours before test',
        ),
        LabTestItem(
          id: 'ppbs',
          name: 'Post-Prandial Blood Sugar (PPBS)',
          shortName: 'PPBS',
          description: 'Blood glucose 2 hours after meal',
          categoryId: 'diabetes',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '4 hours',
          price: 7.00,
          originalPrice: 10.00,
          includes: ['Post-meal Glucose'],
          preparation: 'Test done 2 hours after eating',
        ),
        LabTestItem(
          id: 'rbs',
          name: 'Random Blood Sugar (RBS)',
          shortName: 'RBS',
          description: 'Blood glucose at any time',
          categoryId: 'diabetes',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '2 hours',
          price: 6.00,
          originalPrice: 9.00,
          includes: ['Random Glucose Level'],
        ),
      ],
    ),

    // 3. Heart Health (Lipid Profile)
    const LabTestCategory(
      id: 'heart',
      name: 'Heart Health',
      description: 'Cholesterol and cardiovascular risk assessment',
      icon: Icons.favorite,
      primaryColor: Color(0xFFDC2626),
      backgroundColor: Color(0xFFFEF2F2),
      tests: [
        LabTestItem(
          id: 'lipid_profile',
          name: 'Lipid Profile (Complete)',
          shortName: 'Lipid Profile',
          description: 'Complete cholesterol and heart health panel',
          categoryId: 'heart',
          parameters: 8,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '10-12 hours',
          reportTime: '24 hours',
          price: 29.00,
          originalPrice: 45.00,
          isTopSeller: true,
          isPopular: true,
          includes: [
            'Total Cholesterol',
            'HDL Cholesterol',
            'LDL Cholesterol',
            'VLDL',
            'Triglycerides',
            'TC/HDL Ratio',
            'LDL/HDL Ratio'
          ],
          preparation: 'Fast for 10-12 hours, water allowed',
        ),
        LabTestItem(
          id: 'total_cholesterol',
          name: 'Total Cholesterol',
          shortName: 'Cholesterol',
          description: 'Overall cholesterol level',
          categoryId: 'heart',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '10-12 hours',
          reportTime: '12 hours',
          price: 12.00,
          originalPrice: 18.00,
          includes: ['Total Cholesterol'],
        ),
        LabTestItem(
          id: 'hdl',
          name: 'HDL Cholesterol (Good Cholesterol)',
          shortName: 'HDL',
          description: 'High-density lipoprotein level',
          categoryId: 'heart',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '10-12 hours',
          reportTime: '12 hours',
          price: 12.00,
          originalPrice: 18.00,
          includes: ['HDL Level'],
        ),
        LabTestItem(
          id: 'ldl',
          name: 'LDL Cholesterol (Bad Cholesterol)',
          shortName: 'LDL',
          description: 'Low-density lipoprotein level',
          categoryId: 'heart',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '10-12 hours',
          reportTime: '12 hours',
          price: 12.00,
          originalPrice: 18.00,
          includes: ['LDL Level'],
        ),
        LabTestItem(
          id: 'triglycerides',
          name: 'Triglycerides',
          shortName: 'Triglycerides',
          description: 'Blood fat level measurement',
          categoryId: 'heart',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '10-12 hours',
          reportTime: '12 hours',
          price: 12.00,
          originalPrice: 18.00,
          includes: ['Triglyceride Level'],
        ),
      ],
    ),

    // 4. Liver Health (LFT)
    const LabTestCategory(
      id: 'liver',
      name: 'Liver Health',
      description: 'Liver function and enzyme analysis',
      icon: Icons.local_hospital,
      primaryColor: Color(0xFFEA580C),
      backgroundColor: Color(0xFFFFF7ED),
      tests: [
        LabTestItem(
          id: 'lft',
          name: 'Liver Function Test (LFT) - Complete',
          shortName: 'LFT',
          description: 'Comprehensive liver health assessment',
          categoryId: 'liver',
          parameters: 11,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '8-10 hours',
          reportTime: '24 hours',
          price: 35.00,
          originalPrice: 50.00,
          isTopSeller: true,
          includes: [
            'Bilirubin Total',
            'Bilirubin Direct',
            'Bilirubin Indirect',
            'SGOT (AST)',
            'SGPT (ALT)',
            'Alkaline Phosphatase',
            'Total Protein',
            'Albumin',
            'Globulin',
            'A/G Ratio'
          ],
        ),
        LabTestItem(
          id: 'bilirubin',
          name: 'Bilirubin (Total, Direct, Indirect)',
          shortName: 'Bilirubin',
          description: 'Liver pigment levels',
          categoryId: 'liver',
          parameters: 3,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 15.00,
          originalPrice: 22.00,
          includes: ['Total Bilirubin', 'Direct', 'Indirect'],
        ),
        LabTestItem(
          id: 'sgot',
          name: 'SGOT (AST) - Liver Enzyme',
          shortName: 'SGOT',
          description: 'Aspartate aminotransferase level',
          categoryId: 'liver',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['SGOT Level'],
        ),
        LabTestItem(
          id: 'sgpt',
          name: 'SGPT (ALT) - Liver Enzyme',
          shortName: 'SGPT',
          description: 'Alanine aminotransferase level',
          categoryId: 'liver',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['SGPT Level'],
        ),
        LabTestItem(
          id: 'alp',
          name: 'Alkaline Phosphatase (ALP)',
          shortName: 'ALP',
          description: 'Liver and bone enzyme',
          categoryId: 'liver',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['ALP Level'],
        ),
        LabTestItem(
          id: 'albumin_globulin',
          name: 'Albumin & Globulin',
          shortName: 'A/G Ratio',
          description: 'Protein levels in blood',
          categoryId: 'liver',
          parameters: 4,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 12.00,
          originalPrice: 18.00,
          includes: ['Total Protein', 'Albumin', 'Globulin', 'A/G Ratio'],
        ),
      ],
    ),

    // 5. Kidney Health (KFT)
    const LabTestCategory(
      id: 'kidney',
      name: 'Kidney Health',
      description: 'Kidney function and electrolyte balance',
      icon: Icons.water_drop,
      primaryColor: Color(0xFF0891B2),
      backgroundColor: Color(0xFFECFEFF),
      tests: [
        LabTestItem(
          id: 'kft',
          name: 'Kidney Function Test (KFT) - Complete',
          shortName: 'KFT',
          description: 'Comprehensive kidney health panel',
          categoryId: 'kidney',
          parameters: 10,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '24 hours',
          price: 32.00,
          originalPrice: 48.00,
          isTopSeller: true,
          includes: [
            'Creatinine',
            'Urea',
            'BUN',
            'Uric Acid',
            'Sodium',
            'Potassium',
            'Chloride',
            'Calcium',
            'Phosphorus'
          ],
        ),
        LabTestItem(
          id: 'creatinine',
          name: 'Serum Creatinine',
          shortName: 'Creatinine',
          description: 'Kidney filtration marker',
          categoryId: 'kidney',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          isPopular: true,
          includes: ['Creatinine Level'],
        ),
        LabTestItem(
          id: 'urea',
          name: 'Blood Urea',
          shortName: 'Urea',
          description: 'Kidney waste removal efficiency',
          categoryId: 'kidney',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['Urea Level'],
        ),
        LabTestItem(
          id: 'bun',
          name: 'Blood Urea Nitrogen (BUN)',
          shortName: 'BUN',
          description: 'Nitrogen waste in blood',
          categoryId: 'kidney',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['BUN Level'],
        ),
        LabTestItem(
          id: 'uric_acid',
          name: 'Uric Acid',
          shortName: 'Uric Acid',
          description: 'Gout and kidney stone marker',
          categoryId: 'kidney',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 10.00,
          originalPrice: 15.00,
          includes: ['Uric Acid Level'],
        ),
        LabTestItem(
          id: 'electrolytes',
          name: 'Serum Electrolytes (Na, K, Cl)',
          shortName: 'Electrolytes',
          description: 'Essential mineral balance',
          categoryId: 'kidney',
          parameters: 3,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 15.00,
          originalPrice: 22.00,
          includes: ['Sodium', 'Potassium', 'Chloride'],
        ),
      ],
    ),

    // 6. Thyroid Function
    const LabTestCategory(
      id: 'thyroid',
      name: 'Thyroid Function',
      description: 'Thyroid hormone and metabolism assessment',
      icon: Icons.psychology,
      primaryColor: Color(0xFF7C3AED),
      backgroundColor: Color(0xFFFAF5FF),
      tests: [
        LabTestItem(
          id: 'thyroid_profile',
          name: 'Thyroid Profile (Total T3, T4, TSH)',
          shortName: 'Thyroid Profile',
          description: 'Complete thyroid function assessment',
          categoryId: 'thyroid',
          parameters: 3,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '24 hours',
          price: 35.00,
          originalPrice: 50.00,
          isTopSeller: true,
          isPopular: true,
          includes: ['Total T3', 'Total T4', 'TSH'],
        ),
        LabTestItem(
          id: 'tsh',
          name: 'TSH (Thyroid Stimulating Hormone)',
          shortName: 'TSH',
          description: 'Primary thyroid function indicator',
          categoryId: 'thyroid',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 15.00,
          originalPrice: 22.00,
          isPopular: true,
          includes: ['TSH Level'],
        ),
        LabTestItem(
          id: 't3',
          name: 'Total T3 (Triiodothyronine)',
          shortName: 'T3',
          description: 'Active thyroid hormone',
          categoryId: 'thyroid',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 15.00,
          originalPrice: 22.00,
          includes: ['T3 Level'],
        ),
        LabTestItem(
          id: 't4',
          name: 'Total T4 (Thyroxine)',
          shortName: 'T4',
          description: 'Primary thyroid hormone',
          categoryId: 'thyroid',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 15.00,
          originalPrice: 22.00,
          includes: ['T4 Level'],
        ),
      ],
    ),

    // 7. Vitamins & Minerals
    const LabTestCategory(
      id: 'vitamins',
      name: 'Vitamins & Minerals',
      description: 'Essential nutrient levels and deficiency screening',
      icon: Icons.eco,
      primaryColor: Color(0xFF059669),
      backgroundColor: Color(0xFFF0FDF4),
      tests: [
        LabTestItem(
          id: 'vitamin_d',
          name: 'Vitamin D (25-Hydroxy)',
          shortName: 'Vitamin D',
          description: 'Bone health and immunity vitamin',
          categoryId: 'vitamins',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '24 hours',
          price: 25.00,
          originalPrice: 35.00,
          isTopSeller: true,
          isPopular: true,
          includes: ['25-OH Vitamin D'],
        ),
        LabTestItem(
          id: 'vitamin_b12',
          name: 'Vitamin B12',
          shortName: 'B12',
          description: 'Nerve and blood cell health',
          categoryId: 'vitamins',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '24 hours',
          price: 22.00,
          originalPrice: 32.00,
          isPopular: true,
          includes: ['B12 Level'],
        ),
        LabTestItem(
          id: 'serum_iron',
          name: 'Serum Iron',
          shortName: 'Iron',
          description: 'Iron level in blood',
          categoryId: 'vitamins',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: true,
          fastingDuration: '8-10 hours',
          reportTime: '24 hours',
          price: 18.00,
          originalPrice: 25.00,
          includes: ['Serum Iron Level'],
        ),
        LabTestItem(
          id: 'calcium',
          name: 'Serum Calcium',
          shortName: 'Calcium',
          description: 'Bone and muscle health mineral',
          categoryId: 'vitamins',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '12 hours',
          price: 12.00,
          originalPrice: 18.00,
          includes: ['Calcium Level'],
        ),
        LabTestItem(
          id: 'ferritin',
          name: 'Ferritin',
          shortName: 'Ferritin',
          description: 'Iron storage protein',
          categoryId: 'vitamins',
          parameters: 1,
          sampleType: 'Blood Sample',
          fastingRequired: false,
          reportTime: '24 hours',
          price: 20.00,
          originalPrice: 28.00,
          includes: ['Ferritin Level'],
        ),
      ],
    ),

    // 8. Urine Analysis
    const LabTestCategory(
      id: 'urine',
      name: 'Urine Analysis',
      description: 'Urinary system and metabolic health screening',
      icon: Icons.science,
      primaryColor: Color(0xFFCA8A04),
      backgroundColor: Color(0xFFFEFCE8),
      tests: [
        LabTestItem(
          id: 'urine_routine',
          name: 'Urine Routine & Microscopy',
          shortName: 'Urine R/M',
          description: 'Complete urine analysis',
          categoryId: 'urine',
          parameters: 20,
          sampleType: 'Urine Sample',
          fastingRequired: false,
          reportTime: '6 hours',
          price: 12.00,
          originalPrice: 18.00,
          isTopSeller: true,
          includes: [
            'Physical Examination',
            'Chemical Examination',
            'Microscopic Examination',
            'pH',
            'Specific Gravity',
            'Protein',
            'Glucose',
            'Ketones',
            'Blood',
            'Pus Cells',
            'RBCs',
            'Crystals'
          ],
          preparation: 'First morning sample preferred',
        ),
        LabTestItem(
          id: 'urine_culture',
          name: 'Urine Culture & Sensitivity',
          shortName: 'Urine Culture',
          description: 'Detect urinary tract infections',
          categoryId: 'urine',
          parameters: 2,
          sampleType: 'Urine Sample',
          fastingRequired: false,
          reportTime: '48 hours',
          price: 25.00,
          originalPrice: 35.00,
          includes: ['Culture', 'Antibiotic Sensitivity'],
          preparation: 'Midstream clean catch sample',
        ),
      ],
    ),
  ];

  /// Get all tests across all categories
  static List<LabTestItem> get allTests {
    return categories.expand((category) => category.tests).toList();
  }

  /// Get tests by category ID
  static List<LabTestItem> getTestsByCategory(String categoryId) {
    final category = categories.firstWhere(
      (cat) => cat.id == categoryId,
      orElse: () => categories.first,
    );
    return category.tests;
  }

  /// Get category by ID
  static LabTestCategory? getCategoryById(String categoryId) {
    try {
      return categories.firstWhere((cat) => cat.id == categoryId);
    } catch (e) {
      return null;
    }
  }

  /// Search tests by name or description
  static List<LabTestItem> searchTests(String query) {
    if (query.isEmpty) return allTests;

    final lowerQuery = query.toLowerCase();
    return allTests.where((test) {
      return test.name.toLowerCase().contains(lowerQuery) ||
          test.shortName.toLowerCase().contains(lowerQuery) ||
          test.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  /// Get popular tests
  static List<LabTestItem> get popularTests {
    return allTests.where((test) => test.isPopular).toList();
  }

  /// Get top seller tests
  static List<LabTestItem> get topSellerTests {
    return allTests.where((test) => test.isTopSeller).toList();
  }
}




/// Helper functions for generating personalized greetings
class GreetingHelper {
  /// Get time-based greeting (Good Morning, Good Afternoon, Good Evening)
  static String getTimeBasedGreeting() {
    final hour = DateTime.now().hour;
    
    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
  
  /// Extract first name from full name
  /// Examples:
  /// - "John Doe" -> "John"
  /// - "Mary Jane Watson" -> "Mary"
  /// - "Alice" -> "Alice"
  static String getFirstName(String fullName) {
    if (fullName.isEmpty) return '';
    
    final trimmedName = fullName.trim();
    final parts = trimmedName.split(' ');
    
    return parts.first;
  }
  
  /// Get complete personalized greeting
  /// Example: "Good Morning, John"
  static String getPersonalizedGreeting(String fullName) {
    final greeting = getTimeBasedGreeting();
    final firstName = getFirstName(fullName);
    
    if (firstName.isEmpty) {
      return greeting;
    }
    
    return '$greeting, $firstName';
  }
}


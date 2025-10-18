# 💳 Payment Gateway Integration App

A professional Flutter application demonstrating seamless integration with multiple payment gateways including **Stripe** and **Paymob**. Built with Clean Architecture principles and BLoC state management, this app provides a complete checkout experience with a beautiful UI.

## 📱 Project Overview

This Flutter application showcases a production-ready implementation of payment processing, featuring a shopping cart interface, multiple payment methods, and a delightful success screen. The app is designed to demonstrate best practices in Flutter development, including proper architecture, state management, and third-party service integration.

## 🚀 Tech Stack

### **Frontend**

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language

### **State Management**

- **flutter_bloc** (^9.1.1) - Business Logic Component pattern
- **equatable** (^2.0.7) - Value equality for Dart objects

### **Payment Gateways**

- **flutter_stripe** (^12.0.2) - Stripe payment integration
- **flutter_paymob** (^1.0.8) - Paymob payment integration

### **UI Components**

- **flutter_credit_card** (^4.1.0) - Interactive credit card UI

### **Networking & Data**

- **dio** (^5.9.0) - HTTP client
- **dartz** (^0.10.1) - Functional programming (Either for error handling)
- **flutter_dotenv** (^6.0.0) - Environment variable management

### **Development Tools**

- **flutter_lints** (^5.0.0) - Linting rules
- **flutter_test** - Testing framework

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/
│   ├── errors/          # Error handling (Failure classes)
│   ├── helpers/         # Stripe helper utilities
│   ├── networking/      # API service layer
│   ├── observers/       # BLoC observers for debugging
│   ├── painters/        # Custom painters (dashed lines)
│   ├── standards/       # Standard models/interfaces
│   └── theme/           # App-wide styling
│
└── features/
    └── checkout/
        ├── data/
        │   ├── models/           # Data models
        │   └── repositories/     # Repository implementations
        ├── domain/
        │   ├── entities/         # Business entities
        │   ├── repositories/     # Repository contracts
        │   └── usecases/        # Business logic use cases
        └── presentation/
            ├── cubit/           # State management
            ├── pages/           # Screens
            └── widgets/         # Reusable UI components
```

### **Key Architectural Patterns**

1. **Clean Architecture Layers**

   - **Presentation Layer**: UI components, BLoC/Cubit
   - **Domain Layer**: Business logic, entities, use cases
   - **Data Layer**: Models, repositories, API services

2. **BLoC Pattern**: Unidirectional data flow for predictable state management

3. **Repository Pattern**: Abstraction over data sources

4. **Dependency Injection**: Through constructor injection

## ✨ Features

### **Payment Processing**

- ✅ Multiple payment gateway support (Stripe & Paymob)
- ✅ Credit card input with real-time validation
- ✅ Secure payment intent creation
- ✅ Customer and ephemeral key management
- ✅ Payment sheet presentation

### **User Experience**

- ✅ Shopping cart with itemized pricing
- ✅ Order summary with subtotal, discount, and shipping
- ✅ Smooth payment method selection
- ✅ Interactive credit card form with flip animation
- ✅ Beautiful success screen with receipt details
- ✅ Loading states and error handling

### **UI/UX Highlights**

- ✅ Custom dashed line painter
- ✅ Animated payment method selection
- ✅ Card flip animation
- ✅ Responsive design
- ✅ Professional color scheme

## 🧪 Testing

The project includes:

- Widget tests setup in `test/widget_test.dart`
- BLoC observer for debugging state changes
- Comprehensive error handling with Either pattern

To run tests:

```bash
flutter test
```

## 📂 Folder Structure

```
payment_gateway_learn/
├── android/                 # Android native code
├── ios/                     # iOS native code
├── lib/
│   ├── core/               # Core utilities and helpers
│   │   ├── errors/
│   │   ├── helpers/
│   │   ├── networking/
│   │   ├── observers/
│   │   ├── painters/
│   │   ├── standards/
│   │   └── theme/
│   ├── features/
│   │   └── checkout/       # Checkout feature module
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   └── main.dart           # App entry point
├── assets/
│   ├── images/            # Image assets
│   └── icons/             # Icon assets
├── test/                  # Test files
├── important_data.env     # Environment variables (not in repo)
├── pubspec.yaml          # Dependencies
└── README.md             # This file
```

## 🔧 How to Run the Project

### **Prerequisites**

- Flutter SDK (^3.9.2)
- Dart SDK
- iOS Simulator / Android Emulator
- Stripe Account
- Paymob Account

### **Step 1: Clone the Repository**

```bash
git clone https://github.com/yourusername/payment_gateway_learn.git
cd payment_gateway_learn
```

### **Step 2: Install Dependencies**

```bash
flutter pub get
```

### **Step 3: Configure Environment Variables**

Create `important_data.env` file in the root directory:

```env
# Stripe Keys
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
STRIPE_SECRET_KEY=your_stripe_secret_key
CUSTOMER_ID=your_stripe_customer_id
ACCOUNT_ID=your_stripe_account_id

# Paymob Keys
PAYMOB_API_KEY=your_paymob_api_key
PAYMOB_INTEGRATION_ID=your_integration_id
PAYMOB_iFRAME_ID=your_iframe_id
```

### **Step 4: Run the App**

For iOS:

```bash
flutter run -d ios
```

For Android:

```bash
flutter run -d android
```

### **Step 5: Test Payment**

1. Add items to cart (default: $50.97)
2. Tap "Complete Payment"
3. Select payment method (Visa/Paymob)
4. Enter card details (use Stripe test cards)
5. Complete payment and view success screen

### **Stripe Test Cards**

- **Success**: 4242 4242 4242 4242
- **Declined**: 4000 0000 0000 0002
- Use any future expiry date and CVC

## 🎯 Future Improvements

- [ ] Add PayPal integration
- [ ] Implement order history
- [ ] Add user authentication
- [ ] Support for multiple currencies
- [ ] Saved payment methods
- [ ] Receipt email functionality
- [ ] Push notifications for payment status
- [ ] Analytics integration
- [ ] Dark mode support
- [ ] Localization (i18n)
- [ ] Unit tests for all use cases
- [ ] Integration tests
- [ ] CI/CD pipeline setup

## 📸 Screenshots

> Add your app screenshots here

```markdown
| Cart Screen   | Payment Methods  | Success Screen   |
| ------------- | ---------------- | ---------------- |
| ![Cart](link) | ![Payment](link) | ![Success](link) |
```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Your Name**

- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)
- Twitter: [@yourhandle](https://twitter.com/yourhandle)
- Email: your.email@example.com

## 🙏 Acknowledgments

- [Stripe Documentation](https://stripe.com/docs)
- [Paymob Documentation](https://docs.paymob.com)
- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Library](https://bloclibrary.dev)

## ⭐ Show your support

Give a ⭐️ if this project helped you!

---

**Made with ❤️ and Flutter**

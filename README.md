# Flutter E-commerce App with API Integration

A simple yet functional Flutter application demonstrating **CRUD** (Create, Read, Update, Delete) operations to manage products in an e-commerce platform, integrated with a remote API.

## Overview

This app allows users to perform the following actions on products:

*  **View** a list of products fetched from an external API.
*  **Add** new products with name, description, price, and image.
*  **Edit** product details.
*  **Delete** unwanted products.

## Features

* **Create:** Add new products with fields like `name`, `description`, `price`, and `image URL`.
* **Read:** Fetch and display products in a structured list view from a REST API.
* **Update:** Edit existing product information.
* **Delete:** Remove products from the server and the local list.

##  Additional Highlights

*  **State Management:** Powered by [`Provider`](https://pub.dev/packages/provider) for reactive UI updates.
*  **API Integration:** Built using the [`http`](https://pub.dev/packages/http) package to connect with backend services.
*  **User Interface:** Clean and intuitive UI designed with Flutter widgets.


## Technology Stack

| Technology   | Description                                      |
| ------------ | ------------------------------------------------ |
| **Flutter**  | UI framework for building natively compiled apps |
| **Dart**     | Programming language used in Flutter             |
| **Provider** | State management solution                        |
| **HTTP**     | Package for making REST API calls                |
| **JSON**     | Data format for request/response serialization   |


##  Getting Started

### Prerequisites

* Flutter SDK
* Android Studio or Visual Studio Code
* Emulator or physical device

### Setup Instructions

```bash
# Clone the repository
git clone https://github.com/your-username/flutter-ecommerce-crud.git

# Navigate into the project directory
cd flutter-ecommerce-crud

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Resources

*  [Flutter Documentation](https://flutter.dev/docs)
*  [Dart Language Documentation](https://dart.dev/guides)
*  [Write your first Flutter app (Lab)](https://docs.flutter.dev/get-started/codelab)
*  [Flutter Cookbook](https://docs.flutter.dev/cookbook)



## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License

This project is open source and available under the [MIT License](LICENSE).

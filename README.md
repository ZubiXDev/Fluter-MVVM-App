# MVVM Architecture Flutter Project

![Flutter MVVM](https://img.shields.io/badge/Flutter-MVVM-blue.svg?style=for-the-badge) ![MIT License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge) ![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-orange.svg?style=for-the-badge)

## 📖 Project Overview

This project demonstrates a clean and scalable **Flutter application** using the **Model-View-ViewModel (MVVM)** architecture. The app organizes its structure to ensure maintainability, testability, and separation of concerns.

---

## 📂 Project Structure

```
lib/
├── data/             # Data models and network services
│   ├── network/      # Network services (e.g., base_api_services.dart, network_api_services.dart)
│   └── response/     # API response models (e.g., api_response.dart, status.dart)
├── model/            # Data models (e.g., user_model.dart, movies_model.dart)
├── repository/       # Data repositories (e.g., auth_repository.dart, home_repository.dart)
├── resources/        # App resources
│   ├── component/    # Reusable UI components
│   ├── app_urls.dart # Application URLs
│   └── colors.dart   # App color palette
├── utils/            # Utility classes and functions
│   ├── routes/       # Navigation routes (e.g., routes.dart, routes_name.dart)
│   └── utils.dart    # Miscellaneous utilities
├── view/             # App views (e.g., login_view.dart, signup_view.dart)
├── view_model/       # View models (e.g., auth_view_model.dart, home_view_model.dart, user_view_model.dart)
├── services/         # App services (e.g., splash_services.dart)
└── main.dart         # Application entry point
```

---

## 🚀 Features

- **Clean and scalable MVVM architecture** for better code organization.
- **Separation of concerns** into distinct modules (data, repository, view, view model).
- **Reusable UI components** to ensure a consistent design language.
- **Centralized navigation management** for easier route handling.
- **API services and models** for seamless data handling.

---

## 🛠️ Getting Started

Follow these steps to get the project up and running:

1. **Clone the repository**
   ```bash
   git clone https://github.com/ZubiXDev/Flutter-MVVM-App.git
   ```

2. **Navigate to the project directory**
   ```bash
   cd Flutter-MVVM-App
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

---

## 📄 .gitignore

This project uses the official Flutter `.gitignore` template to exclude unnecessary files. You can find it here: [Flutter .gitignore](https://github.com/flutter/flutter/blob/master/.gitignore)

---

## 📋 GitHub Workflow

This project utilizes **GitHub Actions** for Continuous Integration and Deployment. The workflow file is located at:

```
.github/workflows/main.yml
```

---

## 🤝 Contributions

Contributions are always welcome! If you encounter any issues or have suggestions for improvement, feel free to:

- Open an **issue**
- Submit a **pull request**

Please ensure your code follows the existing code style and passes all tests before submitting.

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

---

## 🌟 Acknowledgments

This project was inspired and guided by [Axif Taj](https://github.com/axiftaj). Check out his YouTube channel, [The Tech Brothers](https://www.youtube.com/@thetechbrotherss), for more amazing tutorials and insights.

---

⭐ **If you find this project useful, don't forget to give it a star!** ⭐

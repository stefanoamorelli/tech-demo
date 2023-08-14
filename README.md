# Technical Assignment - Stefano Amorelli
# 🧡 Overview
```
flutter --version

Flutter 3.10.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision f468f3366c (5 weeks ago) • 2023-07-12 15:19:05 -0700
Engine • revision cdbeda788a
Tools • Dart 3.0.6 • DevTools 2.23.1

dart --version

Dart SDK version: 3.0.6 (stable) (Tue Jul 11 18:49:07 2023 +0000) on "linux_x64"

# 😎 Tested on the latest stable releases of Flutter (3.10.6) and Dart (3.0.6)
```

```flutter run```
<center>
  <table>
    <tr>
      <td>
        <img align="left" src="demo.gif" height="512"/> 
      </td>
    </tr>
  </table>
</center>

## 👔 Business Requirements
```
Setup a small Flutter proof of concept app<br> Fetch users from https://jsonplaceholder.typicode.com/users<br> Display a list of 5 random users by name, email and company name.<br> A tap on a user in the list should show the details for that user.

You can start from this code or create your own.

We have no specific requirements regarding state management or other frameworks.

```

## 👀 Folder structure

```
lib/
├─ core/
├─ features/
│  ├─ users/
│  │  ├─ data/
│  │  │  ├─ models/
│  │  │  ├─ sources/
│  │  ├─ domain/
│  │  │  ├─ entities/
│  │  │  ├─ repositories/
│  │  ├─ presentation/
│  │  │  ├─ cubit/
│  │  │  ├─ ui/
```

## 🧹 Linting
Common lint rules were enforced ensuring consistent code quality and best practices throughout the development process.
``` flutter analyze
Analyzing app...
No issues found! (ran in 0.8s)
```
## ✍️ Decisions

The app, while simple, was implemented with scalability, reliability, and testability in mind. It follows a CLEAN architecture with a BLoC (Cubit) state management.

---
```
🧡🧡🧡 Thank you so much! - Stefano 🧡🧡🧡
```
---

# 🎓 CampusHub - Student Marketplace

A **Java EE Web Application** for a campus-based marketplace where students can buy and sell products within their university community. Built with JSP, Servlets, Tailwind CSS, and Derby Database.

---

## ✨ Features

- 🔐 User authentication (Login/Register)
- 🛍️ Browse products by categories
- 🔍 Search functionality
- 🛒 Shopping cart & checkout
- 💳 Payment processing
- 👤 User profiles
- 📦 Seller dashboard (manage listings, orders)
- 💬 Messaging system
- 🔔 Notifications

---

## 🚀 Quick Setup

### 1. Clone Repository

```bash
git clone https://github.com/syahrulx/campus-hub.git
```

### 2. Copy Database

Copy `setup/campus_db` folder to your Derby location:

- **Mac/Linux**: `~/.netbeans-derby/`
- **Windows**: `C:\Users\<YourName>\.netbeans-derby\`

### 3. Open in NetBeans

File → Open Project → Select `campus-hub` folder

### 4. Start Derby Database

Services tab → Java DB → Right-click → **Start Server**

### 5. Run Project

Right-click project → **Run**

App opens at: `http://localhost:8080/campushub/`

---

## 🗄️ Database Details

| Property | Value           |
| -------- | --------------- |
| Type     | Java DB (Derby) |
| Name     | `campus_db`     |
| User     | `app`           |
| Password | `app`           |

---

## � Project Structure

```
campus-hub/
├── setup/
│   ├── campus_db/              # Derby database files
│   └── campus_db.sql           # SQL schema
├── src/java/com/campushub/
│   ├── bean/                   # Data models (User, Product, Cart)
│   ├── servlet/                # Controllers (18 servlets)
│   └── util/                   # DatabaseHelper
├── web/
│   ├── css/changes.css         # Global styles
│   ├── images/                 # Assets
│   ├── header.jsp              # Shared header
│   ├── footer.jsp              # Shared footer
│   └── *.jsp                   # View pages
└── nbproject/                  # NetBeans config
```

---

## 📄 Pages Overview

### Authentication

| Page                 | Description              |
| -------------------- | ------------------------ |
| `login.jsp`          | User login               |
| `register.jsp`       | New account registration |
| `forgotPassword.jsp` | Password recovery        |

### Marketplace

| Page                | Description         |
| ------------------- | ------------------- |
| `userHome.jsp`      | User dashboard      |
| `viewProducts.jsp`  | Browse all products |
| `categories.jsp`    | Browse by category  |
| `searchResults.jsp` | Search results      |
| `productDetail.jsp` | Product details     |

### Shopping

| Page                    | Description          |
| ----------------------- | -------------------- |
| `cartDetails.jsp`       | Shopping cart        |
| `payment.jsp`           | Checkout             |
| `paymentProcessing.jsp` | Processing animation |
| `orderSuccess.jsp`      | Order confirmation   |
| `orderDetails.jsp`      | Order tracking       |

### Seller Dashboard

| Page                 | Description       |
| -------------------- | ----------------- |
| `sellerListings.jsp` | My listings       |
| `sellerOrders.jsp`   | Incoming orders   |
| `addProduct.jsp`     | Add new product   |
| `editProduct.jsp`    | Edit product      |
| `shippedItems.jsp`   | Shipped orders    |
| `unshippedItems.jsp` | Pending shipments |

### Profile & Communication

| Page                | Description   |
| ------------------- | ------------- |
| `userProfile.jsp`   | View profile  |
| `editProfile.jsp`   | Edit profile  |
| `messages.jsp`      | Chat system   |
| `notifications.jsp` | Notifications |

---

## 🛠️ Technologies

- **Backend**: Java EE (JSP & Servlets)
- **Database**: Apache Derby (Java DB)
- **Frontend**: Tailwind CSS, Modern UI
- **Server**: GlassFish 5
- **IDE**: NetBeans

---

## 👨‍💻 Author

**Syahrul**  
📧 syahrul@gmail.com

---

_© 2024 CampusHub. All Rights Reserved._

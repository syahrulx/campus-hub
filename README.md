# 🎓 CampusHub - Student Marketplace

A **Java JSP Web Application** for a campus-based marketplace application where students can buy and sell products within their university community.

---

## 📂 Project Structure

```
campusmarketplacehtml/
├── src/                    # Java source code (Controllers, Models)
├── WEB-INF/                # Web configuration (web.xml)
├── css/                    # Stylesheets
│   └── changes.css         # Main custom styles
├── images/                 # Image assets
├── index.jsp               # 🏠 Landing page
└── [feature pages...]      # Individual JSP feature pages
```

---

## 🚀 How to Run

1. Deploy the project to a servlet container (e.g., Apache Tomcat).
2. Start the server.
3. Open `http://localhost:8080/campusmarketplacehtml/` (or your configured context path) in a web browser.
4. Navigate through the application using the links and buttons.

---

## 📄 Page Navigation Guide

### 🔐 Authentication Flow

| Page                 | Description                         |
| -------------------- | ----------------------------------- |
| `index.jsp`          | Landing page with featured products |
| `login.jsp`          | User login form                     |
| `register.jsp`       | New user registration               |
| `forgotPassword.jsp` | Password recovery                   |

### 🏠 User Dashboard

| Page              | Description                   |
| ----------------- | ----------------------------- |
| `userHome.jsp`    | User's personalized home page |
| `userProfile.jsp` | View user profile             |
| `editProfile.jsp` | Edit profile information      |

### 🛍️ Shopping Experience

| Page                | Description                |
| ------------------- | -------------------------- |
| `categories.jsp`    | Browse product categories  |
| `searchResults.jsp` | Product search results     |
| `productDetail.jsp` | Individual product details |
| `wishlist.jsp`      | User's saved items         |

### 🛒 Cart & Checkout

| Page               | Description        |
| ------------------ | ------------------ |
| `cartDetails.jsp`  | Shopping cart      |
| `payment.jsp`      | Payment processing |
| `orderSuccess.jsp` | Order confirmation |
| `orderDetails.jsp` | Order details view |

### 👤 Seller Features

| Page                    | Description               |
| ----------------------- | ------------------------- |
| `sellerProfile.jsp`     | Seller's public profile   |
| `sellerListings.jsp`    | Seller's product listings |
| `addProduct.jsp`        | Add new product           |
| `updateProduct.jsp`     | Update existing product   |
| `updateProductById.jsp` | Update product by ID      |
| `removeProduct.jsp`     | Remove product listing    |
| `shippedItems.jsp`      | View shipped orders       |
| `unshippedItems.jsp`    | Pending shipments         |

### 💬 Communication

| Page                | Description            |
| ------------------- | ---------------------- |
| `messages.jsp`      | Buyer-seller messaging |
| `notifications.jsp` | User notifications     |

### 🔧 Template Components

| Page             | Description              |
| ---------------- | ------------------------ |
| `header.jsp`     | Reusable header template |
| `footer.jsp`     | Reusable footer template |
| `navigation.jsp` | Navigation component     |

---

## 🛠️ Technologies Used

- **Java (JSP & Servlets)** - Backend logic and dynamic content
- **HTML5** - Page structure
- **CSS3** - Custom styling (`css/changes.css`)
- **Bootstrap 3.4.0** - Responsive grid & UI components
- **jQuery 3.4.1** - JavaScript interactions
- **Google Fonts (Poppins)** - Typography

---

## 🎯 Recommended User Flow

```
1. index.jsp → Landing Page
        ↓
2. login.jsp → Login
        ↓
3. userHome.jsp → Dashboard
        ↓
4. categories.jsp → Browse
        ↓
5. productDetail.jsp → View Product
        ↓
6. cartDetails.jsp → Add to Cart
        ↓
7. payment.jsp → Checkout
        ↓
8. orderSuccess.jsp → Confirmation
```

---

## 👨‍💻 Author

**Syahrul**
📧 syahrul@gmail.com

---

## 📝 Notes for Lecturer

- This project has been migrated from a static HTML storyboard to a **dynamic Java JSP Web Application**.
- It requires a standard Java Web container (like Apache Tomcat) to run.
- The interface preserves the original design while enabling backend logic integration.

---

_© 2024 CampusHub. All Rights Reserved._

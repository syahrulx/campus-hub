# 🎓 CampusHub - Student Marketplace

A **storyboard prototype** for a campus-based marketplace application where students can buy and sell products within their university community.

---

## 📂 Project Structure

```
campusmarketplacehtml/
├── css/                    # Stylesheets
│   └── changes.css         # Main custom styles
├── images/                 # Image assets
├── index.html              # 🏠 Landing page (start here!)
└── [feature pages...]      # Individual feature pages
```

---

## 🚀 How to Run

1. Open `index.html` in any web browser
2. Navigate through the prototype using the links and buttons

---

## 📄 Page Navigation Guide

### 🔐 Authentication Flow

| Page                  | Description                         |
| --------------------- | ----------------------------------- |
| `index.html`          | Landing page with featured products |
| `login.html`          | User login form                     |
| `register.html`       | New user registration               |
| `forgotPassword.html` | Password recovery                   |

### 🏠 User Dashboard

| Page               | Description                   |
| ------------------ | ----------------------------- |
| `userHome.html`    | User's personalized home page |
| `userProfile.html` | View user profile             |
| `editProfile.html` | Edit profile information      |

### 🛍️ Shopping Experience

| Page                 | Description                |
| -------------------- | -------------------------- |
| `categories.html`    | Browse product categories  |
| `searchResults.html` | Product search results     |
| `productDetail.html` | Individual product details |
| `wishlist.html`      | User's saved items         |

### 🛒 Cart & Checkout

| Page                | Description        |
| ------------------- | ------------------ |
| `cartDetails.html`  | Shopping cart      |
| `payment.html`      | Payment processing |
| `orderSuccess.html` | Order confirmation |
| `orderDetails.html` | Order details view |

### 👤 Seller Features

| Page                     | Description               |
| ------------------------ | ------------------------- |
| `sellerProfile.html`     | Seller's public profile   |
| `sellerListings.html`    | Seller's product listings |
| `addProduct.html`        | Add new product           |
| `updateProduct.html`     | Update existing product   |
| `updateProductById.html` | Update product by ID      |
| `removeProduct.html`     | Remove product listing    |
| `shippedItems.html`      | View shipped orders       |
| `unshippedItems.html`    | Pending shipments         |

### 💬 Communication

| Page                 | Description            |
| -------------------- | ---------------------- |
| `messages.html`      | Buyer-seller messaging |
| `notifications.html` | User notifications     |

### 🔧 Template Components

| Page              | Description              |
| ----------------- | ------------------------ |
| `header.html`     | Reusable header template |
| `footer.html`     | Reusable footer template |
| `navigation.html` | Navigation component     |

---

## 🛠️ Technologies Used

- **HTML5** - Page structure
- **CSS3** - Custom styling (`css/changes.css`)
- **Bootstrap 3.4.0** - Responsive grid & UI components
- **jQuery 3.4.1** - JavaScript interactions
- **Google Fonts (Poppins)** - Typography

---

## 🎯 Recommended User Flow

```
1. index.html → Landing Page
        ↓
2. login.html → Login
        ↓
3. userHome.html → Dashboard
        ↓
4. categories.html → Browse
        ↓
5. productDetail.html → View Product
        ↓
6. cartDetails.html → Add to Cart
        ↓
7. payment.html → Checkout
        ↓
8. orderSuccess.html → Confirmation
```

---

## 👨‍💻 Author

**Syahrul**  
📧 syahrul@gmail.com

---

## 📝 Notes for Lecturer

- This is a **static HTML storyboard** demonstrating the user interface and navigation flow
- No backend functionality is implemented - all forms and buttons redirect to static pages
- All pages follow a consistent design language using the CampusHub branding
- The prototype demonstrates both **buyer** and **seller** perspectives

---

_© 2024 CampusHub. All Rights Reserved._

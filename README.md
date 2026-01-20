# 🎓 CampusHub - Student Marketplace

## 👥 Group Project - CSC584 (Enterprise Web Development)

**Course**: CSC584 - Enterprise Web Development  
**Semester**: January 2026  
**Institution**: Universiti Teknologi MARA (UiTM)

### Team Members

| Name                               | Student ID |
| ---------------------------------- | ---------- |
| Muhammad Syahrul Bin Ahmad Bazlan  | 2025136721 |
| Muhammad Syafiq Bin Syahromsyah    | 2025143763 |
| Amira Najwa Binti Zulkifly         | 2025140181 |
| Noraina Aishah Binti Zulkifli Zaki | 2025190097 |

---

## 📖 About

CampusHub is a **Java EE web application** for a campus-based marketplace where students can buy and sell products within their university community.

### Key Features

- 🔐 User authentication (Login/Register)
- 🛍️ Browse & search products
- 🛒 Shopping cart & checkout
- 💳 Payment processing
- 📦 Order tracking
- 👤 Seller dashboard & listings
- 💬 Messaging system

---

## 🛠️ Tech Stack

| Layer    | Technology               |
| -------- | ------------------------ |
| Backend  | Java EE (JSP & Servlets) |
| Database | Apache Derby (Java DB)   |
| Frontend | Tailwind CSS             |
| Server   | GlassFish 5              |
| IDE      | NetBeans                 |

---

## 🚀 Quick Setup

1. **Clone**: `git clone https://github.com/syahrulx/campus-hub.git`
2. **Copy DB**: Copy `setup/campus_db` to `~/.netbeans-derby/`
3. **Open**: Open project in NetBeans
4. **Start Derby**: Services → Java DB → Start Server
5. **Run**: Right-click project → Run

**Local URL**: `http://localhost:8080/campushub/`

---

## 🌐 Live Demo

**URL**: [http://134.209.111.165:8080/campushub/](http://134.209.111.165:8080/campushub/)

---

## 🗄️ Database

| Property | Value           |
| -------- | --------------- |
| Type     | Java DB (Derby) |
| Name     | `campus_db`     |
| User     | `app`           |
| Password | `app`           |

---

## 📁 Project Structure

```
campushub/
├── src/java/com/campushub/
│   ├── bean/      # Data models
│   ├── dao/       # Data Access Objects
│   ├── servlet/   # Controllers
│   └── util/      # Utilities
├── web/           # JSP pages & assets
└── setup/         # Database files
```

---

_© 2026 CampusHub - CSC584 Group Project. All Rights Reserved._

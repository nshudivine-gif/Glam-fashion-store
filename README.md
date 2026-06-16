# 👗 Glam Fashion Store

A beautiful pink-themed e-commerce fashion store built with HTML, CSS, JavaScript, PHP, and MySQL.

---

## 📁 Project Structure

```
fashionstore/
├── index.html              ← Main website (homepage)
├── database.sql            ← Run this in MySQL Workbench
├── Dockerfile              ← For Docker containerization
├── docker-compose.yml      ← Runs web + database together
├── css/
│   └── style.css           ← All styles (pink theme)
├── js/
│   └── app.js              ← Cart, products, checkout logic
├── php/
│   ├── db.php              ← Database connection (edit credentials)
│   ├── get_products.php    ← API: fetch products
│   ├── get_categories.php  ← API: fetch categories
│   ├── place_order.php     ← API: submit an order
│   ├── add_product.php     ← API: admin adds product
│   ├── admin_orders.php    ← API: view all orders
│   └── admin_stats.php     ← API: dashboard stats
├── admin/
│   └── index.html          ← Admin dashboard
└── .github/
    └── workflows/
        └── deploy.yml      ← CI/CD pipeline
```

---

## 🚀 Setup Instructions (XAMPP/WAMP)

### Step 1 – Set up the Database
1. Open **MySQL Workbench**
2. Connect to your local MySQL server
3. Open `database.sql` (File → Open SQL Script)
4. Click **Execute** (⚡ button)
5. You should see the `glam_fashion` database created with sample products

### Step 2 – Run with XAMPP or WAMP
1. Copy the **entire `fashionstore` folder** into:
   - XAMPP → `C:/xampp/htdocs/fashionstore`
   - WAMP  → `C:/wamp64/www/fashionstore`
2. Start **Apache** and **MySQL** from XAMPP/WAMP control panel
3. Open your browser and go to:
   - 🌐 `http://localhost/fashionstore`
   - 🔧 Admin: `http://localhost/fashionstore/admin`

### Step 3 – Configure DB (if needed)
Edit `php/db.php` with your credentials:
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');     // your username
define('DB_PASS', '');         // your password (empty by default in XAMPP)
define('DB_NAME', 'glam_fashion');
```

---

## 🐳 Docker Setup

```bash
# Build and run everything (web + database)
docker-compose up --build

# Visit: http://localhost:8080
# Admin:  http://localhost:8080/admin
```

---

## ✨ Features

- 🛍️ Product listing with categories and search
- 🛒 Shopping cart (add, remove, update quantities)
- 💳 Checkout with customer details
- 📦 Order management in database
- 🎛️ Admin dashboard (products, orders, add products)
- 📱 Fully responsive mobile design
- 🗄️ MySQL database with proper relations

---

## 🌐 Deployment Options

| Platform | How |
|----------|-----|
| InfinityFree | Upload via FTP, create MySQL DB in dashboard |
| Railway | Connect GitHub repo, add MySQL plugin |
| Render | Connect GitHub, set env vars |
| 000webhost | Upload files, create DB in File Manager |

---

## 📋 Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Backend**: PHP 8+
- **Database**: MySQL (via MySQLi)
- **DevOps**: Docker, Docker Compose, GitHub Actions (CI/CD)
- **Design**: Google Fonts (Playfair Display, Poppins)

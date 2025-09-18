# 🛒 E-commerce Store Database (MySQL)

## 📌 Project Overview
This project is a **relational database** built in **MySQL** to model a simple e-commerce store.  
It includes customers, products, orders, payments, and shipping details, with well-defined relationships and constraints.

## 🎯 Objectives
- Demonstrate the design of a relational database schema.
- Implement **one-to-one**, **one-to-many**, and **many-to-many** relationships.
- Use constraints (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`) to enforce data integrity.
- Insert sample data for testing.

## 🗂️ Database Schema
- **Customers** → Stores customer details.  
- **Products** → Contains product catalog.  
- **Orders** → Records customer orders.  
- **OrderDetails** → Many-to-many relationship between Orders and Products.  
- **Payments** → Tracks payments made for each order.  
- **Shipping** → Stores shipping details (one-to-one with orders).  

## 🔗 Relationships
- **One-to-Many**: Customers → Orders  
- **Many-to-Many**: Orders ↔ Products (via OrderDetails)  
- **One-to-One**: Orders → Shipping  


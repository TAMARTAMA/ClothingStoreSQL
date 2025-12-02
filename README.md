# ClothingStoreSQL
## 📘 Store Clothes – SQL Database Project

A full SQL Server project for managing a clothing store: customers, sellers, orders, models, sizes, categories, and inventory.

# 📌 Overview

This system models all operations of a clothing store and provides:

Customer & order management

Inventory and size tracking

Staff & manager hierarchy

Category and model organization

Business insights through SQL queries

# 🗂️ Data Model

Main entities:

City, Customer, Seller

Category, Model, Size

Orders, OrderDetail

Key relations:

Sellers & customers belong to a city

Each seller has a manager

Each order belongs to a customer + seller

Size ↔ Model ↔ Category

OrderDetail links orders to sizes

# 🔒 Constraints

Unique ModelName

Valid size: 0–60

Inventory ≥ 0

DateOrder ≤ today

Non-null price, city name

Order quantity ≥ 1

# 🧱 SQL Structure (DDL)

Includes full creation of tables with:

Primary / Foreign Keys

CHECK constraints

Identity columns

Data integrity logic

# 📊 Queries (DQL)

Examples:

Customers with >2 orders

Most expensive model

Items above category average

Top 5 inventory items

Top 5 most-purchased items

Orders info View

Average orders per customer

Sellers & managers (including hierarchy CTE)

 # ⚙️ Functions & Procedures

Functions:

Check if order exists

Check inventory availability

Return items available in a specific size

Procedures:

Update inventory

Calculate customer's total purchase amount

Add item to existing/new order

# 🔥 Trigger

updateInventory

After inserting an order detail

Validates stock

Updates or cancels the insert accordingly

# 🧩 Dynamic SQL

Procedure that receives table + column + value
→ builds and runs a dynamic SELECT.

# 🛠️ DML Procedures

Insert customer

Update customer (dynamic SQL)

Delete customer

# ⚡ Indexes

Customer(CusFirstName, CusLastName)

City(CityName)

# ✅ Summary

A compact SQL Server project demonstrating:

✔ Full relational schema
✔ Business logic (functions, procs, trigger)
✔ Useful analytical queries
✔ Data integrity & indexing
✔ Realistic store management system

A complete, fully functional database system for a clothing store.

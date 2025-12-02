# ClothingStoreSQL
📘 Store Clothes – SQL Database Project

A complete SQL Server project that models and manages the information system of a clothing store.
The project includes a full relational schema, ERD, table creation scripts, constraints, functions, stored procedures, triggers, views, DML operations, dynamic SQL, and indexes.

📌 Project Overview

This project represents a clothing store that sells a wide variety of models, sizes, categories, and colors.
The system manages:

Customers

Sellers (with manager hierarchy)

Orders

Order Details

Models & Categories

Sizes & Inventory

Cities

The goal of the project is to design and implement a complete database solution supporting store operations, analytics, and internal management.

🎯 System Goals

Efficient management of clothing items, sizes, and categories

Tracking customers and their orders

Identifying popular items

Managing product inventory

Managing staff and manager relationships

Monitoring employee sales and salary-related analysis

🗂️ Data Model (ERD)

The system includes the following entities:

City

Customer

Seller

Category

Model

Size

Orders

OrderDetail

Key Relationships

Each customer belongs to a city

Each seller belongs to a city and has a manager

Each order is linked to both a customer and a seller

Each order contains one or more order details

Each model belongs to a category

Each model has multiple sizes

OrderDetail links Orders ↔ Sizes

(ERD diagram included in the presentation)

🔒 Data Constraints

The system enforces strong data integrity through constraints such as:

Unique ModelName

Size must be between 0–60

Model price cannot be NULL

OrderDate must be ≤ today

CityName is unique and not NULL

Inventory must be ≥ 0

Order quantity must be ≥ 1

🧱 Table Creation (DDL)

Includes full SQL scripts for:

Primary Keys

Foreign Keys

Check Constraints

Identity columns

Data integrity rules

📊 Part C – Data Extraction & Processes
🔍 Main SELECT Queries

Customers with more than 2 orders

Distinct categories assigned to models

Most expensive model

Items priced above category average

View combining orders with model, category & size details

Average number of orders per customer

Product counts by color

Top 5 items with highest inventory

Top 5 most purchased items

Average price per size (with HAVING)

Sellers and their managers

Seller hierarchy levels using CTE

Sellers with at least one customer order

Sellers earning above average salary

🧮 Functions (UDF)

IfThereOrder

Returns 1/0 depending on whether an order exists

IfStayInventory

Checks whether enough inventory is available for a size

OrderBySize (Table Function)

Returns all items of a specific size that have sufficient inventory

⚙️ Stored Procedures

UpdateAmount

Updates inventory when an item is purchased

Uses inventory-check function

TotalPrice

Calculates total purchase amount for a given customer

AddOrderDetail

If order exists → adds item

If not → creates new order and then adds item

🔥 Trigger: updateInventory

A trigger executed after insertion into OrderDetail:

Validates inventory availability

Deducts inventory if possible

If insufficient inventory → removes the inserted row and prints a warning

🧩 Dynamic SQL

Stored procedure:

search @column, @data, @table


Dynamically constructs and executes a SELECT based on table/column/value input.

🛠️ DML Operations
Includes procedures for:

Inserting a new customer

Updating customer fields using Dynamic SQL

Deleting a customer record

⚡ Indexes

Performance optimization:

Index on Customer(CusFirstName, CusLastName)

Index on City(CityName)

✅ Summary

This SQL Server project demonstrates:

✔ Relational database modeling
✔ Full schema + ERD
✔ Advanced SQL queries
✔ Functions & stored procedures
✔ Trigger-based logic
✔ Dynamic SQL
✔ Data integrity constraints
✔ Performance optimization with indexes

A complete, fully functional database system for a clothing store.

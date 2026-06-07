# Personal Finance Management System

## Overview

This project is a personal finance management system developed using Python, Streamlit and MySQL.

The application allows users to manage accounts, income and expense transactions while maintaining data integrity through a normalized relational database design and automated audit logging.

The project was developed as part of a university database systems course and focuses on relational modeling, SQL implementation, database auditing and cloud deployment.

---

## Features

* User management
* Account management
* Income and expense tracking
* Relational database design (3NF)
* MySQL cloud deployment
* Automated audit logging using triggers
* Transaction history management
* CRUD operations through a Streamlit interface

---

## Technologies Used

### Backend

* Python
* Streamlit

### Database

* MySQL
* SQL
* Triggers
* Foreign Keys
* Referential Integrity

### Cloud Infrastructure

* Aiven for MySQL

---

## Database Design

The relational model follows Third Normal Form (3NF) principles to reduce redundancy and ensure consistency.

Main entities:

* Users
* Accounts
* Categories
* Transactions
* Audit Log

---

## Audit System

A database-level auditing mechanism was implemented using MySQL triggers.

The audit system automatically records:

* Insert operations
* Delete operations
* User information
* Previous values
* New values
* Timestamp of each event

This approach ensures traceability and improves data integrity.

---

## Application Screenshots

### Entity Relationship Diagram

(Add image here)

### Transaction Management Interface

(Add image here)

### Audit Log Report

(Add image here)

---

## Project Structure

database/
Database schema, triggers and sample data

app/
Streamlit application source code

images/
Screenshots and diagrams

docs/
Technical documentation

---

## Learning Outcomes

This project strengthened skills in:

* Relational database modeling
* SQL development
* Trigger implementation
* Database auditing
* Cloud database deployment
* Python application development
* Data integrity and security concepts

---

## Future Improvements

* User authentication
* Budget planning module
* Interactive dashboards
* Financial analytics
* Data visualization tools
* Exportable reports

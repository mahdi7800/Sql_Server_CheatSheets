# SQL Server CheatSheets

A practical collection of SQL Server backup, disaster recovery and advanced query scenarios, compiled in 2019 after attending Eng. Parviz Aghasadeghi’s SQL Server classes.

---

# 📚 Topics Covered

## Database Design & Schema Management

* ERP Database Design
* Schema Creation & Management
* Table Structure Design
* Database Object Organization

## Data Definition Language (DDL)

* ALTER TABLE Operations
* Column Management
* Table Structure Modification
* DROP, DELETE and TRUNCATE Comparison

## Data Manipulation Language (DML)

* INSERT INTO
* SELECT INTO
* UPDATE Operations
* Data Migration Examples

## SQL Server Administration (DBA)

* System Functions
* System Variables
* Error Handling Functions
* Backup & Recovery Operations

## Backup & Disaster Recovery

* Full Backup
* Differential Backup
* Transaction Log Backup
* Tail-Log Backup
* Log File Recovery
* Emergency Recovery Scenarios

## Reporting & Analytics

* Aggregate Reports
* GROUP BY & GROUPING SETS
* PIVOT Reports
* Window Functions
* Ranking Functions
* Product & Sales Analysis

## Advanced SQL Techniques

* Subqueries
* EXISTS
* ANY
* ALL
* IN
* CASE Expressions
* Window Functions
* Views

---

# 📂 Repository Structure

## Database Design

### demo_erp_database_design.sql

Practical ERP database design example including relational database concepts and object organization.

### demo_schema_management_examples.sql

Examples of schema creation, management, and organization of database objects.

---

## DDL & Table Management

### demo_table_alter_operations.sql

Examples of modifying table structures using ALTER TABLE.

### demo_update_and_alter_table.sql

Table updates and structural modifications.

### demo_drop_truncate_delete.sql

Comparison and practical usage of:

* DROP
* TRUNCATE
* DELETE

Including behavioral differences and use cases.

---

## Data Manipulation

### demo_insert_select_into.sql

Examples of:

* INSERT INTO
* SELECT INTO
* Data Copy Operations

---

## Backup & Recovery

### demo_sql_backup_commands.sql

Demonstrates:

* Full Backup
* Differential Backup
* Transaction Log Backup

Features:

* INIT
* CHECKSUM
* COMPRESSION
* STOP_ON_ERROR

### demo_tail_log_backup.sql

Tail-Log Backup scenarios for disaster recovery and last transaction protection.

Features:

* NO_TRUNCATE
* NORECOVERY
* CONTINUE_AFTER_ERROR

### demo_rebuild_log_file.sql

Emergency recovery scenario when MDF files remain intact but the LDF file is missing or corrupted.

Includes:

* EMERGENCY Mode
* Log File Rebuild
* MULTI_USER Recovery

⚠️ Intended for emergency situations only.

---

## System Functions & Utilities

### demo_system_functions_and_variables.sql

Examples of SQL Server system functions and variables including:

* GETDATE()
* SUSER_SNAME()
* APP_NAME()
* HOST_NAME()
* @@TRANCOUNT
* @@ERROR
* @@SPID
* @@IDENTITY
* SCOPE_IDENTITY()

Error Handling Functions:

* ERROR_NUMBER()
* ERROR_MESSAGE()
* ERROR_LINE()
* ERROR_PROCEDURE()

---

## Reporting & Advanced Queries

### report_products_price_range.sql

Product classification by price range:

* Cheap
* Moderate
* Expensive

### report_employee_orders_freight_by_year.sql

Employee sales and freight reporting with yearly analysis.

### report_employee_order_count_pivot.sql

Employee order count report using PIVOT techniques.

### report_max_price_product_per_category.sql

Finding the most expensive product within each category using joins and subqueries.

### report_lowest_order_sales_comparison.sql

Order comparison reports using ranking and analytical techniques.

### report_products_summary_by_category_supplier.sql

Product summaries grouped by category and supplier.

### report_top5_active_products_sales.sql

Top five active products based on sales performance.

---

## Advanced Query Examples

### demo_subquery_operators_all_any_exists_in.sql

Examples of:

* EXISTS
* ANY
* ALL
* IN

and subquery comparison techniques.

### demo_aggregation_and_groupby_reports.sql

Aggregation reports using:

* GROUP BY
* Aggregate Functions
* Reporting Queries

### demo_custom_orderby_case.sql

Conditional sorting using CASE expressions.

### demo_window_functions_reports.sql

Window function examples including ranking and analytical calculations.

### demo_window_View_reports.sql

Advanced reporting examples using Views and Window Functions.

---

# 🧠 Skills Demonstrated

This repository demonstrates practical experience in:

* SQL Server Administration
* Database Design
* Backup & Recovery
* Disaster Recovery
* T-SQL Development
* Reporting & Analytics
* Window Functions
* Aggregate Queries
* Query Optimization Concepts
* Relational Database Design

---

# 🎯 Target Audience

* SQL Server DBAs
* Backend Developers
* Database Engineers
* Database Administrators
* Computer Science Students
* SQL Learners

---

# ⚠️ Important Notes

* Review scripts before executing them in production environments.
* Update database names and file paths according to your environment.
* Some scripts are designed for educational and demonstration purposes.
* Test recovery and backup scripts in isolated environments before production use.

---

# 📸 Screenshots

The repository contains sample screenshots demonstrating query results and report outputs.

* p1.jpg
* p2.jpg
* p3.png

---

# 📢 License

This repository is intended for educational and learning purposes.

Free to use, study, and share.

---

## Author

Mahdi Davoudi

## Technologies

* Microsoft SQL Server
* T-SQL
* SQL Server Management Studio (SSMS)

## Repository Focus

SQL Server Administration, Database Design, Reporting, Backup & Recovery, and Advanced Query Techniques.

---

---

# 🇮🇷 راهنمای فارسی

## معرفی پروژه


این مجموعه در سال **۲۰۱۹** و پس از شرکت در کلاس‌های  
**مهندس پرویز آقاصادقی**  
جمع‌آوری و تکمیل شده است

محتوای پروژه موضوعات مختلفی از جمله طراحی پایگاه داده، مدیریت ساختار جداول، گزارش‌گیری، توابع پیشرفته SQL Server، Backup و Recovery را پوشش می‌دهد و می‌تواند برای دانشجویان، برنامه‌نویسان و مدیران پایگاه داده مفید باشد.

---

# 📚 سرفصل‌های اصلی

## طراحی پایگاه داده و مدیریت Schema

* طراحی پایگاه داده ERP
* ایجاد و مدیریت Schema
* طراحی ساختار جداول
* سازماندهی اشیاء پایگاه داده

## دستورات DDL

* مدیریت و ویرایش جداول
* افزودن و حذف ستون‌ها
* تغییر ساختار جداول
* بررسی تفاوت DROP ، DELETE و TRUNCATE

## دستورات DML

* INSERT INTO
* SELECT INTO
* UPDATE
* انتقال و کپی داده‌ها

## مدیریت SQL Server (DBA)

* توابع سیستمی
* متغیرهای سیستمی
* مدیریت خطاها
* عملیات Backup و Recovery

## پشتیبان‌گیری و بازیابی اطلاعات

* Full Backup
* Differential Backup
* Transaction Log Backup
* Tail-Log Backup
* بازیابی فایل‌های Log
* سناریوهای بازیابی در شرایط بحرانی

## گزارش‌گیری و تحلیل داده

* گزارش‌های تجمیعی
* GROUP BY
* GROUPING SETS
* PIVOT
* Window Functions
* تحلیل فروش و محصولات

## مباحث پیشرفته SQL

* Subquery
* EXISTS
* ANY
* ALL
* IN
* CASE
* Window Functions
* View

---

# 📂 ساختار فایل‌ها

## طراحی پایگاه داده

### demo_erp_database_design.sql

نمونه‌ای از طراحی پایگاه داده ERP شامل جداول، روابط و ساختار منطقی داده‌ها.

### demo_schema_management_examples.sql

نمونه‌های کاربردی برای ایجاد و مدیریت Schema در SQL Server.

---

## مدیریت ساختار جداول

### demo_table_alter_operations.sql

نمونه‌های مختلف تغییر ساختار جداول با استفاده از ALTER TABLE.

### demo_update_and_alter_table.sql

مثال‌هایی برای بروزرسانی داده‌ها و تغییر ساختار جداول.

### demo_drop_truncate_delete.sql

بررسی تفاوت‌ها و کاربردهای:

* DROP
* TRUNCATE
* DELETE

---

## مدیریت داده‌ها

### demo_insert_select_into.sql

نمونه‌هایی از:

* INSERT INTO
* SELECT INTO
* انتقال داده بین جداول

---

## Backup و Recovery

### demo_sql_backup_commands.sql

نمونه‌های عملی:

* Full Backup
* Differential Backup
* Transaction Log Backup

به همراه گزینه‌های:

* CHECKSUM
* COMPRESSION
* INIT
* STOP_ON_ERROR

### demo_tail_log_backup.sql

سناریوهای Tail-Log Backup برای جلوگیری از از دست رفتن آخرین تراکنش‌ها.

### demo_rebuild_log_file.sql

نمونه بازیابی پایگاه داده در شرایطی که فایل Log آسیب دیده یا حذف شده است.

شامل:

* EMERGENCY Mode
* Rebuild Log
* MULTI_USER Mode

---

## توابع و ابزارهای سیستمی

### demo_system_functions_and_variables.sql

نمونه‌های کاربردی از:

* GETDATE()
* APP_NAME()
* HOST_NAME()
* SUSER_SNAME()
* @@ERROR
* @@SPID
* @@TRANCOUNT
* SCOPE_IDENTITY()

همراه با توابع مدیریت خطا.

---

## گزارش‌گیری و تحلیل داده

### report_products_price_range.sql

دسته‌بندی محصولات بر اساس بازه قیمتی.

### report_employee_orders_freight_by_year.sql

گزارش سفارش‌ها و هزینه حمل بر اساس سال.

### report_employee_order_count_pivot.sql

گزارش Pivot تعداد سفارش‌های کارکنان.

### report_max_price_product_per_category.sql

نمایش گران‌ترین محصول هر دسته.

### report_lowest_order_sales_comparison.sql

مقایسه سفارش‌ها با استفاده از توابع تحلیلی.

### report_products_summary_by_category_supplier.sql

گزارش محصولات بر اساس دسته‌بندی و تأمین‌کننده.

### report_top5_active_products_sales.sql

نمایش ۵ محصول فعال با بیشترین میزان فروش.

---

## مثال‌های پیشرفته SQL

### demo_subquery_operators_all_any_exists_in.sql

نمونه‌های عملی:

* EXISTS
* ANY
* ALL
* IN

### demo_aggregation_and_groupby_reports.sql

گزارش‌های تجمیعی با استفاده از:

* GROUP BY
* Aggregate Functions

### demo_custom_orderby_case.sql

مرتب‌سازی شرطی داده‌ها با CASE.

### demo_window_functions_reports.sql

نمونه‌های مختلف Window Functions و Ranking.

### demo_window_View_reports.sql

گزارش‌گیری پیشرفته با View و Window Functions.

---

# 🧠 مهارت‌های پوشش داده شده

این Repository مهارت‌های زیر را پوشش می‌دهد:

* مدیریت SQL Server
* طراحی پایگاه داده
* Backup و Recovery
* Disaster Recovery
* توسعه T-SQL
* گزارش‌گیری و تحلیل داده
* Window Functions
* توابع تجمیعی
* طراحی پایگاه داده رابطه‌ای
* مفاهیم بهینه‌سازی کوئری

---

# 🎯 مناسب برای

* مدیران پایگاه داده (DBA)
* برنامه‌نویسان Backend
* مهندسان پایگاه داده
* دانشجویان علوم کامپیوتر
* علاقه‌مندان به SQL Server

---

# ⚠️ نکات مهم

* قبل از اجرای اسکریپت‌ها در محیط Production حتماً تست انجام دهید.
* مسیر فایل‌ها و نام پایگاه داده را متناسب با محیط خود تغییر دهید.
* برخی اسکریپت‌ها صرفاً برای آموزش و یادگیری تهیه شده‌اند.
* سناریوهای Backup و Recovery را ابتدا در محیط آزمایشی بررسی کنید.

---

# 📸 تصاویر پروژه

فایل‌های زیر شامل نمونه خروجی‌ها و تصاویر پروژه هستند:

* p1.jpg
* p2.jpg
* p3.png

---

# 📢 مجوز استفاده

این پروژه با هدف آموزش و یادگیری منتشر شده است.

استفاده، مطالعه، توسعه و اشتراک‌گذاری آن آزاد است.

---

## توسعه‌دهنده

Mahdi Davoudi

## فناوری‌های استفاده شده

* Microsoft SQL Server
* T-SQL
* SQL Server Management Studio (SSMS)

## تمرکز اصلی پروژه

مدیریت SQL Server، طراحی پایگاه داده، گزارش‌گیری، Backup و Recovery و تکنیک‌های پیشرفته T-SQL


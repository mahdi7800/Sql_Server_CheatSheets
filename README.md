# Sql_Server_CheatSheets

# SQL Server Backup & Recovery Scenarios

این مجموعه در سال **۲۰۱۹** و پس از شرکت در کلاس‌های  
**مهندس پرویز آقاصادقی**  
جمع‌آوری و تکمیل شده است.

محتوای این فولدر شامل مجموعه‌ای کامل از **اسکریپت‌های آموزشی و عملی SQL Server** با تمرکز بر:

- Backup & Restore
- Disaster Recovery
- Crash Scenarios
- System Functions & DBA Utilities
- Reporting & Advanced Queries

تمام فایل‌ها بر اساس سناریوهای واقعی طراحی شده‌اند و مناسب **DBAها، برنامه‌نویسان بک‌اند و علاقه‌مندان SQL Server** هستند.

---

## 📌 Backup & Disaster Recovery Files

### 1️⃣ demo_sql_backup_commands.sql
**موضوع:**  
Full Backup ، Differential Backup ، Transaction Log Backup

**کاربرد:**
- بکاپ‌گیری استاندارد و امن
- مناسب سناریوهای روزمره و سازمانی

**پوشش می‌دهد:**
- `INIT`
- `CHECKSUM`
- `COMPRESSION`
- `STOP_ON_ERROR`

---

### 2️⃣ demo_tail_log_backup.sql
**موضوع:** Tail-Log Backup

**سناریوی استفاده:**
- قبل از Restore
- قبل از عملیات بحرانی
- جلوگیری از از دست رفتن آخرین تراکنش‌ها

**ویژگی‌ها:**
- `NO_TRUNCATE`
- `NORECOVERY`
- `CONTINUE_AFTER_ERROR`

---

### 3️⃣ demo_rebuild_log_file.sql
**موضوع:** Rebuild Log File

**سناریو:**
- فایل‌های دیتا سالم هستند
- فایل لاگ (LDF) خراب یا حذف شده

**مراحل:**
1. EMERGENCY Mode
2. REBUILD LOG
3. MULTI_USER

⚠️ فقط در شرایط خاص استفاده شود.

---

## 📌 System & DBA Utility Files

### 4️⃣ demo_system_functions_and_variables.sql
**موضوع:**  
System Functions & System Variables

**شامل:**
- `GETDATE()`
- `SUSER_SNAME()`
- `APP_NAME()`
- `HOST_NAME()`
- `@@TRANCOUNT`
- `@@ERROR`
- `@@SPID`
- `@@IDENTITY`
- `SCOPE_IDENTITY()`
- Error Functions (`ERROR_NUMBER`, `ERROR_MESSAGE`, ...)

---

### 5️⃣ demo_database_audit_log.sql
**موضوع:** Audit Log با Trigger

**ویژگی‌ها:**
- ثبت `INSERT`, `UPDATE`, `DELETE`
- ذخیره:
  - نوع عملیات
  - تاریخ
  - لاگین
  - نام برنامه
  - Host
  - IP Address
- دیتابیس جداگانه برای Audit

---

## 📊 Reporting & Advanced Query Files

### 6️⃣ report_product_price_range.sql
- دسته‌بندی محصولات بر اساس قیمت (Cheap / Moderate / Expensive)

### 7️⃣ report_employee_sales_summary.sql
- گزارش فروش کارمندان
- GROUPING SETS
- شمارش سفارش و جمع Freight

### 8️⃣ report_employee_sales_pivot.sql
- Pivot فروش سالانه کارمندان
- محاسبه Total

### 9️⃣ report_any_all_exists_queries.sql
- استفاده از `ANY`, `ALL`, `EXISTS`, `IN`
- مقایسه زیرکوئری‌ها

### 🔟 report_top_sales_orders.sql
- پیدا کردن کم‌فروش‌ترین سفارش هر مشتری
- Ranking و Window Functions

### 1️⃣1️⃣ report_category_max_price.sql
- گران‌ترین محصول هر دسته
- Subquery و Join

### 1️⃣2️⃣ report_custom_sorting.sql
- مرتب‌سازی شرطی با `CASE`

### 1️⃣3️⃣ report_grouping_sets.sql
- گزارش ترکیبی با `GROUPING SETS`

### 1️⃣4️⃣ report_sales_and_customers.sql
- گزارش فروش محصولات
- گزارش مشتریان بر اساس کشور و شهر
- تحلیل سفارشات سالانه

### 1️⃣5️⃣ report_top5_active_products_sales.sql
- 5 محصول پرفروش فعال
- حذف محصولات Discontinued

---

## 🧠 Covered Scenarios Summary

- Full / Diff / Log Backup Strategy
- Tail-Log Backup
- Physical Crash
- Log File Corruption
- Emergency Mode Recovery
- Audit Logging
- Advanced Reporting
- Window Functions & Pivot

---

## 🎯 Target Audience

- SQL Server DBA
- Backend Developers
- Database Engineers
- SQL Learners

---

## ⚠️ Important Notes

- قبل از اجرا در Production تست شود
- مسیر فایل‌ها و نام دیتابیس را اصلاح کنید
- برخی اسکریپت‌ها آموزشی هستند

---

## 📢 License & Usage

استفاده آموزشی و انتشار آزاد است  
مناسب کانال‌های آموزشی (مانند تلگرام)

---

**Author:** Mahdi Davoudi  
**Topic:** SQL Server Backup, Recovery & Advanced Scenarios

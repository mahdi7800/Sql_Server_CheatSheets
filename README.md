# Sql_Server_CheatSheets


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

# 📌 Backup & Disaster Recovery Files

## 1️⃣ demo_sql_backup_commands.sql

**موضوع:**

Full Backup، Differential Backup و Transaction Log Backup

**کاربرد:**

* پیاده‌سازی استراتژی استاندارد بکاپ‌گیری
* مناسب برای محیط‌های عملیاتی و سازمانی

**پوشش می‌دهد:**

* INIT
* CHECKSUM
* COMPRESSION
* STOP_ON_ERROR

---

## 2️⃣ demo_tail_log_backup.sql

**موضوع:**

Tail-Log Backup

**سناریوی استفاده:**

* قبل از عملیات Restore
* قبل از انجام تغییرات بحرانی
* جلوگیری از از دست رفتن آخرین تراکنش‌ها

**ویژگی‌ها:**

* NO_TRUNCATE
* NORECOVERY
* CONTINUE_AFTER_ERROR

---

## 3️⃣ demo_rebuild_log_file.sql

**موضوع:**

Rebuild Log File

**سناریو:**

* فایل‌های دیتا (MDF/NDF) سالم هستند.
* فایل لاگ (LDF) حذف یا خراب شده است.

**مراحل اجرا:**

* EMERGENCY Mode
* REBUILD LOG
* MULTI_USER Mode

⚠️ این اسکریپت تنها در شرایط اضطراری و با آگاهی کامل استفاده شود.

---

# 📌 System & DBA Utility Files

## 4️⃣ demo_system_functions_and_variables.sql

**موضوع:**

System Functions & System Variables

**شامل:**

* GETDATE()
* SUSER_SNAME()
* APP_NAME()
* HOST_NAME()
* @@TRANCOUNT
* @@ERROR
* @@SPID
* @@IDENTITY
* SCOPE_IDENTITY()

همچنین شامل توابع مدیریت خطا:

* ERROR_NUMBER()
* ERROR_MESSAGE()
* ERROR_LINE()
* ERROR_PROCEDURE()

---

## 5️⃣ demo_database_audit_log.sql

**موضوع:**

Audit Log با استفاده از Trigger

**ویژگی‌ها:**

* ثبت عملیات INSERT
* ثبت عملیات UPDATE
* ثبت عملیات DELETE

**اطلاعات ذخیره‌شده:**

* نوع عملیات
* تاریخ و زمان
* نام کاربری
* نام برنامه
* Host Name
* IP Address

همراه با پایگاه داده مجزا برای نگهداری لاگ‌های Audit.

---

# 📊 Reporting & Advanced Query Files

## 6️⃣ report_product_price_range.sql

دسته‌بندی محصولات بر اساس بازه قیمت:

* Cheap
* Moderate
* Expensive

---

## 7️⃣ report_employee_sales_summary.sql

گزارش فروش کارمندان با استفاده از:

* GROUPING SETS
* شمارش سفارش‌ها
* مجموع Freight

---

## 8️⃣ report_employee_sales_pivot.sql

گزارش Pivot فروش سالانه کارمندان به همراه محاسبه Total.

---

## 9️⃣ report_any_all_exists_queries.sql

نمونه‌های کاربردی:

* ANY
* ALL
* EXISTS
* IN

و مقایسه عملکرد زیرکوئری‌ها.

---

## 🔟 report_top_sales_orders.sql

یافتن کم‌فروش‌ترین سفارش هر مشتری با استفاده از:

* Ranking Functions
* Window Functions

---

## 1️⃣1️⃣ report_category_max_price.sql

نمایش گران‌ترین محصول هر دسته با استفاده از:

* Subquery
* JOIN

---

## 1️⃣2️⃣ report_custom_sorting.sql

مرتب‌سازی شرطی داده‌ها با استفاده از CASE.

---

## 1️⃣3️⃣ report_grouping_sets.sql

گزارش‌های ترکیبی با استفاده از GROUPING SETS.

---

## 1️⃣4️⃣ report_sales_and_customers.sql

شامل:

* گزارش فروش محصولات
* گزارش مشتریان بر اساس کشور و شهر
* تحلیل سفارشات سالانه

---

## 1️⃣5️⃣ report_top5_active_products_sales.sql

نمایش ۵ محصول فعال پرفروش با حذف محصولات Discontinued.

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

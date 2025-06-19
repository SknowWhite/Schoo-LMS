
# School LMS Project

This repository contains a full-stack application built with:
- **Angular** frontend located in the `Portal/` folder.
- **.NET API** backend located in the `WebAPI/` folder.
- **SQL Script** for the database: `LMSDb.sql`.

---

## 📁 Project Structure

```
School LMS/
├── WebAPI/               # .NET backend
├── Portal/               # Angular frontend
├── LMSDb.sql             # SQL Server DB script
├── UsersWithEnglishColumns.xlsx  # Excel reference
├── README.md
├── .gitignore
```

---

## ⚙️ How to Run the Project

### 1. Backend (.NET API)

1. Open the `WebAPI/` folder in Visual Studio.
2. Restore NuGet packages.
3. Update `appsettings.json` with your DB connection string.
4. Run the project (F5 or via `dotnet run`).

### 2. Frontend (Angular)

1. Open terminal and go to the `Portal/` folder.
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the app:
   ```bash
   ng serve
   ```
4. Navigate to `http://localhost:4200/` in your browser.

---

## 🛢️ Database

- The `LMSDb.sql` file contains the database schema and initial data.
- Run it using SQL Server Management Studio (SSMS) or any SQL tool connected to your SQL Server.

---

## 📝 Notes

- Make sure CORS is enabled in the .NET API if running frontend and backend separately.
- Adjust port settings if needed in both `launchSettings.json` and Angular `proxy.conf.json` (if used).

---

## 📄 License

This project is for educational/demo purposes.

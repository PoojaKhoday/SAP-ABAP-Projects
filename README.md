Employee Management ALV Report (ZEMP_MNGT_ALV_REPORT_PPK)

Project Overview
This SAP ABAP project is a classical ALV report to display employee details such as:
- Employee ID (PERNR)
- Complete Name
- Personnel Subarea (Department)
- Basic Pay (Wage Type Amount)

The report retrieves data using JOIN from standard HR tables and displays it in an ALV Grid with auto column optimization and zebra pattern for better readability.

SAP Tables Used
- PA0001 – Organizational Assignment (Employee to Department mapping)  
- PA0002 – Personal Data (Employee Name)  
- PA0008 – Basic Pay (Salary/Wage details)

Features
- Selection Screen to filter employees by Personnel Number (PERNR)
- ALV Grid Display with:
  - Auto column width optimization
  - Zebra line pattern for better readability
- Top-of-Page Header using `REUSE_ALV_COMMENTARY_WRITE`
- Displays a success or error message based on the records fetched

Learning Outcomes
By implementing this project, you will learn:
- Defining internal tables and field catalogs
- Using SELECT with INNER JOIN and LEFT JOIN on SAP HR tables
- Implementing `REUSE_ALV_GRID_DISPLAY` for ALV reporting
- Adding ALV layout features (Zebra pattern, Column width optimization)
- Displaying a custom ALV top-of-page header

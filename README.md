Employee Management ALV Report (ZEMP_MNGT_ALV_REPORT_PPK)

Project Description
This project is an SAP ABAP ALV report that displays employee details, including:
- Employee ID (PERNR)
- Complete Name
- Personnel Subarea (Department)
- Basic Pay

The program retrieves data from SAP HR tables and displays it in an ALV grid.

Tables Used
- PA0001 – Organizational Assignment (Employee → Department)
- PA0002 – Personal Data (Employee Name)
- PA0008– Basic Pay (Salary)

Features
- Selection screen to filter employees by Personnel Number (PERNR)
- ALV display with column headers and sorting
- Info message if no records are found
- Clean and beginner-friendly ABAP implementation

Learning Outcomes
- Internal tables & Field Catalog
- SELECT with JOIN (INNER JOIN and LEFT JOIN)
- ALV report using `REUSE_ALV_GRID_DISPLAY`

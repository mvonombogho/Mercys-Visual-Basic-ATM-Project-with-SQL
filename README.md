# Visual Basic ATM Project with SQL

This is a Visual Basic ATM project with SQL database connection, cloned from [ayushegupta/Visual-studio-Atm-project](https://github.com/ayushegupta/Visual-studio-Atm-project).

## Project Description
This project simulates an ATM system using Visual Basic for the frontend and SQL Server for the database connection. Users can perform basic ATM operations like checking balance, withdrawing money, and more.

## Features
- User authentication with PIN and account number
- Balance inquiry
- Withdrawal
- Deposit
- Fund transfer
- Mini statement

## Setup Instructions

### Prerequisites
- Microsoft Visual Studio 2010 (or later)
- SQL Server (Express edition or higher)
- SQL Server Management Studio (SSMS)

### Database Setup
1. Open SQL Server Management Studio and connect to your database server
2. Create a new database by running the following command:
   ```sql
   CREATE DATABASE atm
   ```
3. Select the newly created `atm` database and execute the SQL scripts in the following order:
   - First, run `SQLQuery1.sql` to create the basic PIN table
   - Then, run `SQLQuery2.sql` to create the Login table with sample data

### Connection String Configuration
1. Open the project in Visual Studio 2010
2. Locate and open the `App.config` file
3. Update the connection strings to match your SQL Server configuration:
   ```xml
   <connectionStrings>
     <add name="conn" connectionString="Data Source=YOUR_SERVER_NAME; Initial Catalog=atm; Integrated Security=True"
       providerName="System.Data.SqlClient" />
     <add name="project.My.MySettings.atmConnectionString" connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=atm;Integrated Security=True"
       providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```
   Replace `YOUR_SERVER_NAME` with your SQL Server instance name (e.g., `localhost\SQLEXPRESS`)

4. Open the following files and update the connection strings to match your SQL Server:
   - `Form1.vb` (around line 25)
   - `Form4.vb` (around line 17)
   - Other forms that use database connections

### Building and Running the Project
1. Open the solution file `project.sln` in Visual Studio 2010
2. Build the solution by pressing `F6` or selecting `Build > Build Solution` from the menu
3. Run the application by pressing `F5` or clicking the green "Start" button

### Sample Login Credentials
You can use the following credentials to test the application:
- PIN: 1234, Account Number: 111
- PIN: 5678, Account Number: 222
- PIN: 9012, Account Number: 333

## Troubleshooting
- If you encounter a "Login failed for user" error, ensure that you're using the correct connection string for your SQL Server instance
- If the database connection fails, verify that SQL Server is running and accessible
- If the application can't find the database, make sure you've created the `atm` database and executed the SQL scripts

## Modifying the Project
- To add new features, create new forms and link them through the existing menu structure
- To modify database schema, update the SQL scripts and regenerate the database
- To add new user accounts, insert additional records into the Login table

## Technologies Used
- Visual Basic .NET
- SQL Server
- Microsoft Visual Studio

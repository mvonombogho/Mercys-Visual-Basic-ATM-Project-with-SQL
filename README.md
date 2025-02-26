# Visual Basic ATM Project with Microsoft Access

This is a Visual Basic ATM project with Microsoft Access database connection, adapted from [ayushegupta/Visual-studio-Atm-project](https://github.com/ayushegupta/Visual-studio-Atm-project).

## Project Description
This project simulates an ATM system using Visual Basic for the frontend and Microsoft Access for the database. Users can perform basic ATM operations like checking balance, withdrawing money, and more.

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
- Microsoft Access 2010 (or later)
- Microsoft Windows with .NET Framework 4.5 or higher

### Database Setup
There are two ways to set up the database:

#### Option 1: Using the Setup Script (Recommended)
1. Clone or download this repository
2. Run the `AccessDBSetup.vbs` file by double-clicking on it
3. The script will create the Access database file with all required tables and sample data

#### Option 2: Manual Setup
1. Create a new Microsoft Access database named `atm.accdb` in the project folder
2. Create a table named `pin` with the following fields:
   - pin_no (Number)
   - acc_no (Number)
3. Create a table named `Login` with the following fields:
   - pin_no (Number)
   - acc_no (Number)
   - name (Text)
   - balance (Number)
4. Insert sample data as specified in the `AccessDBSetup.vbs` script

### Building and Running the Project
1. Open the solution file `project.sln` in Visual Studio 2010 or later
2. Make sure the `atm.accdb` file is in the project directory or in your project's output directory
3. Build the solution by pressing `F6` or selecting `Build > Build Solution` from the menu
4. Run the application by pressing `F5` or clicking the green "Start" button

### Sample Login Credentials
You can use the following credentials to test the application:
- PIN: 1234, Account Number: 111
- PIN: 5678, Account Number: 222
- PIN: 9012, Account Number: 333

## Troubleshooting

### Common Issues
- **Database Not Found**: Ensure the `atm.accdb` file is in the correct location. By default, it should be in the same folder as the executable (bin/Debug or bin/Release).
- **Microsoft Access Database Engine Error**: You need to have Microsoft Access installed or the Microsoft Access Database Engine 2010 Redistributable. You can download it from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=13255).
- **Reference Missing**: If you get a reference error, make sure the project has a reference to `System.Data.OleDb`. You can add it by right-clicking on the project, selecting "Add Reference," and then selecting it from the .NET tab.
- **Platform Target Issues**: If you're using a 64-bit system, you might need to set the platform target to x86. Right-click on the project, select "Properties," go to the "Compile" tab, click "Advanced Compile Options," and set the target CPU to x86.

### Access Database Location
This project uses the `|DataDirectory|` placeholder in the connection string, which typically points to the application's bin directory. If you're having trouble connecting to the database, try placing the `atm.accdb` file in the following locations:
- The project's root directory
- The bin/Debug directory
- The bin/Release directory (if running in Release mode)

## Technologies Used
- Visual Basic .NET
- Microsoft Access Database
- ADO.NET with OleDb provider
- Windows Forms
- Microsoft Visual Studio
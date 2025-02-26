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
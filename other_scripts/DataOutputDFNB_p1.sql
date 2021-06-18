/*****************************************************************************************************************
NAME:    dbo.stg_p1
PURPOSE: Create the tables for dimentional tables and implement views

SUPPORT: Jared Sanchez
         jared.axl@gmail.com

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       06/14/2021   JSANCHEZ      1. Create tables to implement a dimentional model in MSSQL server.



RUNTIME: 
1 min

NOTES: 
The idea is that tables is created using the dbo.stg_p1 table to create tables to implement a
dimentional table to create views the answer the question of the CEO about the performance of
Desseret  First National Bank (DFNB)

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

-- 1) account_customer_branch
SELECT v.branch_code AS 'Branch Code'
	 , v.branch_desc AS 'Branch Name'
     , v.cust_id AS 'Customer ID'
     , v.gender AS 'Gender'
     , v.acct_id AS 'Account ID'
	 , v.loan_amt AS 'Loan Amount'
     , v.open_close_code AS 'Status Account'
     , v.year_opened AS 'Account Year Opened'
     , v.year_closed AS 'Account Year Closed'
  FROM dbo.v_account_customer_branch AS v;

-- 2) Account Branches
SELECT v.branch_code AS 'Branch Code'
     , v.acct_id AS 'Account ID'
  FROM dbo.v_account_branches AS v;

-- 3) Account Open Close by Year
SELECT v.year_opened AS 'Year'  
     , v.number_open_accounts AS 'Opened Accounts'
  FROM dbo.v_account_open_close_year AS v;

-- 4) Open Close Account Branches
SELECT v.branch_code AS 'Branch Code'
     , v.open_close_code AS 'Open Close Accounts'
  FROM dbo.v_open_close_account_branches AS v;

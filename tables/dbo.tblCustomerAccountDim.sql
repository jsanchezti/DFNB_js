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

USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblCustomerAccountDim]    Script Date: 6/14/2021 4:16:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustomerAccountDim](
	[cust_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblCustomerAccountDim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC,
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblCustomerAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerAccountDim_tblAccountDim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[tblAccountDim] ([acct_id])
GO

ALTER TABLE [dbo].[tblCustomerAccountDim] CHECK CONSTRAINT [FK_tblCustomerAccountDim_tblAccountDim]
GO

ALTER TABLE [dbo].[tblCustomerAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerAccountDim_tblAccountRoleDim] FOREIGN KEY([acct_cust_role_id])
REFERENCES [dbo].[tblAccountRoleDim] ([acct_cust_role_id])
GO

ALTER TABLE [dbo].[tblCustomerAccountDim] CHECK CONSTRAINT [FK_tblCustomerAccountDim_tblAccountRoleDim]
GO

ALTER TABLE [dbo].[tblCustomerAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerAccountDim_tblCustomerDim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[tblCustomerDim] ([cust_id])
GO

ALTER TABLE [dbo].[tblCustomerAccountDim] CHECK CONSTRAINT [FK_tblCustomerAccountDim_tblCustomerDim]
GO



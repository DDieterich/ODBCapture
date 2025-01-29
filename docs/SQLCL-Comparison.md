
# SQL\*cl Comparison

**As Of: January 28, 2025**

This is a comparison between Open Source ODBCapture and [Oracle's SQL\*cl](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl).

*NOTE: Both tools are complex and currently being enhanced.  Any errors in this comparison are not intentional and will be corrected upon notice.*

## Overview

*Notes:*
* \* - Not an automated process.  Must be manually executed or scripted.

 ODBCapture | SQL\*cl    | Description
------------|------------|-------------
 Yes        | Yes        | DBMS_METADATA for DDL/DCL Script Generation
 Yes        | Yes        | Separate Scripts for Each Schema/Object
 Yes        | Yes        | Create Folder Structure for Scripts
 Yes        | Yes        | Install Multiple Integrated Users/Schemas
 Yes        | Yes        | Multiple Oracle DB Versions/Editions/Options
 Yes        | Yes        | Track Installed Versions of Application
 Yes*       | Yes        | Generate Deployable Artifact (Zip File)
 Yes*       | Yes        | Create Scripts Directly in File System
 Yes        | Yes        | Separate Scripts for SYS actions
 Yes        | Yes*       | CSV formatted Data Files
 Yes        | .          | Generated SQL\*Loader Control File and SQL Script
 Yes        | .          | Separate Scripts for SYSTEM/DBA actions
 Yes        | .          | Master Installation Wrapper Script
 Yes        | .          | Build Layer Installation with Dependencies
 Yes        | .          | Configurable Database Object Type Sequencing
 Yes        | .          | Configurable Script File Name Extensions
 Yes        | .          | Filtering of System Generated Database Objects
 Yes        | .          | SQL\*Plus/Windows Special Character Handling
 Yes        | .          | US7ASCII Conversion of all Data and Scripts
 Yes        | .          | Stored Configuration of Data Filters
 Yes        | .          | Foreign Key DISABLE for Data Loading
 Yes        | .          | Table Trigger DISABLE for Data Loading
 Yes        | .          | Table Loading of Installation Log Files
 Yes        | .          | Tailored Install Status Reporting Scripts
 Yes        | .          | JUnit (XML) Install Status Reporting
 Yes        | .          | ORA-01720: "WORKAROUND" on Dependent Views
 Yes        | .          | Internal to the Database (Nothing External)
 Yes        | .          | Complete ZIP File Created in Database
 .          | Yes*       | Generate INSERT statements for Data Loading
 .          | Yes        | Generate Git Project Status Files
 .          | Yes        | Generate/Deploy/Verify Diff Scripts
 .          | Yes        | Liquibase Integration

## Details

### Features Common to Both

ODBCapture and SQL\*cl have similar goals for source code files.  Additionally, both track the version of scripts installed into a database.

* *DBMS_METADATA for DDL/DCL Script Generation*
* *Separate Scripts for Each Schema/Object*
* *Create Folder Structure for Scripts*
* *Install Multiple Integrated Users/Schemas*
* *Multiple Oracle DB Versions/Editions/Options*
* *Track Installed Versions of Application*
* *Generate Deployable Artifact (Zip File)*
* *Create Scripts Directly in File System*
* *Generate Project Status Files*
* *Separate Scripts for SYS actions*
* *CSV formatted Data Files*
 

### Features Exclusive to ODBCapture

Each feature is listed with explanation.

* *Generated SQL\*Loader Control File and SQL Script*

Capturing data in source code, like configuration data and test data, can be daunting when using INSERT statements.  CSV formatted files are easier to edit in a modern spreadsheet.  However, another process, like SQL\*Loader is needed to load the CSV formatted data.  SQL\*Loader requires a control file to describe layout of the data in a CSV formatted file.  Additionally, there is some pre-processing and post-processing that may be required for each data load.  ODBCapture handles all of these cases by creating the needed SQL\*Loader Control File and adding the needed pre-processing and post-processing to the SQL script that calls SQL\*Loader.

* *Separate Scripts for SYSTEM/DBA actions*

Highly secured production environments can have increased scrutiny.  This scrutiny can require additional approvals for database modifications that require SYS privileges, versus privileges granted to SYSTEM or other DBAs.  ODBCapture separates installation tasks that require SYS privileges from the others.  This can simiplify deployment when requirements for SYS privileges are easily identifiable.

* *Master Installation Wrapper Script*

SQL\*cl is required to execute the installation scripts it generates.  This additional need for a tool that is not installed with the database can pose problems for highly secured production environments.  ODBCapture creates fully self-contained installation scripts that accomplish the needed tasks using only tools installed with the database.

* *Build Layer Installation with Dependencies*

Build Layers are covered extensively on the [Build Script Layering Webpage](Build_Script_Layering)

* *Configurable Database Object Type Sequencing*

There is no absolute correct sequence for database object type installation in Oracle.  Oracle's Export utility uses dependency relationships to properly order each database object in an export.  This complexity is out of scope for ODBCapture.  The default sequence is acceptable for almost all circumstances.  The sequence can be modified if needed.

* *Configurable Script File Name Extensions*

The default File Name Extensions chosen for ODBCapture specifically avoids extensions recognized by database development tools popular with Oracle.  Files with recognized extensions require specific formatting to work properly in the development tool.  These formats are not common across tools.  ODBCapture avoids these formatting conficts by default, but allows recognized extensions to be configured.

* *Filtering of System Generated Database Objects*

The Oracle database will silently create/generate additional database objects when some database objects are created.  These additional objects can cause problems if they are captured and installed from source code.  ODBCapture filters these silently created database objects from source code.

* *SQL\*Plus/Windows Special Character Handling*
* *US7ASCII Conversion of all Data and Scripts*

Installation scripts can suffer greatly from a variety of "special character" occurances.  ODBCapture accounts for many potential problems with the contents of installation scripts and their usage in different environments.

* *Stored Configuration of Data Filters*

ODBCapture stores data filters and other data capture configurations in the DLOAD_CONF table.  SQL\*cl requires queries to be saved in files and run manually (or scripted) to capture specific configuration data.

* *Foreign Key DISABLE for Data Loading*
* *Table Trigger DISABLE for Data Loading*

ODBCapture accomodates dependent object restrictions during data loading.

* *Table Loading of Installation Log Files*
* *Tailored Install Status Reporting Scripts*
* *JUnit (XML) Install Status Reporting*

The installation scripts generated by ODBCapture included comprehensive status and reporting capabilities:

* *ORA-01720: "WORKAROUND" at ASK TOM*

ODBCapture includes special handling for inter-dependencies between views as described in [ASK TOM](https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987).

* *Internal to the Database (Nothing External)*
* *Complete ZIP File Created in Database*

Many companies have enacted highly restrictive security policies for their production databases.  DBAs no longer can allow developer access to the production database.  ODBCapture can be presented to the DBAs for installation on a production database.  ODBCapture can be deployed to a production database by the DBAs without any unique tool connection. ODBCapture procedures can be executed by the DBAs to generate/capture source code and configuration data from the production database.  DBAs can download and provide the resulting ZIP file to the developers for source code audit processing.


### Features Exclusive to SQL\*cl

* *Generate INSERT statements for Data Loading* - ODBCapture does not generate INSERT statements.  ODBCapture generates CSV files because they are easier to edit with modern spreadsheet software.  LibreOffice Calc is the preferred tool for editing CSV formatted source code.  Excel can be inconsistent when writing CSV formatted files.
* *Generate Git Project Status Files* - ODBCapture does not integrate directly with Git and does not generated Git Project status.  ODBCapture operates independently of a chose source/version control system like Git.
* *Generate/Deploy/Verify Diff Scripts* - ODBCapture does not generate, deploy, or verify diff scripts.  Currently, this functionality is out-of-scope.
* *Liquibase Integration* - ODBCapture does not integrate with Liquibase.


## Supported Database Data Types

Queries are used in SQL\*cl to capture source code data (ex. sample data).  There are several "sqlformat" options availalable for the output of those queries. In the SQL\*cl User Guide, an example is given where the "sqlformat" INSERT is used to generate/capture data from the database.  In [Step 8 of Ticket 1](https://docs.oracle.com/en/database/oracle/sql-developer-command-line/24.3/sqcug/quick-start.html#GUID-C8DDB9DF-FDCD-4249-A956-D3C87432FBBC), the documentation says, "... copy and paste the following statements to the end of the file and then save the file."  However, there is no documentation found regarding Database Data Types supported by the SQL\*cl "sqlformat" output formatting".  Sample data and queries were created to check basic functionality of these data types using SQL\*cl.

*Notes:*
* \* - No Character Set conversions to transportable format are performed.
* \*\* - Data captured is not usable without additional database queries.

 ODBCapture | SQL\*cl    | Database Data Type
------------|------------|----------------------
 .          | Yes        | BINARY_DOUBLE
 .          | Yes        | BINARY_FLOAT
 Yes        | Yes\*\*    | BLOB
 Yes        | Yes\*\*    | BFILE
 Yes        | Yes\*      | CHAR
 Yes        | Yes\*      | CLOB
 Yes        | Yes        | DATE
 Yes        | Yes        | INTERVAL_DAY_TO_SECOND
 Yes        | Yes        | INTERVAL_YEAR_TO_MONTH
 Yes        | Yes\*      | JSON
 .          | Yes\*      | LONG
 .          | Yes        | LONG RAW
 .          | ?          | MLSLABEL
 Yes        | Yes\*      | NCHAR
 Yes        | Yes\*      | NCLOB
 Yes        | Yes        | NUMBER
 Yes        | Yes\*      | NVARCHAR
 Yes        | Yes        | RAW
 .          | Yes        | ROWID
 Yes        | Yes        | TIMESTAMP
 Yes        | Yes        | TIMESTAMP_WITH_LOCAL_TZ
 Yes        | Yes        | TIMESTAMP_WITH_TZ
 .          | ?          | UROWID
 Yes        | Yes\*\*    | User Defined Object Types (Limited)
 Yes        | Yes\*      | VARCHAR2
 Yes        | Yes\*      | XMLTYPE


## Supported Database Object Types

Database Object Types supported by the SQL\*cl `Project Export` command can be found at [SQL Developer Command Line Release 24.3 User's Guide 4.1.1 Supported Objects](https://docs.oracle.com/en/database/oracle/sql-developer-command-line/24.3/sqcug/introduction.html#GUID-1B8A42DB-BD73-45F2-8C4E-CEB1757D75FA).  *Note: All types not included in the following list can be added using the project stage add-custom command with any custom SQL. For more information about the add-custom sub-command, enter help project stage add-custom in the SQLcl command-line help.*

 ODBCapture | SQL\*cl    | Database Object Type
------------|------------|----------------------
 .          | Yes        | APEX_APP
 Yes        | .          | AQ_QUEUE
 Yes        | .          | AQ_QUEUE_TABLE
 .          | .          | AQ_TRANSFORM
 .          | .          | ASSOCIATION
 .          | .          | AUDIT
 .          | .          | AUDIT_OBJ
 .          | .          | CLUSTER
 Yes        | Yes        | COMMENT
 Yes        | Yes        | CONTEXT
 Yes        | .          | DB_LINK
 .          | .          | DBMS_JOBS
 .          | .          | DEFAULT_ROLE
 Yes        | Yes?       | DATABASE_TRIGGER
 .          | .          | DIMENSION
 Yes        | .          | DIRECTORY
 .          | .          | FGA_POLICY
 Yes        | Yes        | FUNCTION
 Yes        | .          | HOST_ACL
 .          | .          | INDEX_STATISTICS
 .          | .          | INDEXTYPE
 Yes        | .          | JAVA_SOURCE
 .          | .          | LIBRARY
 Yes        | .          | MATERIALIZED_VIEW
 Yes        | Yes?       | MATERIALIZED_VIEW_INDEX
 Yes        | .          | MATERIALIZED_VIEW_LOG
 Yes        | Yes?       | MATERIALIZED_REF_CONSTRAINT
 Yes        | Yes        | OBJECT_GRANT
 .          | .          | ON_USER_GRANT
 .          | .          | OPERATOR
 Yes        | Yes        | PACKAGE_SPEC
 Yes        | Yes        | PACKAGE_BODY
 Yes        | Yes        | PROCEDURE
 .          | .          | PROFILE
 .          | .          | PROXY
 Yes        | .          | PUBLIC_SYNONYM
 .          | .          | REFRESH_GROUP
 .          | .          | RESOURCE_COST
 .          | .          | RLS_CONTEXT
 .          | .          | RLS_GROUP
 .          | .          | RLS_POLICY
 .          | .          | RMGR_CONSUMER_GROUP
 .          | .          | RMGR_INTITIAL_CONSUMER_GROUP
 .          | .          | RMGR_PLAN
 .          | .          | RMGR_PLAN_DIRECTIVE
 Yes        | .          | ROLE
 Yes        | Yes        | ROLE_GRANT
 .          | .          | ROLLBACK_SEGMENT
 Yes        | .          | SCHEDULER_JOB
 Yes        | .          | SCHEDULER_PROGRAM
 Yes        | .          | SCHEDULER_SCHEDULE
 Yes        | Yes?       | SCHEMA TRIGGER
 Yes        | Yes        | SEQUENCE
 Yes        | Yes        | SYNONYM
 Yes        | Yes        | SYS_OBJ_GRANT
 Yes        | Yes        | SYSTEM_PRIV_GRANT
 Yes        | Yes        | TABLE
 Yes        | Yes        | TABLE_CONSTRAINTS
 Yes        | .          | TABLE_DATA
 Yes        | Yes        | TABLE_INDEX
 Yes        | Yes        | TABLE_TRIGGER
 Yes        | Yes        | TABLE_REF_CONSTRAINT
 .          | .          | TABLE_STATISTICS
 .          | .          | TABLESPACE
 .          | .          | TABLESPACE_QUOTA
 .          | .          | TRANSPORTABLE_EXPORT
 .          | .          | TRUSTED_DB_LINK
 .          | .          | TRIGGER_XS_ACL
 .          | .          | TRUSTED_DB_LINK
 Yes        | Yes        | TYPE_SPEC
 Yes        | Tes        | TYPE_BODY
 Yes        | Yes        | USER
 Yes        | Yes        | VIEW
 Yes        | Yes?       | VIEW_REF_CONSTRAINT
 Yes        | Yes?       | VIEW_TRIGGER
 Yes        | .          | WALLET_ACL
 Yes        | .          | XMLSCHEMA
 Yes        | .          | XDB_ACL
 Yes        | .          | XS_ACL (RAS_ACL)
 Yes        | .          | XS_ACL_PARAM
 .          | .          | XS_ACL_PARAM INDEX
 Yes        | .          | XS_DATA_SECURITY
 .          | .          | XS_NAMESPACE
 Yes        | .          | XS_ROLE
 .          | .          | XS_ROLESET
 Yes        | .          | XS_ROLE_GRANT
 .          | .          | XS_SECURITY_CLASS
 Yes        | .          | XS_USER

## Appendix A - Sample Schema Folder/File Structure from SQL\*cl

**Commands Used:**

```
docker run --rm -it --entrypoint /bin/bash container-registry.oracle.com/database/sqlcl:24.3.2
   # https://github.com/oracle/docker-images/issues/2210
   export JAVA_TOOL_OPTIONS="-Doracle.net.disableOob=true"
   mkdir ss
   cd ss
   sql -nolog
      connect -savepwd -save c1 sys/password@localhost:1521/DEVPDB as sysdba
      project init -schemas HR,OE,PM -con c1
      project export
      exit
   exit
```

**File/Folder Structure:**

```
src/
  database/
    README.md
    hr/
      comments/
        countries.sql
        departments.sql
        employees.sql
        job_history.sql
        jobs.sql
        locations.sql
        regions.sql
      indexes/
        dept_location_ix.sql
        emp_department_ix.sql
        emp_job_ix.sql
        emp_manager_ix.sql
        emp_name_ix.sql
        jhist_department_ix.sql
        jhist_employee_ix.sql
        jhist_job_ix.sql
        loc_city_ix.sql
        loc_country_ix.sql
        loc_state_province_ix.sql
      object_grants/
        object_grants_as_grantor.hr.table.countries.sql
        object_grants_as_grantor.hr.table.departments.sql
        object_grants_as_grantor.hr.table.employees.sql
        object_grants_as_grantor.hr.table.job_history.sql
        object_grants_as_grantor.hr.table.jobs.sql
        object_grants_as_grantor.hr.table.locations.sql
      procedures/
        add_job_history.sql
        secure_dml.sql
      ref_constraints/
        countr_reg_fk.sql
        dept_loc_fk.sql
        dept_mgr_fk.sql
        emp_dept_fk.sql
        emp_job_fk.sql
        emp_manager_fk.sql
        jhist_dept_fk.sql
        jhist_emp_fk.sql
        jhist_job_fk.sql
        loc_c_id_fk.sql
      sequences/
        departments_seq.sql
        employees_seq.sql
        locations_seq.sql
      tables/
        countries.sql
        departments.sql
        employees.sql
        job_history.sql
        jobs.sql
        locations.sql
        regions.sql
      triggers/
        secure_employees.sql
        update_job_history.sql
      views/
        emp_details_view.sql
    oe/
      comments/
        customers.sql
        inventories.sql
        order_items.sql
        orders.sql
        product_descriptions.sql
        product_information.sql
        warehouses.sql
      functions/
        get_phone_number_f.sql
      indexes/
        cust_account_manager_ix.sql
        cust_email_ix.sql
        cust_lname_ix.sql
        inv_product_ix.sql
        item_order_ix.sql
        item_product_ix.sql
        ord_customer_ix.sql
        ord_order_date_ix.sql
        ord_sales_rep_ix.sql
        order_items_uk.sql
        prod_name_ix.sql
        prod_supplier_ix.sql
        'sys_fk0000075797n00008$.sql'
        'sys_fk0000075797n00010$.sql'
        whs_location_ix.sql
      object_grants/
        object_grants_as_grantor.oe.table.customers.sql
        object_grants_as_grantor.oe.table.inventories.sql
        object_grants_as_grantor.oe.table.order_items.sql
        object_grants_as_grantor.oe.table.orders.sql
        object_grants_as_grantor.oe.table.product_descriptions.sql
        object_grants_as_grantor.oe.table.product_information.sql
        object_grants_as_grantor.oe.table.warehouses.sql
      ref_constraints/
        customers_account_manager_fk.sql
        inventories_product_id_fk.sql
        inventories_warehouses_fk.sql
        order_items_order_id_fk.sql
        order_items_product_id_fk.sql
        orders_customer_id_fk.sql
        orders_sales_rep_fk.sql
        pd_product_id_fk.sql
        warehouses_location_fk.sql
      sequences/
        orders_seq.sql
      synonyms/
        countries.sql
        departments.sql
        employees.sql
        job_history.sql
        jobs.sql
        locations.sql
      tables/
        categories_tab.sql
        customers.sql
        inventories.sql
        order_items.sql
        orders.sql
        product_descriptions.sql
        product_information.sql
        promotions.sql
        purchaseorder.sql
        warehouses.sql
      triggers/
        insert_ord_line.sql
        orders_items_trg.sql
        orders_trg.sql
        'purchaseorder$xd.sql'
      type_bodies/
        catalog_typ.sql
        composite_category_typ.sql
        leaf_category_typ.sql
      type_specs/
        action_t.sql
        action_v.sql
        actions_t.sql
        catalog_typ.sql
        category_typ.sql
        composite_category_typ.sql
        corporate_customer_typ.sql
        cust_address_typ.sql
        customer_typ.sql
        inventory_list_typ.sql
        inventory_typ.sql
        leaf_category_typ.sql
        lineitem_t.sql
        lineitem_v.sql
        lineitems_t.sql
        order_item_list_typ.sql
        order_item_typ.sql
        order_list_typ.sql
        order_typ.sql
        part_t.sql
        phone_list_typ.sql
        product_information_typ.sql
        product_ref_list_typ.sql
        purchaseorder_t.sql
        rejection_t.sql
        shipping_instructions_t.sql
        subcategory_ref_list_typ.sql
        'sys_yoid0000075921$.sql'
        'sys_yoid0000075922$.sql'
        'sys_yoid0000075923$.sql'
        'sys_yoid0000075925$.sql'
        'sys_yoid0000075928$.sql'
        warehouse_typ.sql
      views/
        account_managers.sql
        bombay_inventory.sql
        customers_view.sql
        oc_corporate_customers.sql
        oc_customers.sql
        oc_inventories.sql
        oc_orders.sql
        oc_product_information.sql
        orders_view.sql
        product_prices.sql
        products.sql
        sydney_inventory.sql
        toronto_inventory.sql
    pm/
      indexes/
        'sys_fk0000075860n00007$.sql'
      ref_constraints/
        printmedia_fk.sql
      tables/
        print_media.sql
      type_specs/
        adheader_typ.sql
        textdoc_tab.sql
        textdoc_typ.sql
    sys/
      object_grants/
        object_grants_as_grantor.sys.directory.media_dir.sql
        object_grants_as_grantor.sys.directory.ss_oe_xmldir.sql
        object_grants_as_grantor.sys.directory.subdir.sql
        object_grants_as_grantor.sys.package.dbms_stats.sql
```


ODBCapture is a native PL/SQL application that can be used to generate self-building scripts (source code and configuration data) for a database.

This website is intended for user information and usage documentation.  Development guides and design documentation can be found in [the wiki](https://github.com/DDieterich/ODBCapture/wiki)

Click [here for a white paper overview](Generating-Self-Build.md) on **Generating Self-Build Scripts**.

Click [here for installation and configuration](Install-and-Config.md)
information.

## Why?  What's the point?

Existing tools like TOAD, PL/SQL Developer, and SQL*Developer can create "source code" scripts from an Oracle database.  They can also create data load scripts from an Oracle database.  What they cannot do is create a cohesive set of installation scripts that execute from a single "install.sql" script.

Existing database source code is handled by Liquibase and Flyway which are "diff" engines.  These "diff" engines simply track changes to a database.  Rarely is the source code from these "diff" engines ever used to create a database from nothing.  Typically, the database source code from these "diff" engines require some existing database to get started.

### What's different?

ODBCapture is not a "diff" engine.  ODBCapture is unique in its ability to create Oracle database installation scripts that can create different "flavors" of Oracle databases from a common set of source code.  This installation occurs after an initialization to an empty database or PDB.  (See the white paper above for more details.)
* Create Database ...
* Created Pluggable Database ...
* Drop Schema ...

### Single Install Script

ODBCapture generates database source code in a set of scripts, all of which are called from a common "install.sql"

* Separate folder for SYS privileged statements
* Separate folder for common DBA privileged statements
* Separate folders for each schema in an integrated application.

### Confguration Data Source Code

ODBCapture generates configuration data source code.

* Data driven applications require configuration data to run.
* Because it's required, configuration data is source code for a database.
* All configuration data is saved as CSV files for easy editing.

### Layered Installation

ODBCapture generates "installation layers", allowing for differences between databases.

* Development/Test tables/packages installed in Development/Test databases.
* Environment configuration data for Development/Test/Production databases.
* Development/Test data installed in Development/Test databases.
* Mock schema/API installed in Development/Test databases.

### Open Source

Oracle databases include a massive amount of functionality.  Oracle is constantly changing that functionality for various reasons.  ODBCapture is open source and can be quickly modified to meet new requirements for changes in database functionality.

* New functionality add to new versions
* Deprecated functionality removed from new versions
* Restricted functionality from various editions (Express, Standard)
* Functionality differences between Cloud and OnPremise

### Portability

ODBCapture provides source code portability between Oracle databases running on a variety of platforms.

* Microsoft, Linux, and Apple use different line endings in test files. Git in particular does a good job of translating line endings when source code is moved between platforms.  All source code created by ODBCapture is text based, so these translations function as needed.
* SPARC and x86/ARM use different Endiannesse - While text files are automatically translated during transfer between systems, binary data requires complex bit swapping.  All source code created by ODBCapture is text based, so these translations function as needed.  Specifically, BLOB and RAW data are Base64 encoded before storage as source code and decoded when loaded back into the database.
* ASCII, UTF (Several Versions), and ASCII are all in use today.  Operating Systems (and Oracle Databases) automatically translate between these different encodings.  All source code created by ODBCapture is text based, so these translations function as needed.

### All Oracle, All The Time

ODBCapture is pure Oracle SQL and PL/SQL.  No need to train/hire expertise in non-Oracle development to use/modify ODBCapture.


## Application Source Code Audit

Auditing source code is a simple process.  It is described in the [Build Sequence](https://github.com/DDieterich/ODBCapture/tree/main/builds#build-sequence) listed in the "builds" folder on the main page on GitHub.  The basic idea is to capture application source code from the production database and compare it to the application source code in the source control system (ex. Git).  In the build sequence from the "builds" folder, the Linux "diff" utility is used to compare the 2 sets of files.


## References

* [JUnit_XML_Format.md](JUnit_XML_Format.md)
* [RAS_DBA_Columns.ods](RAS_DBA_Columns.ods)


---
Website formatted with [jekyll-theme-minimal](https://github.com/pages-themes/minimal)

Oracle and Java are trademarks of [Oracle Corp](https://www.oracle.com/).
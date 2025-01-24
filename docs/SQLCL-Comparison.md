
# SQL\*cl Comparison

**DRAFT**

```
######  ######     #    ####### #######
#     # #     #   # #   #          #
#     # #     #  #   #  #          #
#     # ######  #     # #####      #
#     # #   #   ####### #          #
#     # #    #  #     # #          #
######  #     # #     # #          #
```

**DRAFT**

This is a comparison between Open Source [ODBCapture](http://ODBCapture.org) and [Oracle's SQL\*cl](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl).

**As Of: January 24, 2025**

## Overview

ODBCapture | SQL\*cl | Description
-----------|---------|-------------
 X | X | Source File (Installation Script) Generation
 X | . | No Install/Setup External to the Database
 . | X | Generate Database Association Objects

## Details

### Common Features

**Source File (Installation Script) Generation**

While both ODBCapture and SQL\*cl create source files from the database, the format and layout of those files is very different.

### Features Exclusive to ODBCapture

**Security**

The following features are required because ODBCapture must be deloyable in a production database with limited tooling connected.

* No Install/Setup External to the Database

### Features Exclusive to SQL*cl

The following features are not yet implemented in ODBCapture 

*  Generate Database Association Objects

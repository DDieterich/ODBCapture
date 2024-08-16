
ODBCapture is a native PL/SQL application that can be used to generate self-building scripts (source code and configuration data) for a database.

This website is intended for user information and usage documentation.  Development guides and design documentation can be found in [the wiki](https://github.com/DDieterich/ODBCapture/wiki)

Click [here](Generated-Self-Build.md) for a white paper overview on generated self-build scripts for Oracle databases.

## ODBCapture Installation

[Installation instructions](https://github.com/DDieterich/ODBCapture?tab=readme-ov-file#main-odbcapture-installation) are on the main page on GitHub.  This is the same location as the "View Oracle DB Capture on GitHub" link above.


## Application Configuration

(Coming Soon)


## Application Source Code Capture

Configuring ODBCapture can be as simple as adding 2 configuration records.  More complex configurations involve installation layering, object selection/filtering, role identification, and configuration data capture.

Care must be taken to preserve any ODBCapture configurations for an application.  Best practice is to create a configuration data installation layer that keeps ODBCapture configuration data separate from configuration data for a target application.


### Simple Configuration

**Add record to BUILD_CONF**

**Add record to SCHEMA_CONF**


### Advanced Configuration

(Coming Soon)


## Application Build

After application source code has been captured by ODBCapture, the installation of the application is the same as the ODBCapture installation.  [Several examples](https://github.com/DDieterich/ODBCapture/tree/main/builds#build-sequence) of build scripts can be found in the "builds" folder on the main page on GitHub.  These build scripts are Linux oriented for several reasons:
* Oracle Docker images run Linux internally.
* Visual Source Code includes a BASH terminal that is Linux compatable.
* Git Tools are delivered with GitBash, which is Linux compatable.
* Windows Subsystem for Linux (WSL) is Linux compatable.
* Apple's MacOS is Linux compatable.


## Application Source Code Audit

Auditing source code is a simple process.  It is described in the [Build Sequence](https://github.com/DDieterich/ODBCapture/tree/main/builds#build-sequence) listed in the "builds" folder on the main page on GitHub.  The basic idea is to capture application source code from the production database and compare it to the application source code in the source control system (ex. Git).  In the build sequence, the Linux "diff" utility is used to compare the files.


## References

* [JUnit_XML_Format.md]
* [RAS_DBA_Columns.ods]


---
Website formatted with [jekyll-theme-time-machine](https://github.com/pages-themes/time-machine)

Oracle and Java are trademarks of [Oracle Corp](https://www.oracle.com/).
[Home](README.md)

# Build Script Layering

There are many software tools available to "dump" PL/SQL, SQL, and Data from a database into text files.  ODBCapture does the same, but with a unique capability.  ODBCapture can be configured to capture build scripts that successfully add new build layers to a database.  Examples of these build layers include:
1. Mock Build Layer - Contains mocked database objects and APIs representative of a remote database.
2. Base Build Layer - Basic database functionality with basic configuration data.
3. Environment Build Layer - Environment specific configuration data for folders, users, etc...
4. Test Utility Build Layer - Standard testing utility/application like utPLSQL.
5. Unit Test Build Layer - Specific unit testing functionality kept separate from base database functionality.
6. Test Data Build Layer - Set of test data for unit testing, integration, performance testing, etc...
7. ODBCapture Build Layer - ODBCapture installation to re-capture database scripts with recent changes.

ODBCapture includes the unique capability to create complete database build scripts with all the required database objects and data.  The build scripts captured by ODBCapture can be used to create a working, functioning database.  Build layering of these different build scripts allow different databases to be built from the same database source code for different purposes like development, testing, and quality assurance.  ODBCapture can also create build scripts that support different environments.


## Base Build Layer with Configuration Data

(Coming Soon)


## Multiple Interdependent Schema

(Coming Soon)


## Deployment Specific Roles

* QA
* TRAINING

(Coming Soon)


## Build Layering Examples

(Coming Soon)


### Environment/Test Specific Configuration Data

(Coming Soon)

### Unit Testing

(Coming Soon)


### Test Data

(Coming Soon)


### Mock Build Layer

(Coming Soon)


## Example Build Sequences

(Coming Soon)


## Example Build Pathways

(Coming Soon)

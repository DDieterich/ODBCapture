## Build Scripts

### Folder Descriptions

File Name              | Description
-----------------------|------------
OraEE122_AP191_ORDS222 | Oracle 12.1 Enterprise Edition, APEX 19.1, ORDS 22.2
OraXE184_AP191_ORDS222 | Oracle 18.4 Express Edition, APEX 19.1, ORDS 22.2
OraEE193_AP212_ORDS222 | Oracle 19.3 Enterprise Edition, APEX 21.2, ORDS 22.2
OraEE213_AP212_ORDS222 | Oracle 21.3 Enterprise Edition, APEX 21.2, ORDS 22.2
OraXE213_AP212_ORDS222 | Oracle 21.3 Express Edition, APEX 21.2, ORDS 22.2

### Build Results Reporting Notes

```
<h1 style="color:blue;">This is a heading</h1>
<p style="color:red;">This is a paragraph.</p>
```

<h1 style="color:blue;">This is a heading</h1>
<p style="color:red;">This is a paragraph.</p>

Create a build status HTML file and use "lframe" to publish it in the main README.md?

https://www.w3schools.com/html/html_iframe.asp

### Build Sequence

builds/*/build.sh
1. Setup
2. util/build_functions.sh
3. capture_version
3. build_init
4. For Each Build Type
   1. clear_log_files
   2. run_build  "${BTYPE}"
   3. If "grbtst" then RAS_Admin_ODBCTEST.racl
   4. If "grbtsdo" then COLA_SPATIAL_IDX.tidx
   5. run_report      "${BTYPE}" "${PDB_SYSTEM}"
   6. move_log_files
5. update_nonid_sequences
6. compare_source
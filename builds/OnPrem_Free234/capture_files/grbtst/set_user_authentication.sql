
--
-- Set "grbtst" USER AUTHENTICATION
--
-- Command Line Parameters:
--   1 - Password Key
--

define PASSKEY="&1."

alter user "ODBCTEST" identified by "13&PASSKEY.";

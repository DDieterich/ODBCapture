
--
-- Set "grbsrc" USER AUTHENTICATION
--
-- Command Line Parameters:
--   1 - Password Key
--

define PASSKEY="&1."

alter user "ODBCAPTURE" identified by "67&PASSKEY.";

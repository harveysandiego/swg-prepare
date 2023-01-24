#!/bin/bash

echo 'Start the Listener'
# Start the listener.
lsnrctl start

echo 'Create Datatbase in silent mode'
# Silent mode.
dbca -silent -createDatabase                                                   \
     -templateName General_Purpose.dbc                                         \
     -gdbname ${ORACLE_SID} -sid  ${ORACLE_SID} -responseFile NO_VALUE         \
     -characterSet AL32UTF8                                                    \
     -nationalCharacterSet=UTF8                                                \
     -sysPassword swg                                                          \
     -systemPassword swg                                                       \
     -createAsContainerDatabase false                                          \
     -databaseType MULTIPURPOSE                                                \
     -dvConfiguration=false                                                    \
     -olsConfiguration=false                                                   \
     -storageType FS                                                           \
     -datafileDestination "${DATA_DIR}"                                        \
     -emConfiguration NONE                                                     \
     -initParams=undo_tablespace=UNDOTBS1,sga_target=3072MB,db_block_size=8192BYTES,nls_language=AMERICAN,dispatchers=(PROTOCOL=TCP) (SERVICE=swgXDB),diagnostic_dest={ORACLE_BASE},control_files=("{ORACLE_BASE}/oradata/{DB_UNIQUE_NAME}/control01.ctl", "{ORACLE_BASE}/oradata/{DB_UNIQUE_NAME}/control02.ctl"),remote_login_passwordfile=EXCLUSIVE,audit_file_dest={ORACLE_BASE}/admin/{DB_UNIQUE_NAME}/adump,processes=640,pga_aggregate_target=1024MB,nls_territory=AMERICA,open_cursors=300,compatible=19.0.0,db_name=swg,audit_trail=db \
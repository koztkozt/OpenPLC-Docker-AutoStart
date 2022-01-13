#!/bin/bash 
# modifying openplc database
# https://github.com/thiagoralves/OpenPLC_v3/blob/master/webserver/openplc.db

# remove all existing programs
SQL_REMOVE_PROGRAM="DELETE FROM Programs"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_REMOVE_PROGRAM"

# add new programe as "script.st"
SQL_PROGRAM="INSERT INTO Programs (Name, Description, File, Date_upload) VALUES ('Program Name', 'Desc', 'script.st', strftime('%s', 'now'));"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_PROGRAM"

# remove all existing slave devices
SQL_REMOVE_DEVICE="DELETE FROM Slave_dev"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_REMOVE_DEVICE"

# add new slave device. modify and copy this line if need to add more slaves
SQL_SLAVE_Dev_1="INSERT INTO Slave_dev (dev_name, dev_type, slave_id, ip_address, ip_port, di_start, di_size, coil_start, coil_size, ir_start, ir_size, hr_read_start, hr_read_size, hr_write_start, hr_write_size) VALUES ('Slave Name', 'TCP', 0, '192.168.1.1', 502, 0, 80, 0, 80, 0, 80, 0, 80, 0, 80);"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_SLAVE_Dev_1"

# Change or disable Modbus port. Comment out if not requried.
SQL_UPDATE_Modbus="UPDATE Settings SET Value = '502' WHERE Key = 'Modbus_port';"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_UPDATE_Modbus"

# Change or disable DNP3 port. Comment out if not requried.
SQL_UPDATE_DNP3="UPDATE Settings SET Value = '20000' WHERE Key = 'Dnp3_port';"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_UPDATE_DNP3"

# Change or disable ENIP port. Comment out if not requried.
SQL_UPDATE_ENIP="UPDATE Settings SET Value = '44818' WHERE Key = 'ENIP_port';"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_UPDATE_ENIP"

# enable openplc start run mode. Comment out if not requried.
SQL_Start_run_mode="UPDATE Settings SET Value = 'true' WHERE Key = 'Start_run_mode';"
sqlite3 /OpenPLC_v3/webserver/openplc.db "$SQL_Start_run_mode"
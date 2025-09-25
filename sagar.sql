use mysql;

create user Sagarmatha IDENTIFIED BY "Sagarmatha@123";
GRANT ALL PRIVILEGES ON *.* TO "Sagarmatha";

FLUSH PRIVILEGES;
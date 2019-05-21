# EPTS Merge Tool
Merge tool to combine multiple OpenMRS databases from EPTS into a single one. Built in 2 versions: Shell Script and Docker

## Getting Started
This instructions will help you run both versions of the tool.

## Script Version

## Prerequisites
* MySQL 5.7 installed;
* Java 7 or higher installed;
* Git installed;

## Instalation, configuration and execution
* Go to home directory `cd`;
* Clone the repository `git clone https://github.com/edrisse/epts-database-merge.git`;
* Go into script version directory `cd epts-database-merge/script`;
* Copy the provided `pdi.zip` and `mysql-connector-java.jar` files into `epts-database-merge/script` directory;
* Run setup script `./setup.sh`;
* Copy the database dumps of the databases to be merged into `dumps` directory;
* Run the merge tool `./merge.sh` from `epts-database-merge/script` directory;

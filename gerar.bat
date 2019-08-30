@echo off
set user=user_%random%%random%
set pass=%random%%random%%random%%random%%random%%random%
set base=database_%random%%random%

set dsn=mysql://%user%:%pass%@localhost:3306/%base%

set createdatabase=create database if not exists %base%;
set createuser=create user %user%@'localhost' identified by '%pass%';
set grantuser=grant all on %base%.* to %user%@'localhost';

echo %createdatabase% > gerar.sql
echo %createuser% >> gerar.sql
echo %grantuser% >> gerar.sql

mysql -uroot < gerar.sql

rm gerar.sql

echo %dsn% > info.txt
@echo on

echo %dsn%
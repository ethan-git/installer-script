@echo off
set arg1=%1
set arg2=%2

cd %arg1%
set PGPASSWORD=postgres
psql -h localhost -d postgres -U postgres -p 5432 -a -q -f %arg2%
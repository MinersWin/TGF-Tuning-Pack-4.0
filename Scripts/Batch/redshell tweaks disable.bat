@echo off
set hostspath=%windir%\System32\drivers\etc\hosts

echo 0.0.0.0 redshell.io >> %hostspath%
echo 0.0.0.0 api.redshell.io >> %hostspath%
echo 0.0.0.0 treasuredata.com >> %hostspath%
echo 0.0.0.0 api.treasuredata.com >> %hostspath%

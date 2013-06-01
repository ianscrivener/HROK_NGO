HROK_NGO
===========
   
HROK_NGO 

To checkout
-----------

git clone https://github.com/ianscrivener/HROK_NGO.git

Dependencies
---------
MySQL client

For Windows users:
If have problems with MySQL, download connector from 
http://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-noinstall-6.0.2-win32.zip/from/pick
and extract \lib\libmysql.dll to \Ruby193\bin

To commit
---------

Commit your local changes
$git commit -m "did some changes"

Update your source
$git pull --rebase

If any conflicts resolve then do
$git rebase --continue

Push to repo
$git push

To run ngo application
-----------------------

cd ngo
bundle install
rails server

open browser at http://localhost:3000



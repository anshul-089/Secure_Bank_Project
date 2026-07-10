 use securebankproject;
Database changed
mysql> desc users;
+-----------------+---------------+------+-----+-------------------+-------------------+
| Field           | Type          | Null | Key | Default           | Extra             |
+-----------------+---------------+------+-----+-------------------+-------------------+
| user_id         | varchar(15)   | NO   | PRI | NULL              |                   |
| f_name          | varchar(25)   | NO   |     | NULL              |                   |
| l_name          | varchar(25)   | NO   |     | NULL              |                   |
| email           | varchar(50)   | NO   | UNI | NULL              |                   |
| password        | varchar(20)   | NO   |     | NULL              |                   |
| phone_no        | bigint        | NO   |     | NULL              |                   |
| address         | varchar(100)  | NO   |     | NULL              |                   |
| account_number  | bigint        | NO   | UNI | NULL              |                   |
| open_balance    | decimal(10,2) | NO   |     | NULL              |                   |
| account_created | timestamp     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| transaction_pin | char(4)       | NO   |     | 0000              |                   |
+-----------------+---------------+------+-----+-------------------+-------------------+
11 rows in set (0.02 sec)

mysql> desc transactions;
+------------------+---------------+------+-----+-------------------+-------------------+
| Field            | Type          | Null | Key | Default           | Extra             |
+------------------+---------------+------+-----+-------------------+-------------------+
| transaction_id   | bigint        | NO   |     | NULL              |                   |
| sender_account   | bigint        | NO   |     | NULL              |                   |
| receiver_account | bigint        | NO   |     | NULL              |                   |
| amount           | decimal(10,2) | YES  |     | NULL              |                   |
| transaction_date | timestamp     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| transaction_type | varchar(25)   | NO   |     | NULL              |                   |
+------------------+---------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

mysql> select *from users;
+---------+---------+-------------+---------------------------+-------------+------------+------------------------------------+----------------+--------------+---------------------+-----------------+
| user_id | f_name  | l_name      | email                     | password    | phone_no   | address                            | account_number | open_balance | account_created     | transaction_pin |
+---------+---------+-------------+---------------------------+-------------+------------+------------------------------------+----------------+--------------+---------------------+-----------------+
| 111     | Nikhil  | Macchi      | nikhil@gmail.com          | nikhil@123  | 7889541236 | Manewada Road,Nagpur               |   124578956321 |      2500.00 | 2026-07-02 12:25:51 | 1234            |
| 222     | Chintu  | Alone       | alone123@gmail.com        | chintu@123  | 8795456321 | Tukdoji Putla,Manewada Road,Nagpur |  7894512365897 |      7778.00 | 2026-07-02 17:05:51 | 5678            |
| 333     | Anshul  | Dhoble      | anshuldhoble576@gmail.com | anshul@576  | 9175777004 | SBPF Colony,Nagpur-27,Manewada     |   457895621358 |     10000.00 | 2026-07-02 17:49:44 | 2580            |
| 444     | Prajwal | Chaoudhari  | prajwal123@gmail.com      | prajwa;@345 | 7894589789 | Somwari Quarter,Nagpur-24          |   415001381041 |     10000.00 | 2026-07-02 18:06:10 | 4789            |
| 555     | Aksahd  | Suryawanshi | akshad@gmail.com          | akshad@345  | 7895456102 | Pratap Nager,Nagpur-14             |   835094029394 |      9000.00 | 2026-07-02 18:17:59 | 7456            |
+---------+---------+-------------+---------------------------+-------------+------------+------------------------------------+----------------+--------------+---------------------+-----------------+
5 rows in set (0.03 sec)

mysql> select *from transactions;
+----------------+----------------+------------------+---------+---------------------+------------------+
| transaction_id | sender_account | receiver_account | amount  | transaction_date    | transaction_type |
+----------------+----------------+------------------+---------+---------------------+------------------+
|   960909060361 |   457895621358 |     835094029394 | 2000.00 | 2026-07-04 20:50:34 |                  |
|   804692938011 |   124578956321 |     457895621358 | 2500.00 | 2026-07-06 12:23:51 | Money Transfer   |
|   847638562822 |  7894512365897 |    7894512365897 | 3000.00 | 2026-07-06 12:37:13 | Deposit          |
|   280456291301 |  7894512365897 |    7894512365897 | 3000.00 | 2026-07-06 12:41:08 | Withdraw         |
|   488216406684 |  7894512365897 |     835094029394 | 2000.00 | 2026-07-06 12:49:50 | Money Transfer   |
|   559010262849 |  7894512365897 |    7894512365897 | 2000.00 | 2026-07-06 18:43:33 | Deposit          |
|   690412615454 |  7894512365897 |     457895621358 | 2000.00 | 2026-07-06 18:44:47 | Money Transfer   |
|   534512024370 |  7894512365897 |    7894512365897 |  222.00 | 2026-07-06 18:58:17 | Withdraw         |
|   453417573038 |   124578956321 |     457895621358 | 2000.00 | 2026-07-06 19:01:14 | Money Transfer   |
|   687801003108 |   457895621358 |     457895621358 | 5000.00 | 2026-07-08 20:52:37 | Deposit          |
|   677434515237 |   457895621358 |     457895621358 | 2000.00 | 2026-07-08 20:53:32 | Withdraw         |
|   211748911900 |   457895621358 |     124578956321 | 2000.00 | 2026-07-09 12:16:50 | Money Transfer   |
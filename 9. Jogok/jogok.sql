DROP role dbtest;
DROP role userone;
DROP user John;
DROP user James;
DROP user Jack;
DROP user Alexa;
create role dbtest;
grant drop any table, create any table, create any view, backup any table, alter
any table, create session to dbtest;
create role userone;
grant select any table, select any sequence, create procedure, create sequence,
insert any table, update any table, create session to userone;
create user John
identified by "John";
create user James
identified by "James";
create user Jack
identified by "Jack";
create user Alexa
identified by "Alexa";
grant dbtest to John;
grant dbtest to James;
grant user to Jack;
grant user to Alexa;

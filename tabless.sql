/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  User
 * Created: 12 Feb, 2022
 */
drop sequence sno;
drop table diary;
drop table users;
create table diary(username varchar2(50) not null,dt varchar2(20) not null,diary varchar2(3000),time varchar2(30));
create table users(firstname varchar2(30),lastname varchar2(30),username varchar2(50) not null primary key,pwd varchar2(20),sno number(10));
create sequence sno start with 1 increment by 1;
--alter table diary add foreign key (username) references users(username);
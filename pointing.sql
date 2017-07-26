/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     26/07/2017 15:21:07                          */
/*==============================================================*/


drop table if exists CITY;

drop table if exists Visit;

drop table if exists LOCATION;

drop table if exists PRODUCT;

drop table if exists STORE;

drop table if exists STOREDATA;

drop table if exists USERS;

drop table if exists WEEK;

/*==============================================================*/
/* Table: CITY                                                  */
/*==============================================================*/
create table CITY
(
   ID_CITY              numeric(8,2) not null,
   CITYLABEL            char(50),
   primary key (ID_CITY)
);

/*==============================================================*/
/* Table: Visit                                              */
/*==============================================================*/
create table Visit
(
   VISITID              numeric(50,0) not null,
   VISITDATE            date,
   DURATION             time,
   VISITETIME           time,
   primary key (VISITID)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION
(
   LOCATIONID           numeric(8,0) not null,
   ID_ZONE              numeric(8,0),
   ID_STORE             numeric(8,0),
   ID_CITY              numeric(8,2),
   primary key (LOCATIONID)
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT
(
   REF                  national varchar(50) not null,
   PRODPRICE            numeric(8,0),
   PRODLABEL            char(50),
   primary key (REF)
);

/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE
(
   ID_STORE             numeric(8,0) not null,
   STORELABEL           char(50),
   primary key (ID_STORE)
);

/*==============================================================*/
/* Table: STOREDATA                                             */
/*==============================================================*/
create table STOREDATA
(
   ID                   numeric(8,0) not null,
   ID_WEEK              numeric(8,0),
   REF                  national varchar(50),
   ID_STORE             numeric(8,0),
   VISITID              numeric(50,0),
   USERID               numeric(8,0),
   SELLOUT              numeric(8,0),
   STOCK                numeric(8,0),
   primary key (ID)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   USERID               numeric(8,0) not null,
   TYPE                 char(50),
   primary key (USERID)
);

/*==============================================================*/
/* Table: WEEK                                                  */
/*==============================================================*/
create table WEEK
(
   ID_WEEK              numeric(8,0) not null,
   STARTDATE            date,
   ENDDATE              date,
   WEEKLABEL            char(50),
   primary key (ID_WEEK)
);

alter table LOCATION add constraint FK_RELATIONSHIP_8 foreign key (ID_CITY)
      references CITY (ID_CITY) on delete restrict on update restrict;

alter table LOCATION add constraint FK_RELATIONSHIP_9 foreign key (ID_STORE)
      references STORE (ID_STORE) on delete restrict on update restrict;

alter table STOREDATA add constraint FK_RELATIONSHIP_10 foreign key (USERID)
      references USERS (USERID) on delete restrict on update restrict;

alter table STOREDATA add constraint FK_RELATIONSHIP_3 foreign key (REF)
      references PRODUCT (REF) on delete restrict on update restrict;

alter table STOREDATA add constraint FK_RELATIONSHIP_4 foreign key (ID_STORE)
      references STORE (ID_STORE) on delete restrict on update restrict;

alter table STOREDATA add constraint FK_RELATIONSHIP_5 foreign key (VISITID)
      references Visit (VISITID) on delete restrict on update restrict;

alter table STOREDATA add constraint FK_RELATIONSHIP_6 foreign key (ID_WEEK)
      references WEEK (ID_WEEK) on delete restrict on update restrict;


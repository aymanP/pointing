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

CREATE TABLE `store` (
  `ID_STORE` int(11) NOT NULL,
  `STORELABEL` char(50) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `channel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`ID_STORE`);

  
CREATE TABLE `storedata` (
  `ID` int(11) NOT NULL,
  `ID_WEEK` int(11) DEFAULT NULL,
  `REF` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ID_STORE` int(11) DEFAULT NULL,
  `VISITID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `SELLOUT_BtoB` int(11) DEFAULT NULL,
  `SELLOUT_BtoC` int(11) DEFAULT NULL,
  `STOCK_BtoC` int(11) DEFAULT NULL,
  `STOCK_BtoB` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `storedata`
--
ALTER TABLE `storedata`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `storedata`
--
ALTER TABLE `storedata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

  
CREATE TABLE `week` (
  `ID_WEEK` int(11) NOT NULL,
  `STARTDATE` date DEFAULT NULL,
  `ENDDATE` date DEFAULT NULL,
  `WEEKLABEL` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`ID_WEEK`);

  
CREATE TABLE `users` (
  `USERID` int(11) NOT NULL,
  `TYPE` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USERID`);

  
CREATE TABLE `visit` (
  `VISITID` decimal(50,0) NOT NULL,
  `VISITDATE` date DEFAULT NULL,
  `DURATION` time DEFAULT NULL,
  `VISITETIME` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`VISITID`);

  
CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `channel`
--

INSERT INTO `channel` (`id`, `code`, `label`) VALUES
(1, 'IAM', 'MAROC TELECOM'),
(2, 'ORANGE', ' ORANGE TELECOM'),
(3, 'INWI', 'INWI'),
(4, 'SM', 'Souk Market');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

  
CREATE TABLE `city` (
  `ID_CITY` decimal(8,2) NOT NULL,
  `CITYLABEL` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID_CITY`);

CREATE TABLE `location` (
  `LOCATIONID` int(11) NOT NULL,
  `ID_ZONE` int(11) DEFAULT NULL,
  `ID_STORE` int(11) DEFAULT NULL,
  `ID_CITY` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LOCATIONID`);
  
CREATE TABLE `product` (
  `REF` varchar(50) CHARACTER SET utf8 NOT NULL,
  `PRODPRICE` int(11) DEFAULT NULL,
  `PRODLABEL` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`REF`);

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

alter table STORE add constraint FK_RELATIONSHIP_7 foreign key (channel)
      references Channel (ID) on delete restrict on update restrict;

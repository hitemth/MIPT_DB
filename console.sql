drop schema if exists organization CASCADE;
create schema organization;
drop table if exists organization.staff;

create table organization.staff (
    staff_id              integer    primary key,
    staff_position_nm     varchar    not null,
    staff_firs_nm         varchar    not null,
    staff_last_nm         varchar    not null,
    age_amt               integer    not null,
    bank_account_no       bigserial  unique,
    insurance_no          bigserial  unique
);
create table organization.investors(
    investor_id         integer     primary key,
    investor_nm         varchar     not null,
    bank_account_no     integer     unique,
    contract_no         integer     unique,
    investments_amt     real
);

create table organization.transactions(
    transaction_id   integer    primary key,
    operation_nm     varchar    not null,
    transaction_dttm timestamp  not null,
    deduction_acc_no integer    not null,
    crediting_acc_no integer    not null,
    proceeding_amt   real
);

create table organization.assets(
    asset_id                integer     primary key,
    asset_type_dk           integer     not null,
    held_organization_id    integer     not null,
    held_organization_nm    varchar     not null,
    asset_amt               real        not null,
    current_worth_amt       real
);

create table organization.bank_accounts(
    bank_id                    integer     primary key,
    bank_nm                    varchar     not null,
    bank_account_no            integer     not null,
    bank_assets_value_amt      real        not null
);

create table organization.brokers(
    broker_id       integer     primary key,
    broker_nm       varchar     not null,
    contract_no     integer     not null
);

create table organization.partners(
    partner_id      integer     primary key,
    partner_nm      varchar     not null,
    assets_prt      real        not null,
    profit_pct      real         not null
);
/* 4 */
INSERT INTO organization.staff  VALUES (1,'Trader','Mark','Renton',27, 1567789800555, 45384920373);
INSERT INTO organization.staff  VALUES (2,'Trader','Sick','Boy',28, 3456789876543, 987654568766);
INSERT INTO organization.staff  VALUES (3,'Manager','Begbie','Beg',35, 56545675675633, 57567765676567);
INSERT INTO organization.staff  VALUES (4,'Financial Engineer','George','Floyd',45, 873896-05648376, 479843893473467);
INSERT INTO organization.staff  VALUES (5,'CEO','Ekaterina','Ivashkina',21, 567893876789, 45678765434567);
INSERT INTO organization.staff VALUES (6, 'Guard', 'John', 'Wick', 35, 149468, 652158);
INSERT INTO organization.staff VALUES (7, 'cook', 'Arab', 'Kebab', 32, 86680759, 32551122);
INSERT INTO organization.staff VALUES (8, 'Receptionist', 'James', 'Cook', 40, 58201070, 49032144);
INSERT INTO organization.staff VALUES (9, 'Designer', 'Alen', 'De lon', 30, 25275737, 52405232);
INSERT INTO organization.staff VALUES (10, 'Executive Director', 'Pyotr', 'Makhnov', 23, 9453760, 45278078);


INSERT INTO organization.transactions VALUES (2, 'withdraw', '2017-03-31 09:30:20-07', 40028879, 74566223, 840939);
INSERT INTO organization.transactions VALUES (3, 'deposit', '2017-03-31 09:30:20-07', 10496552, 25690908, 768395);
INSERT INTO organization.transactions VALUES (4, 'deposit', '2017-03-31 09:30:20-07', 39020525, 70609288, 133577);
INSERT INTO organization.transactions VALUES (5, 'deposit', '2017-03-31 09:30:20-07', 27800679, 66815637, 99074);
INSERT INTO organization.transactions VALUES (6, 'withdraw', '2017-03-31 09:30:20-07', 9187756, 87367938, 220997);
INSERT INTO organization.transactions VALUES (7, 'withdraw', '2017-03-31 09:30:20-07', 82752720, 99387226, 332733);
INSERT INTO organization.transactions VALUES (8, 'deposit', '2017-03-31 09:30:20-07', 92065009, 12465329, 621027);
INSERT INTO organization.transactions VALUES (9, 'deposit', '2017-03-31 09:30:20-07', 89880338, 78406305, 867142);

INSERT INTO organization.assets VALUES (1, 2, 882365, 'Oleg`s fund', 4349555, 11239780.492914064);
INSERT INTO organization.assets VALUES (2, 14, 2867993, 'Loh invesments', 2435513, 11247098.200779192);
INSERT INTO organization.assets VALUES (3, 12, 252616, 'Big money company', 51552, 11253923.356957376);
INSERT INTO organization.assets VALUES (4, 11, 7528136, 'Jews assosiation', 8022139, 11259265.692179298);
INSERT INTO organization.assets VALUES (5, 9, 4918345, 'Big floppas Big fund', 3627708, 11269164.64940158);
INSERT INTO organization.assets VALUES (6, 1, 1513780, 'Phystech-soyz', 886508, 11275824.242516516);
INSERT INTO organization.assets VALUES (7, 4, 1967083, 'Phystech-boyz', 3418835, 11284211.787130533);
INSERT INTO organization.assets VALUES (8, 12, 4116661, 'Nothing but money', 7558498, 11292467.520848341);

INSERT INTO organization.bank_accounts VALUES (1, 'We steal your money bank', 529922, 19656662.588075574);
INSERT INTO organization.bank_accounts VALUES (2, 'TinkON bank', 628007, 25016332.02719511);
INSERT INTO organization.bank_accounts VALUES (3, 'WasteBank', 447119, 52597290.27984108);
INSERT INTO organization.bank_accounts VALUES (4, 'BetaBank', 628229, 40137549.6432789);
INSERT INTO organization.bank_accounts VALUES (5, 'SilverSuchs Bank', 514978, 52866845.21880906);
INSERT INTO organization.bank_accounts VALUES (6, 'Uganga Bank', 59306, 68418707.77312997);
INSERT INTO organization.bank_accounts VALUES (7, 'Bank of China', 462110, 74751792.6649764);
INSERT INTO organization.bank_accounts VALUES (8, 'Socks bank', 419634, 24910429.94337427);

INSERT INTO organization.brokers VALUES (1, 'DPS broker', 14097);
INSERT INTO organization.brokers VALUES (2, 'MTS broker', 91967);
INSERT INTO organization.brokers VALUES (3, 'PPS broker', 70047);
INSERT INTO organization.brokers VALUES (4, 'TinkON broker', 86647);
INSERT INTO organization.brokers VALUES (5, 'Broken broker', 23245);
INSERT INTO organization.brokers VALUES (6, 'Loh broker', 31660);
INSERT INTO organization.brokers VALUES (7, 'GGWP broker', 45087);
INSERT INTO organization.brokers VALUES (8, 'Chims broker', 83819);

INSERT INTO organization.partners VALUES (1, 'LOH company', 0.03414431924389414, 1);
INSERT INTO organization.partners VALUES (2, 'Jack Dods', 0.01389998124499301, 6);
INSERT INTO organization.partners VALUES (3, 'El Gringo', 0.05084806731784365, 6);
INSERT INTO organization.partners VALUES (4, 'Doshirak inc', 0.0719153216699475, 7);
INSERT INTO organization.partners VALUES (5, 'Bla Bla Bicycle', 0.03649982544691276, 5);
INSERT INTO organization.partners VALUES (6, 'Kim Chin Chim', 0.02012721190214005, 1);
INSERT INTO organization.partners VALUES (7, 'Fresh and chips', 0.020156078576712164, 3);

INSERT INTO organization.investors VALUES (1, 'Oleg', 64103613, 57267900, 78144);
INSERT INTO organization.investors VALUES (2, 'Joe', 97529543, 78192064, 31720);
INSERT INTO organization.investors VALUES (3, 'Lumumba', 30991739, 79726368, 87194);
INSERT INTO organization.investors VALUES (4, 'Bingo', 54865092, 28198904, 863972);
INSERT INTO organization.investors VALUES (5, 'Samuel', 73486052, 42996200, 186312);
INSERT INTO organization.investors VALUES (6, 'Lizzie', 38869597, 48124559, 884893);
INSERT INTO organization.investors VALUES (7, 'Naomi', 3999936, 13701065, 567099);
INSERT INTO organization.investors VALUES (8, 'Poko', 72813318, 42700395, 138601);
INSERT INTO organization.investors VALUES (9, 'Chungus', 55949259, 17050329, 679570);

/* 5 */
/*ожидаем увидеть список названий организаций с суммарными текущими активами более 1488*/
SELECT held_organization_nm,sum(current_worth_amt) FROM organization.assets GROUP BY held_organization_nm HAVING sum(current_worth_amt)>1488;
/*ожидаем увидеть список банков в порядке возрастания суммы хранящихся активов*/
SELECT * FROM organization.bank_accounts ORDER BY bank_assets_value_amt;
/*ожидаем увидеть список названий операций с суммой операций по ним более 228*/
SELECT operation_nm, sum(proceeding_amt) FROM organization.transactions GROUP BY operation_nm HAVING sum(proceeding_amt)>228;
/*ожидаем увидеть список инвесторов в порядке возрастания суммы инвестиций*/
SELECT * FROM organization.investors ORDER BY investments_amt;
/*ожидаем увидеть список профессий работников с указанием количества работников на каждой позиции*/
SELECT staff_position_nm, count(staff_id) FROM organization.staff GROUP BY staff_position_nm HAVING count(staff_id)>0;


/* 6 * PS INSERT выше*/
SELECT * FROM organization.assets WHERE asset_amt > 1000;
UPDATE organization.brokers SET broker_nm = 'Big Sam' WHERE broker_id = 2;
DELETE FROM organization.bank_accounts WHERE bank_id = 4;

/*7*/
create view staff as select * from organization.staff;
select staff_id, overlay(char(bank_account_no) placing '******' from 3 for 8) from staff;

/*8*/
 CREATE VIEW assets_view AS
  SELECT asset_id, asset_type_dk, held_organization_id
  FROM organization.assets
  INNER JOIN organization.bank_accounts
  ON bank_id = held_organization_id
  WHERE bank_assets_value_amt  > 0;

CREATE Brokers_view AS
  SELECT broker_id, broker_nm
  FROM organization.brokers
  INNER JOIN organization.assets
  ON broker_nm = held_organization_nm;


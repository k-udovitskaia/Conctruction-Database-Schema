/*  Construction Projects Database
A company among other activities have a portfolio of construction projects. Some projects are on the stage of examination, some were submitted and released. Each project has a name, an id, and location. Every project has its start date, end date, and target date - when a building should be ready. You can also find main and additional costs and types of the agreements. We can also see if a project was fully accepted or only the price.  
Created by: PostgreSQL (if you use Oracle SQL you can change datatype Integer to Number and Varchar to Varchar2 to obrain the same results)
*/ 
  
  
 create table PROJECTS (  
  project_id    INT,  
  project_name   varchar(50) not null,  
  location      varchar(50),
   contract_Type    varchar(50),
   status_Contract  varchar(50),
   status_Work      varchar(50),
   start_date       date,
   end_date         date,
   main_costs         INT,
   additional_costs   INT,
   target_date      date,  
   supplier_id      INT,
  constraint pk_projects primary key (project_id));


insert into PROJECTS values
(100,'Grünwald_Office', 'Munich','Main_agreement','Agreed_on_price','Released','01-01-2016','10-10-2022',80000000, 5000,'02-03-2023');
insert into PROJECTS values  (101,'New_Horizon_Plant','Munich','Additional_agreement','Agreed_on_price_and_volume','Released','05-05-2019','01-09-2021', 480000000, 15000, '08-15-2026');
insert into PROJECTS values
(102,'EditionOne','Dachau','Main_agreement','Agreed_on_price_and_volume','Submitted','11-11-2022','10-10-2022',50000000,NULL,'02-04-2025');
insert into PROJECTS values
(103,'Baubau','Erding','Main_agreement','Agreed_on_price','On_the_examination','07-05-2022','10-10-2022',50000000,NULL,'01-04-2028');
insert into PROJECTS values
(104,'City_Hotel','Feldmoching','Additional_agreement','Agreed_on_price_and_volume','Submitted','05-16-2020','10-10-2022',50000000,3000,'08-23-2024');
insert into PROJECTS values
(105,'Car_Park','Freimann','Main_agreement','Agreed_on_price','Submitted','11-11-2022','10-10-2022',50000000,100000,'01-06-2027');
insert into PROJECTS values
(106, 'NewApartments', 'Freising','Main_agreement','Agreed_on_price_and_volume','Released','05-15-2021','07-11-2021', 50000000,20000000,'01-12-2022');
insert into PROJECTS values
(107,'TerminalOne','Garching','Main_agreement','Agreed_on_price_and_volume','Submitted','02-16-2022','10-10-2022', 50000000,10000000,'02-26-2025');
insert into PROJECTS values
(108,'LabCampus','Oberschleissheim','Additional_agreement','Agreed_on_price','On_the_examination','09-22-2022','10-10-2022', 50000000,100000,'02-03-2028');
insert into PROJECTS values   
(109,'Airportcum','Garmisch','Main_agreement','Agreed_on_price_and_volume','Released','10-29-2015','05-05-2018',50000000,1000000,'01-01-2019');
insert into PROJECTS values   
(119,'Sportbuilding','Munich','Main_agreement','Agreed_on_price','Submitted','01-01-2018','05-05-2020',300000,NULL,'08-09-2025');


create table EMPLOYEES (  
  emp_id            INT,  
  first_name        varchar(50) not null,  
  last_name         varchar(50),  
  salary            INT,  
  project_id        INT,
  constraint pk_employees primary key (emp_id),  
  constraint fk_employees_project_id foreign key (project_id) 
      references PROJECTS (project_id));
      
insert into EMPLOYEES values
(20,'Jetta','Smyth',57000,100);
insert into EMPLOYEES values
(21,'Fernanda','James',70000,101);
insert into EMPLOYEES values
(22,'Harriet','Mcdaniel',100000,102);
insert into EMPLOYEES values
(23,'Keitha','Müller', 55000,103);
insert into EMPLOYEES values
(24,'Matt','Osborne', 150000,104);
insert into EMPLOYEES values
(25,'Anthony','Ivanov', 85000,105);
insert into EMPLOYEES values
(26,'Hassan','Yatesv', 90000,106);
insert into EMPLOYEES values
(27,'Nicolas','Weber', 250000,107);
insert into EMPLOYEES values
(28,'Nicolette','Griffin', 62000,108);
insert into EMPLOYEES values
(29,'Bob','Johntson',65000,109);

create table SUPPLIERS (  
  supplier_id            INT,  
  supplier_name          varchar(50) not null,  
  supplier_category      varchar(50),  
  project_id             INT,      
  constraint pk_suppliers primary key (supplier_id));
  
   insert into SUPPLIERS values
(500,'Gebr_Knauf_KG','Sub_contractor');
insert into SUPPLIERS values
(501,'REHAU AG + Co','Manufacturer');
insert into SUPPLIERS values
(502,'Apple_GmbH','Sub_contractor');
insert into SUPPLIERS values
(503,'OSRAM_GmbH','Sub_contractor');
insert into SUPPLIERS values
(504,'Metz_it_logistik','Manufacturer');
insert into SUPPLIERS values
(505,'Burghardt_GmbH','Manufacturer');
insert into SUPPLIERS values
(506,'Wolf_bavaria_GmbH','Sub_contractor');
insert into SUPPLIERS values
(507,'Johann_reichholf_bau_GmbH','Sub_contractor');
insert into SUPPLIERS values
(508,'Benno_koch_baunternehmen','Sub_Contractor');
insert into SUPPLIERS values
(509,'ConstructionWorks_GmbH','Sub_contractor');

           
             alter table SUPPLIERS      
      add constraint fk_projects_supplier_id foreign key (project_id) 
      references PROJECTS (project_id) on delete set null; 

update SUPPLIERS
set project_id = 109 where supplier_id = 508;
update SUPPLIERS
set project_id = 108 where supplier_id = 507;
update SUPPLIERS
set project_id = 107 where supplier_id = 504;
update SUPPLIERS
set project_id = 106 where supplier_id = 502;
update SUPPLIERS
set project_id = 105 where supplier_id = 506;
update SUPPLIERS
set project_id = 104 where supplier_id = 505;
update SUPPLIERS
set project_id = 103 where supplier_id = 501;
update SUPPLIERS
SET project_id = 102 where supplier_id = 500;
update SUPPLIERS
SET project_id = 101 where supplier_id = 503;
update SUPPLIERS
set project_id = 100 where supplier_id = 509;
update SUPPLIERS
set project_id = 119 where supplier_id = 502;

 alter table PROJECTS      
      add constraint fk_projects_supplier_id foreign key (project_id) 
      references PROJECTS (project_id) on delete set null;

update PROJECTS
set supplier_id = 509 where project_id = 100;
update PROJECTS
set supplier_id = 503 where project_id = 101;
update PROJECTS
set supplier_id = 500 where project_id = 102;
update PROJECTS
set supplier_id = 501 where project_id = 103;
update PROJECTS
set supplier_id = 505 where project_id = 104;
update PROJECTS
SET supplier_id = 506 where project_id = 105;
update PROJECTS
set supplier_id = 502 where project_id = 106;
update PROJECTS
set supplier_id = 504 where project_id = 107;
update PROJECTS
set supplier_id = 507 where project_id = 108;
update PROJECTS
set supplier_id = 508 where project_id = 109;
update PROJECTS
set supplier_id = 502 where project_id = 119;

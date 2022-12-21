set echo on
create or replace 
PROCEDURE ZAPNI_CIZI_KLICE AS 
BEGIN
  FOR cur IN (select CONSTRAINT_NAME, TABLE_NAME 
             from USER_CONSTRAINTS
       where CONSTRAINT_TYPE = 'R' ) 
  LOOP
   execute immediate 'ALTER TABLE '||cur.table_name||' MODIFY CONSTRAINT "'||cur.constraint_name||'" ENABLE ';
  END LOOP;
END ZAPNI_CIZI_KLICE;
/
create or replace 
PROCEDURE VYPNI_CIZI_KLICE AS 
BEGIN
  for CUR in (select CONSTRAINT_NAME , TABLE_NAME 
       from USER_CONSTRAINTS
       where CONSTRAINT_TYPE = 'R' ) 
   LOOP
    execute immediate 'ALTER TABLE '||cur.table_name||' MODIFY CONSTRAINT "'||cur.constraint_name||'" DISABLE ';
   END LOOP;
END VYPNI_CIZI_KLICE;
/
create or replace
PROCEDURE RESET_SEKVENCI IS
  nval NUMBER;
BEGIN
  FOR T IN ( SELECT DISTINCT( TRIGGER_NAME ) FROM USER_TRIGGERS )
    LOOP
      EXECUTE IMMEDIATE 'DROP TRIGGER ' || T.TRIGGER_NAME;
    END LOOP;
  FOR SEQ IN ( SELECT DISTINCT( SEQUENCE_NAME ) FROM USER_SEQUENCES )
    LOOP
      EXECUTE IMMEDIATE 'DROP SEQUENCE ' || SEQ.SEQUENCE_NAME;
    END LOOP;
END RESET_SEKVENCI;
/

create or replace 
PROCEDURE VYMAZ_DATA_VSECH_TABULEK IS
BEGIN
  VYPNI_CIZI_KLICE;
  FOR V_REC IN (SELECT DISTINCT(TABLE_NAME) FROM USER_TABLES)
      LOOP
      EXECUTE IMMEDIATE 'truncate table '||V_REC.TABLE_NAME||' drop storage';
      END LOOP;
  ZAPNI_CIZI_KLICE;
  RESET_SEKVENCI;
END VYMAZ_DATA_VSECH_TABULEK;
/
SET ECHO ON;
SET DEFINE OFF;
EXECUTE VYMAZ_DATA_VSECH_TABULEK()

CREATE SEQUENCE companies_sequence        START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE addresses_sequence        START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE contracts_sequence        START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE fin_categories_sequence   START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE technologies_sequence     START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE persons_sequence          START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE employees_sequence        START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE cont_pers_sequence        START WITH 1000 INCREMENT BY 10;

CREATE OR REPLACE TRIGGER comp_seq_trigger BEFORE INSERT ON COMPANY FOR EACH ROW BEGIN
	IF :new.company_id IS NULL THEN :new.company_id := companies_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER addr_seq_trigger BEFORE INSERT ON ADDRESS FOR EACH ROW BEGIN
	IF :new.address_id IS NULL THEN :new.address_id := addresses_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER cont_seq_trigger BEFORE INSERT ON CONTRACT FOR EACH ROW BEGIN
	IF :new.contract_id IS NULL THEN :new.contract_id := contracts_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER fcat_seq_trigger BEFORE INSERT ON FINANCIAL_CATEGORY FOR EACH ROW BEGIN
	IF :new.financial_category_id IS NULL THEN :new.financial_category_id := fin_categories_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER tech_seq_trigger BEFORE INSERT ON TECHNOLOGY FOR EACH ROW BEGIN
	IF :new.technology_id IS NULL THEN :new.technology_id := technologies_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER prsn_seq_trigger BEFORE INSERT ON PERSON FOR EACH ROW BEGIN
	IF :new.person_id IS NULL THEN :new.person_id := persons_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER empl_seq_trigger BEFORE INSERT ON EMPLOYEE FOR EACH ROW BEGIN
	IF :new.employee_id IS NULL THEN :new.employee_id := employees_sequence.NEXTVAL; END IF;
END;
/

CREATE OR REPLACE TRIGGER cprn_seq_trigger BEFORE INSERT ON CONTACT_PERSON FOR EACH ROW BEGIN
	IF :new.contact_person_id IS NULL THEN :new.contact_person_id := cont_pers_sequence.NEXTVAL; END IF;
END;
/

ALTER SESSION SET NLS_DATE_FORMAT='MM-DD-YYYY';

INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'EN201502EMa' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1000, 'Mathews', 'Eric', 'eric.mathews@myco.rp', '414-981-0040' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'EN201502JFr' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1010, 'Frye', 'John', 'john.frye@myco.rp', '434-710-6332' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'CZ201502RAn' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1020, 'Anderson', 'Robert', 'robert.anderson@myco.rp', '925-257-8796' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'CZ201502EMa2' ); 
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1030, 'Malley', 'Ethan', 'ethan.malley@myco.rp', '978-854-9680' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'DE201502PCo' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1040, 'Cohen', 'Paul', 'paul.cohen@myco.rp', '516-874-8412' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'CZ201502NGr' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1050, 'Green', 'Norma', 'norma.green@myco.rp', '386-238-4338' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'FR201502CWo' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1060, 'Wortman', 'Cynthia', 'cynthia.wortman@myco.rp', '702-796-9875' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'CZ201502JSa' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1070, 'Sanders', 'Jerry', 'jerry.sanders@myco.rp', '919-429-0681' );
INSERT INTO EMPLOYEE ( personal_number ) VALUES ( 'US201502CHa' );  
INSERT INTO PERSON ( employee_id, last_name, first_name, email, phone ) VALUES ( 1080, 'Hurley', 'Carmen', 'carmen.hurley@myco.rp', '608-458-7644' );

INSERT INTO COMPANY ( name, note ) VALUES ( 'Apple Inc.', 'Mobile Devices, Personal Computing, Software' );               
INSERT INTO COMPANY ( name, note ) VALUES ( 'Samsung Electronics', 'Mobile Devices, Semiconductor, Personal Computing' ); 
INSERT INTO COMPANY ( name, note ) VALUES ( 'Foxconn', 'OEM Component Manufacturing' );                                   
INSERT INTO COMPANY ( name, note ) VALUES ( 'HP', 'Personal Computing and Servers, Consulting' );                         
INSERT INTO COMPANY ( name, note ) VALUES ( 'IBM', 'Computing services, Mainframes' );                                    
INSERT INTO COMPANY ( name, note ) VALUES ( 'Amazon.com', 'Internet Retailer, App Hosting' );                             
INSERT INTO COMPANY ( name, note ) VALUES ( 'Microsoft', 'Business computing' );                                          
INSERT INTO COMPANY ( name, note ) VALUES ( 'Sony', 'Electronic Devices, Personal Computing' );                           
INSERT INTO COMPANY ( name, note ) VALUES ( 'Google', 'Internet Advertising, Search Engine, Miscellaneous' );             
INSERT INTO COMPANY ( name, note ) VALUES ( 'Panasonic', 'Electronics Devices & Components' );                            
INSERT INTO COMPANY ( name, note ) VALUES ( 'Dell', 'Personal Computers and Servers' );                                   
INSERT INTO COMPANY ( name, note ) VALUES ( 'Intel', 'Semiconductor' );                                                   
INSERT INTO COMPANY ( name, note ) VALUES ( 'LG Electronics', 'Personal Computer, Electronics' );                         
INSERT INTO COMPANY ( name, note ) VALUES ( 'Toshiba', 'Semiconductor, Consumer devices' );                               

INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'California', 'Cupertino', '1 Infinite Loop', 1000, '95014' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '2323/14 V Parku', 1010, '14800' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Pardubice', '27 U Zámečku', 1020, '53201' );
INSERT INTO ADDRESS ( state, city, street_address_line1, street_address_line2, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '1559/5 Za Brumlovkou', 'Budova Delta', 1030, '14021' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '2294/5 V Parku', 1040, '14800' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Washington', 'Seattle', '410 Terry Ave. North', 1050, '98109' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '1561/4a Vyskočilova', 1060, '14000' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Japan', 'Tokyo', '1-7-1 Konan', 1070, '108-0075' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '3191/17 Stroupežnického', 1080, '15000' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '289/11 Thámova', 1090, '18600' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Texas', 'Plano', '2300 West Plano Parkway', 1100, '75075' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'California', 'Santa Clara', '2200 Mission College Blvd.', 1110, '95054' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Czech Republic', 'Praha', '23/344 Nádražní', 1120, '15134' );
INSERT INTO ADDRESS ( state, city, street_address_line1, company_id, postal_code ) VALUES ( 'Japan', 'Tokyo', '1-1 Shibaura', 1130, '105-8001' );

INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Sales Manager', 1000 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1000, 'Matias', 'Patricia', 'pmatias@apple.com', '817-621-6889' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'System Administrator', 1010 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1010, 'Hua', 'Mark', 'mhua@samsung.com', '717-891-1834' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'System Engineer', 1020 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1020, 'Copp', 'Gloria', 'gcopp@foxconn.com', '231-720-1472' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Software Developer', 1030 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1030, 'Portugal', 'Wayne', 'wportugal@hp.com', '985-429-0342' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Consultant', 1040 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1040, 'Jose', 'Arnold', 'ajose@ibm.com', '805-656-2276' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Externist', 1050 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1050, 'Bailey', 'Andrew', 'abailey@amazon.com', '805-446-6198' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Database Expert', 1060 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1060, 'McDaniel', 'Sebastian', 'smcdanie@microsoft.com', '304-430-7243' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Analyst', 1070 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1070, 'Call', 'Robin', 'rcall@sony.com', '802-884-4225' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Project Manager', 1080 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1080, 'Bowen', 'Shannon', 'sbowen@google.com', '920-712-9085' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Office Manager', 1090 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1090, 'Beck', 'Richard', 'rbeck@panasonic.com', '918-757-3165' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Business Analyst', 1100 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1100, 'Abreu', 'Anthony', 'aabreu@dell.com', '707-739-3473' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'System Administrator', 1110 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1110, 'Allen', 'Sharon', 'sallen@intel.com', '401-721-7773' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'Consultant', 1120 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1120, 'Prince', 'Natalie', 'nprince@lg.com', '443-416-7979' );
INSERT INTO CONTACT_PERSON ( job_title, company_id ) VALUES ( 'System Engineer', 1130 );
INSERT INTO PERSON ( contact_person_id, last_name, first_name, email, phone ) VALUES ( 1130, 'Murray', 'Bottye', 'bmurray@toshiba.com', '828-419-1391' );

INSERT INTO FINANCIAL_CATEGORY ( label ) VALUES ( 'Up to CZK 1 million' );   
INSERT INTO FINANCIAL_CATEGORY ( label ) VALUES ( 'Up to CZK 2 million' );   
INSERT INTO FINANCIAL_CATEGORY ( label ) VALUES ( 'Up to CZK 5 million' );   
INSERT INTO FINANCIAL_CATEGORY ( label ) VALUES ( 'Up to CZK 10 million' );  
INSERT INTO FINANCIAL_CATEGORY ( label ) VALUES ( 'Up to CZK 20 million Kc' );  
INSERT INTO FINANCIAL_CATEGORY ( label ) VALUES ( 'Over CZK 20 million' ); 

INSERT INTO TECHNOLOGY ( label ) VALUES ( 'MySQL' );                
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Postgre SQL' );          
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'SQLite' );               
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Microsoft SQL Server' ); 
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Oracle SQL' );           
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Java' );                 
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Java EE' );              
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'C++' );                  
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'C' );                    
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Python' );               
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'PHP' );                  
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Swift' );                
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Windows' );              
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Linux' );                
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'OS X' );                 
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'iOS' );                  
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Android' );              
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Windows Phone' );        
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Networking' );           
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Support' );              
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Licence' );              
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Hardware' );             
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Software' );             
INSERT INTO TECHNOLOGY ( label ) VALUES ( 'Middleware' );           

INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'VMware support', 'Providing VMware operating support. District Prague.', TO_DATE( '12-21-2015' ), 1130, 1040, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'New website', 'Creating new web pages (including content conversion of existing web pages) and subsequent application management + serverhosting (contract will be concluded indefinitely).', TO_DATE( '02-09-2009' ), 1060, 1020, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Software delivery', 'Securing software supplies. More information is provided in the Annex.', TO_DATE( '08-13-2012' ), 1020, 1050, 1030 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Creating educational software.', 'Comprehensive processing of educational software including its content, ensuring its smooth operation and service at least to the final stage of the project.', TO_DATE( '10-01-2013' ), 1090, 1070, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Purchase a Microsoft Select Plus License', 'Delivering software products and related services to the Microsoft Select Plus licensing program.', TO_DATE( '09-16-2013' ), 1040, 1070, 1020 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Creation, operation and development of monitoring information system.', 'Detailed design of solution, creation and further development of information system including its support and operation.', TO_DATE( '01-27-2014' ), 1000, 1080, 1050 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Comprehensive provision of election preparation and holding', ' Provision of services consisting of individual activities needed during preparation and processing of election results, namely activities consisting in conducting penetration tests and processing of security information system audit for presentation of election results and provision of infrastructure and services for central workplace for preparation, processing and presentation of election results.', TO_DATE( '02-02-2014' ), 1010, 1010, 1040 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Website maintenance and development', 'Updating and modifying functionalities and providing a comprehensive web portal; website maintenance and development', TO_DATE( '02-05-2014' ), 1110, 1060, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'IBM SW support', 'Provide support for IBM software products.', TO_DATE( '07-17-2014' ), 1050, 1040, 1010 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Support for Microsoft Dynamics NAV', 'Providing support for economic information system based on Microsoft Dynamics NAV.', TO_DATE( '07-22-2014' ), 1030, 1010, 1020 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Application delivery', 'Ensuring the delivery of electronic agenda agendas in the field of transport agendas and the road economy and the environment, the breakdown budget and mobile applications including the superstructure for the blind and partially sighted.', TO_DATE( '02-11-2015' ), 1080, 1020, 1020 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Safety dashboard', 'Creating a unified software environment for analyzing TCK security system outputs.', TO_DATE( '02-17-2015' ), 1070, 1050, 1010 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Delivery of technological support', 'Provide technology support for key security infrastructure components - Firewall technology implemented on CheckPoint.', TO_DATE( '02-17-2015' ), 1100, 1030, 1030 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Information systems integration', 'Acquisition and implementation of information system and its integration.', TO_DATE( '03-13-2015' ), 1120, 1000, 1040 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Coordination of application migration to DC and iTop administration', 'Coordination of application migration to DC and iTop administration.', TO_DATE( '03-16-2015' ), 1030, 1070, 1010 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Software for measuring dimensions and geometric tolerances', 'Delivery of dimensional and geometrical tolerance software GOM Inspect Professional.', TO_DATE( '03-16-2015' ), 1130, 1010, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Providing programming services', 'dsdsdsd', TO_DATE( '03-17-2015' ), 1120, 1020, 1030 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Purchase Windows Licenses', 'Purchase Windows Server Standard License SNGL MVL 2.', TO_DATE( '03-19-2015' ), 1020, 1050, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Licenses related to follow-up agendas.', 'Providing the right to use computer programs.', TO_DATE( '03-20-2015' ), 1050, 1030, 1030 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'GSM communication recording', 'Ensuring GSM communication recording.', TO_DATE( '08-31-2015' ), 1080, 1000, 1020 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Electronic records management system', 'Implementation of the delivered system on the Electronic Records Management System (ERMS) and support its operation.', TO_DATE( '09-04-2015' ), 1100, 1070, 1040 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Extend support for database server licenses', 'Granting of licensing aid for their renewal after expiry of existing aid.', TO_DATE( '10-21-2015' ), 1090, 1060, 1040 );

INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Office, server and database programs', 'Microsoft Delivering Continuous Deliveries and Microsoft Select Plus Volume Licensing Use Rights Licensing.', TO_DATE( '05-29-2014' ), 1070, 1070, 1030 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Provide backup, archiving and recovery of critical servers and data', 'Delivery of backup, archiving and recovery solutions for critical servers and data.', TO_DATE( '06-02-2014' ), 1110, 1000, 1020 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Supply of software for digital photogrammetry', 'Delivery of 1 software package for digital one-shot and intersection photogrammetry including multi-image orientation software.', TO_DATE( '06-02-2014' ), 1060, 1050, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'NIS, DMS, ERP + PACS software', 'Delivery and implementation of a set of information systems, this set will include a medical information system, a DMS portal solution including electronic mail, WF, an economical ERP system and PACS software and diagnostic stations.', TO_DATE( '09-15-2014' ), 1040, 1040, 1030 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Purchase educational software', 'Delivery of MTS CAD / CAM software and KUKA Sim software.', TO_DATE( '07-28-2014' ), 1000, 1020, 1000 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Microsoft Enterprise Agreement License Agreement Renewal', 'Ensuring that your existing Microsoft Enterprise Agreement is renewed.', TO_DATE( '07-29-2014' ), 1080, 1080, 1050 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Expansion of Disk Center Technology Center', 'Implementation of the expansion of disk capacity in the Technology Center in connection with the implementation of mainly digitization and storage', TO_DATE( '07-29-2014' ), 1020, 1060, 1040 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Ensuring the operation of the OBIS SW product', 'Ensuring the necessary activities to provide basic and extended support for the Obis software product.', TO_DATE( '01-30-2015' ), 1090, 1070, 1050 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Support of economic information system', 'Providing support for the economic information system.', TO_DATE( '07-14-2015' ), 1110, 1000, 1020 );
INSERT INTO CONTRACT ( name, description, date_added, company_id, employee_id, financial_category_id ) VALUES ( 'Technical support of ORACLE software products', 'Provision of technical support for ORACLE software products.', TO_DATE( '07-13-2015' ), 1010, 1080, 1050 );

INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Office, server and database programs', TO_DATE( '06-06-2014' ), TO_DATE( '12-06-2014' ), 6754298.00, 1220, 1020 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Provide backup, archiving and recovery of critical servers and data', TO_DATE( '06-28-2014' ), TO_DATE( '09-05-2014' ), 4675000.00, 1230, 1040 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Supply of software for digital photogrammetry', TO_DATE( '06-20-2014' ), TO_DATE( '07-10-2014' ), 73982.00, 1240, 1060 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'NIS, DMS, ERP + PACS software', TO_DATE( '10-01-2014' ), TO_DATE( '04-15-2014' ), 6744538.00, 1250, 1080 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Purchase educational software', TO_DATE( '08-04-2014' ), TO_DATE( '05-15-2014' ), 45987.00, 1260, 1000 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Microsoft Enterprise Agreement License Agreement Renewal', TO_DATE( '08-01-2014' ), TO_DATE( '08-25-2014' ), 23478931.00, 1270, 1010 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Expansion of Disk Center Technology Center', TO_DATE( '08-23-2015' ), TO_DATE( '01-10-2015' ), 11973999.00, 1280, 1030 );
INSERT INTO PROJECT ( name, start_date, end_date, cost, contract_id, employee_id ) VALUES ( 'Ensuring the operation of the OBIS SW product', TO_DATE( '02-25-2015' ), TO_DATE( '01-10-2016' ), 23452948.00, 1290, 1050 );
INSERT INTO PROJECT ( name, start_date, cost, contract_id, employee_id )           VALUES ( 'Support of economic information system', TO_DATE( '09-01-2015' ), 1345931.00, 1300, 1070 );
INSERT INTO PROJECT ( name, start_date, cost, contract_id, employee_id )           VALUES ( 'Technical support of ORACLE software products', TO_DATE( '10-01-2015' ), 10658925.00, 1310, 1040 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1220, 'Office, server and database programs', 1010 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1220, 'Office, server and database programs', 1000 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1220, 'Office, server and database programs', 1080 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1040 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1030 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1050 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1060 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1070 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1080 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1230, 'Provide backup, archiving and recovery of critical servers and data', 1010 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1240, 'Supply of software for digital photogrammetry', 1060 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1250, 'NIS, DMS, ERP + PACS software', 1000 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1250, 'NIS, DMS, ERP + PACS software', 1020 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1250, 'NIS, DMS, ERP + PACS software', 1080 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1250, 'NIS, DMS, ERP + PACS software', 1070 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1260, 'Purchase educational software', 1050 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1260, 'Purchase educational software', 1020 );



INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1280, 'Expansion of Disk Center Technology Center', 1010 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1280, 'Expansion of Disk Center Technology Center', 1030 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1280, 'Expansion of Disk Center Technology Center', 1060 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1280, 'Expansion of Disk Center Technology Center', 1050 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1280, 'Expansion of Disk Center Technology Center', 1000 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1290, 'Ensuring the operation of the OBIS SW product', 1050 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1290, 'Ensuring the operation of the OBIS SW product', 1070 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1300, 'Support of economic information system', 1050 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1300, 'Support of economic information system', 1030 );

INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1310, 'Technical support of ORACLE software products', 1020 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1310, 'Technical support of ORACLE software products', 1070 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1310, 'Technical support of ORACLE software products', 1010 );
INSERT INTO PROJECT_REALIZATION ( contract_id, name, employee_id ) VALUES ( 1310, 'Technical support of ORACLE software products', 1060 );


INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1220, 1190 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1220, 1200 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1230, 1050 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1230, 1040 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1230, 1180 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1230, 1120 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1230, 1130 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1230, 1140 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1240, 1070 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1240, 1130 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1240, 1120 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1240, 1180 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1240, 1190 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1040 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1050 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1060 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1120 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1130 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1140 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1220 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1250, 1180 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1260, 1220 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1260, 1200 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1260, 1190 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1260, 1120 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1270, 1220 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1270, 1200 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1270, 1190 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1270, 1030 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1270, 1120 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1280, 1070 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1280, 1210 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1280, 1190 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1280, 1040 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1290, 1220 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1290, 1200 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1290, 1190 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1300, 1220 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1300, 1200 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1300, 1190 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1300, 1050 );

INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1310, 1040 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1310, 1050 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1310, 1060 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1310, 1200 );
INSERT INTO USED_TECHNOLOGIES ( contract_id, technology_id ) VALUES ( 1310, 1190 );
COMMIT;
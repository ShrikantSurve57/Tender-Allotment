<a href="http://ec2-13-233-71-174.ap-south-1.compute.amazonaws.com:8080/tendermanagement/" alt="Tender Management System Java Project" target="_blank">**Tender Allotment System**</a><br><br>
- **Youtube VIDEO** for local setup of this project: https://www.youtube.com/watch?v=7CE3aY4e644
- **Youtube VIDEO** for Local Setup of similar project : https://youtu.be/mLFPodZO8Iw
### Login Credentials:
	User Login: shrisurve7757@gmail.com/1234
	Admin Login: Admin/Admin
Whenever a company  requires a service / merchandise , a tender is floated. Company maintains an empaneled list of Vendors. An empaneled vendor can only bid for a tender. Every vendor can bid only once against   each tender. Against each tender there may be   bids from several vendors. The company will then select the most suitable bid and places the order to that vendor.
<!--
**Note: This Website is LIVE now <a href="http://ec2-13-233-71-174.ap-south-1.compute.amazonaws.com:8080/tendermanagement/" alt="Tender Management System Java Project" target="_blank">Click Here</a> to visit the live website.
-->
**There are 2 users in the system**

1.	Administrator and
2.	Vendor

**The Role of Administrator is**

1.	Create new Vendor.
2.	View all the vendors.
3.	Create new tenders.
4.	View All the Tenders.
5.	View All the Bids of a tender.
6.	Select a Bid.

**The Role of a Vendor is**
1.	View all the current Tenders.
2.	Place a Bid against a Tender.
3.	View status of a Bid(Whether Selected or Not)
4.	View his own Bid History.
<!--
<a href="http://ec2-13-233-71-174.ap-south-1.compute.amazonaws.com:8080/tendermanagement/" alt="Tender Management System Java Project" target="_blank" div color="red"> 
LIVE NOW &#x1F534
</a>
-->

### Technologies used:-
1. Front-End Development:
- Html
- Css
- Javascript
- BootStrap

2. Back-End Development
- Java
- JDBC
- Servlet
- JSP
- MySQL

### ==== Software And Tools Required ======
- : MySQL
- : Eclipse EE
- : Java JDK 8+
- : Tomcat v8.0
- : Apache Maven
- 
### ========== Dummy Database Initialization USing SQLDUMP =====================

STEPS: If you want to create table structure with dummy database, then follow the Steps given <a target="_blank" href="https://github.com/shashirajraja/Tender-Management-System/blob/master/DataBase/how-to-import-sql-dump-file.md">Here Inside DataBase/how-to-import-sql-dump-file</a>

### ================= Dummy Database Initialization USING QUERY =================

STEP 1: Open MySQL Command Prompt or MySQL Workbench

STEP 2: Login to the administrator user as : ```mysql -u <username> -p``` (Enter Password if asked)

STEP 3: Copy paste the following MySql Commands-
```MySQL
CREATE DATABASE tender;

USE tender;

-- =========================
-- NOTICE TABLE
-- =========================
CREATE TABLE notice (
    id INT(3) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    info VARCHAR(300),
    PRIMARY KEY(id)
);

ALTER TABLE notice AUTO_INCREMENT = 1;

-- =========================
-- VENDOR TABLE
-- =========================
CREATE TABLE vendor (
    vid VARCHAR(15) PRIMARY KEY,
    password VARCHAR(20),
    vname VARCHAR(30),
    vmob VARCHAR(12),
    vemail VARCHAR(40),
    company VARCHAR(30),
    address VARCHAR(100)
);

-- =========================
-- TENDER TABLE
-- =========================
CREATE TABLE tender (
    tid VARCHAR(15) PRIMARY KEY,
    tname VARCHAR(60),
    ttype VARCHAR(20),
    tprice INT,
    tdesc VARCHAR(300),
    tdeadline DATE,
    tloc VARCHAR(70)
);

-- =========================
-- BIDDER TABLE
-- =========================
CREATE TABLE bidder (
    bid VARCHAR(15) PRIMARY KEY,
    vid VARCHAR(15),
    tid VARCHAR(15),
    bidamount INT,
    deadline DATE,
    status VARCHAR(10),

    FOREIGN KEY (vid) REFERENCES vendor(vid),
    FOREIGN KEY (tid) REFERENCES tender(tid)
);

-- =========================
-- TENDER STATUS TABLE
-- =========================
CREATE TABLE tenderstatus (
    tid VARCHAR(15) PRIMARY KEY,
    bid VARCHAR(15),
    status VARCHAR(15) NOT NULL,
    vid VARCHAR(15),

    FOREIGN KEY (tid) REFERENCES tender(tid),
    FOREIGN KEY (bid) REFERENCES bidder(bid),
    FOREIGN KEY (vid) REFERENCES vendor(vid)
);

-- =========================
-- INSERT INTO TENDER
-- =========================
INSERT INTO tender VALUES
('T1001','Metro Rail Construction','Construction',5000000,
 'Pune Metro Phase 2 construction work',
 '2026-07-15','Pune, Maharashtra'),

('T1002','Hospital Management System','Software',750000,
 'Development of hospital management web application',
 '2026-07-20','Mumbai, Maharashtra'),

('T1003','Smart City Road Project','Maintenance',2500000,
 'Road repairing and smart traffic system installation',
 '2026-08-01','Nagpur, Maharashtra'),

('T1004','College ERP System','Software',450000,
 'ERP system for student and faculty management',
 '2026-07-25','Pune, Maharashtra'),

('T1005','Bridge Construction Project','Construction',8000000,
 'Construction of river bridge connecting two villages',
 '2026-08-10','Nashik, Maharashtra');

-- =========================
-- INSERT INTO NOTICE
-- =========================
INSERT INTO notice VALUES
(1,'Metro Project Started',
 'All assigned engineers must report to Pune Metro office tomorrow'),

(2,'ERP Tender Update',
 'Shortlisted vendors are requested to attend technical meeting');

-- =========================
-- INSERT INTO VENDOR
-- =========================
INSERT INTO vendor VALUES
('V1001','shrikant123','Shrikant Surve','9876543210',
 'shrikant@gmail.com','TechSolutions',
 'Pune, Maharashtra'),

('V1002','rahul123','Rahul Patil','9123456780',
 'rahul@gmail.com','Infosys',
 'Mumbai, Maharashtra'),

('V1003','sneha123','Sneha Kulkarni','9988776655',
 'sneha@gmail.com','Wipro',
 'Nagpur, Maharashtra'),

('V1004','amit123','Amit Sharma','9090909090',
 'amit@gmail.com','TCS',
 'Nashik, Maharashtra');

-- =========================
-- INSERT INTO BIDDER
-- =========================
INSERT INTO bidder VALUES
('B1001','V1001','T1001',5100000,'2026-07-15','Pending'),

('B1002','V1002','T1001',5005000,'2026-07-15','Accepted'),

('B1003','V1003','T1002',760000,'2026-07-20','Rejected'),

('B1004','V1001','T1004',455000,'2026-07-25','Accepted'),

('B1005','V1004','T1005',8100000,'2026-08-10','Pending');

-- =========================
-- INSERT INTO TENDER STATUS
-- =========================
INSERT INTO tenderstatus VALUES
('T1001','B1002','Assigned','V1002'),

('T1004','B1004','Assigned','V1001');

COMMIT;

```
	
### ====== Importing and Running the Project Through Eclipse EE ===========
Step 0: Open Eclipse Enterprise Edition. [Install if not available]

Step 1: Click On File > Import > Git > Projects From Git > Clone Uri  > Paste The Repository Url: ```https://github.com/ShrikantSurve57/Tender-Allotment.git``` > Next > Select Master Branch > Select Tender-Management-System\tendermanagement (Eclipse Project) > Next > Finish

Step 2.a: Go inside ```tendermanagement > Java Resources > dbdetails.properties``` and update the value of username and password according to your installed mysql admin credentials

Step 2.b: Right Click on Project > Run as > Maven Build > In the goals field enter "clean install" > apply > run

Step 3: Right click on Project > Maven > Update Project > Select Project Name > Select Force Update > Update

Step 4.1: [Only if Tomcat v8.0 is not Configured in Eclipse]: Right Click On Project > Run As > Run On Server > Select Tomcat v8.0 > (Select Tomcat V8.0 Installation Location If Asked) Next > Add <project-name> > Finish

Step 4.2: In The Server Tab > Double Click On Tomcat Server > Ports  > Change The Port Number For Http/1.1 To 8083 > Close And Save

Step 5: Right Click On Project > Run As > Run On Server > Select Tomcat V8.0 > Next > Add All> Done

Step 6: Check Running The Site At  <a Href="http://localhost:8083/tendermanagement/">http://localhost:8083/tendermanagement/</a> (Best Viewed in chrome desktop version)

Step 7: Default Username And Password For Admin Is "Admin" and "Admin" respectively. [Case-Sensitive]

Step 8: Default Username And Password For User Is "shrisurve7757@gmail.com" and "1234" respectively.



#### "Suggestions and project Improvements are always Invited!"

<bold>Thanks a lot</bold><br/>
                                                                                                        Project Leader<br/>
                                                                                                         <b>Shrikant Surve</b>

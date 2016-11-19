-- Reset code. Drop tables if already present
-- If not there skip to create table
drop sequence student_notifications_id_seq;
drop sequence guides_id_seq;
drop sequence guide_notifications_id_seq;
drop sequence projects_id_seq;
drop sequence keywords_id_seq;
drop table project_keywords;
drop table keywords;
drop table project_members;
drop table projects;
drop table student_notifications;
drop table students;
drop table guide_notifications;
drop table guides;

create table students
(
	roll_num varchar2(10) constraint STUDENTS_ROLL_NO_PK primary key,
	name varchar2(50) constraint STUDENTS_NAME_NN not null,
	password varchar2(20) constraint STUDENTS_PASSWORD_NN not null
);

create table student_notifications
(
	id number(*, 0) constraint STUDENT_NOTIF_ID primary key,
	message varchar2(500) constraint STUDENT_NOTIF_MESSAGE_NN not null,
	notification_date date constraint STUDENT_NOTIF_DATE_NN not null,
	seen varchar2(1) constraint STUDENT_NOTIF_SEEN_CHECK check(seen = 'Y' or seen = 'N')
);

-- default maxvalue of sequence is 999999999999999999999999999
create sequence student_notifications_id_seq 
	minvalue 1
	start with 1
	increment by 1;

create table guides
(
	id number(*, 0) constraint GUIDES_ID_PK primary key,
	name varchar2(100) constraint GUIDES_NAME_NN unique,
	username varchar2(100) constraint GUIDES_USERNAME_NN unique,
	password varchar2(100) constraint GUIDES_PASSWORD_NN not null,
	available varchar2(1) constraint GUIDES_AVAILABLE_CHECK check(available = 'Y' or available = 'N')
);

create sequence guides_id_seq 
	minvalue 1
	start with 1
	increment by 1;

create table guide_notifications
(
	id number(*, 0) constraint GUIDE_NOTIF_ID primary key,
	message varchar2(500) constraint GUIDE_NOTIF_MESSAGE_NN not null,
	notification_date date constraint GUIDE_NOTIF_DATE_NN not null,
	seen varchar2(1) constraint GUIDE_NOTIF_SEEN_CHECK check(seen = 'Y' or seen = 'N')
);

create sequence guide_notifications_id_seq 
	minvalue 1
	start with 1
	increment by 1;

create table projects
(
	id number(*, 0) constraint PROJECTS_ID_PK primary key,
	project_date date constraint PROJECTS_DATE_NN not null,
	title varchar2(100) constraint PROJECTS_TITLE_NN not null,
	guide_id number(*, 0) constraint PROJECTS_GUIDE_FK not null,
	description varchar2(1000) constraint PROJECTS_DESC_NN not null,
	locked varchar2(1) constraint PROJECTS_LOCKED_CHECK check(locked = 'Y' or locked = 'N')
);

create sequence projects_id_seq 
	minvalue 1
	start with 1
	increment by 1;

create table project_members
(
	project_id number(*, 0),
	roll_num varchar2(10),
  	constraint PROJECT_MEMBERS_COMPOSITE_PK primary key (project_id, roll_num),
  	constraint PROJECT_MEMBERS_PROJECT_ID_FK foreign key (project_id) references projects(id),
  	constraint PROJECT_MEMBERS_ROLL_NUM_FK foreign key (roll_num) references students(roll_num)
);

create table keywords 
(
	id number(*, 0) constraint KEYWORDS_ID_PK primary key,
	keyword varchar2(50) constraint KEYWORDS_KEYWORD_NN not null
);

create sequence keywords_id_seq 
	minvalue 1
	start with 1
	increment by 1;

create table project_keywords
(
	project_id number(*, 0),
	keyword_id number(*, 0),
  	constraint PROJECT_KEYWORDS_COMPOSITE_PK primary key (project_id, keyword_id),
  	constraint PROJECT_KEYWORDS_PROJECT_ID_FK foreign key (project_id) references projects(id),
  	constraint PROJECT_KEYWORDS_KEYWORD_ID foreign key (keyword_id) references keywords(id)
);

-- students table rows

insert into students values
(
	'RIT2013001',
	'Ojusvini Agarwal',
	'RIT2013001'
);

insert into students values
(
	'RIT2013002',
	'Saniya Najeeb',
	'RIT2013002'
);

insert into students values
(
	'RIT2013003',
	'D. Shanmukh',
	'RIT2013003'
);

insert into students values
(
	'RIT2013004',
	'Rajesh Kumar Ray',
	'RIT2013004'
);

insert into students values
(
	'RIT2013005',
	'Pradyumna Newalkar',
	'RIT2013005'
);

insert into students values
(
	'RIT2013007',
	'Om Chaudhary',
	'RIT2013007'
);

insert into students values
(
	'RIT2013008',
	'Aanchal Gupta',
	'RIT2013008'
);

insert into students values
(
	'RIT2013009',
	'Aastha Anand',
	'RIT2013009'
);

insert into students values
(
	'RIT2013010',
	'Himanshu Nanda',
	'RIT2013010'
);

insert into students values
(
	'RIT2013011',
	'Brian Silas Luke',
	'RIT2013011'
);

insert into students values
(
	'RIT2013012',
	'Rohit Raj',
	'RIT2013012'
);

insert into students values
(
	'RIT2013013',
	'Nitesh Kumar Verma',
	'RIT2013013'
);

insert into students values
(
	'RIT2013015',
	'Yash Agarwal',
	'RIT2013015'
);

insert into students values
(
	'RIT2013016',
	'Aditya Kumar Singh',
	'RIT2013016'
);

insert into students values
(
	'RIT2013017',
	'Grandhi Neelesh Raj',
	'RIT2013017'
);

insert into students values
(
	'RIT2013018',
	'Manam Rahesh Tej',
	'RIT2013018'
);

insert into students values
(
	'RIT2013019',
	'Atul Kumar',
	'RIT2013019'
);

insert into students values
(
	'RIT2013020',
	'Sankam Sai Khyathi',
	'RIT2013020'
);

insert into students values
(
	'RIT2013021',
	'Anshul Jharbade',
	'RIT2013021'
);

insert into students values
(
	'RIT2013022',
	'Divya Yadav',
	'RIT2013022'
);

insert into students values
(
	'RIT2013023',
	'Mahanti Rama Sridhar',
	'RIT2013023'
);

insert into students values
(
	'RIT2013024',
	'Antra Sharma',
	'RIT2013024'
);

insert into students values
(
	'RIT2013025',
	'Satyam Singh',
	'RIT2013025'
);

insert into students values
(
	'RIT2013026',
	'Divya Kumari',
	'RIT2013026'
);

insert into students values
(
	'RIT2013027',
	'Prashansa Rani',
	'RIT2013027'
);

insert into students values
(
	'RIT2013028',
	'Mohit Ojha',
	'RIT2013028'
);

insert into students values
(
	'RIT2013029',
	'Vinay Kumar Yadav',
	'RIT2013029'
);

insert into students values
(
	'RIT2013030',
	'Manisha Malik',
	'RIT2013030'
);

insert into students values
(
	'RIT2013032',
	'Sibhirajan V.',
	'RIT2013032'
);

insert into students values
(
	'RIT2013033',
	'Narendra Kumar',
	'RIT2013033'
);

insert into students values
(
	'RIT2013034',
	'Akash Sharan',
	'RIT2013034'
);

insert into students values
(
	'RIT2013035',
	'Devanga Dileep Kumar',
	'RIT2013035'
);

insert into students values
(
	'RIT2013036',
	'Shyamrao Sandeep',
	'RIT2013036'
);

insert into students values
(
	'RIT2013037',
	'Pothuganti Rohith Kumar',
	'RIT2013037'
);

insert into students values
(
	'RIT2013038',
	'Chilagani Akshay Kumar',
	'RIT2013038'
);

insert into students values
(
	'RIT2013039',
	'Keshav Goel',
	'RIT2013039'
);

insert into students values
(
	'RIT2013040',
	'Thati Rahul',
	'RIT2013040'
);

insert into students values
(
	'RIT2013041',
	'Nitin Kumar',
	'RIT2013041'
);

insert into students values
(
	'RIT2013042',
	'Suneel Kumar',
	'RIT2013042'
);

insert into students values
(
	'RIT2013043',
	'Vydana Nishanth',
	'RIT2013043'
);

insert into students values
(
	'RIT2013044',
	'Kaushlendra Verma',
	'RIT2013044'
);

insert into students values
(
	'RIT2013045',
	'Aditi',
	'RIT2013045'
);

insert into students values
(
	'RIT2013046',
	'Lalka Vaibhav',
	'RIT2013046'
);

insert into students values
(
	'RIT2013047',
	'Mayur Kumar Samad',
	'RIT2013047'
);

insert into students values
(
	'RIT2013048',
	'Gaurav Sharma',
	'RIT2013048'
);

insert into students values
(
	'RIT2013049',
	'Deepak Kumar Verma',
	'RIT2013049'
);

insert into students values
(
	'RIT2013050',
	'Sachin Kumar Rai',
	'RIT2013050'
);

insert into students values
(
	'RIT2013051',
	'Rajat Kumar Saxena',
	'RIT2013051'
);

insert into students values
(
	'RIT2013052',
	'Rivu Das',
	'RIT2013052'
);

insert into students values
(
	'RIT2013053',
	'M Jay',
	'RIT2013053'
);

insert into students values
(
	'RIT2013054',
	'Vikas Prajapati',
	'RIT2013054'
);

insert into students values
(
	'RIT2013055',
	'Lokesh Goyal',
	'RIT2013055'
);

insert into students values
(
	'RIT2013056',
	'Utkarsh Pillai',
	'RIT2013056'
);

insert into students values
(
	'RIT2013057',
	'Diksha Jaiswal',
	'RIT2013057'
);

insert into students values
(
	'RIT2013058',
	'Sheetal Singhal',
	'RIT2013058'
);

insert into students values
(
	'RIT2013059',
	'Shubham Kumar',
	'RIT2013059'
);

insert into students values
(
	'RIT2013060',
	'Shivam',
	'RIT2013060'
);

insert into students values
(
	'RIT2013061',
	'Soumya Agrawal',
	'RIT2013061'
);

insert into students values
(
	'RIT2013062',
	'Gaurav Goyal',
	'RIT2013062'
);

insert into students values
(
	'RIT2013063',
	'Venkata Surya Vamsi Krishna Sangam',
	'RIT2013063'
);

insert into students values
(
	'RIT2013064',
	'Kumar Abhishek',
	'RIT2013064'
);

insert into students values
(
	'RIT2013065',
	'Saraswathula Abhay Shrinivas',
	'RIT2013065'
);

insert into students values
(
	'RIT2013066',
	'Rupesh Maity',
	'RIT2013066'
);

insert into students values
(
	'RIT2013067',
	'Maloth Avinash',
	'RIT2013067'
);

insert into students values
(
	'RIT2013068',
	'Deeksha Srivastava',
	'RIT2013068'
);

insert into students values
(
	'RIT2013069',
	'Vivek Raja',
	'RIT2013069'
);

insert into students values
(
	'RIT2013070',
	'Kanete Vamsi Pankaj',
	'RIT2013070'
);

insert into students values
(
	'RIT2013071',
	'Ankit Kumar',
	'RIT2013071'
);

insert into students values
(
	'RIT2013072',
	'Priya',
	'RIT2013072'
);

insert into students values
(
	'RIT2013073',
	'Rinchen Angmo',
	'RIT2013073'
);

insert into students values
(
	'RIT2013074',
	'B Sreekanth Naik',
	'RIT2013074'
);

insert into students values
(
	'RIT2013075',
	'Ayush Goel',
	'RIT2013075'
);

insert into students values
(
	'RIT2013076',
	'Mude Rajakumar Naik',
	'RIT2013076'
);

insert into students values
(
	'RIT2013077',
	'Saurabh Chaudhary',
	'RIT2013077'
);

insert into students values
(
	'RIT2013078',
	'Ashirvad Jaiswal',
	'RIT2013078'
);

insert into students values
(
	'RIT2013079',
	'Prabhjot Kaur',
	'RIT2013079'
);

insert into students values
(
	'RIT2013080',
	'Saumya Dwivedi',
	'RIT2013080'
);

insert into students values
(
	'RIT2013081',
	'Abhijeet Gusain',
	'RIT2013081'
);

insert into students values
(
	'RIT2013082',
	'O.keerti',
	'RIT2013082'
);

insert into students values
(
	'RIT2013083',
	'Lavudya Rajnayak',
	'RIT2013083'
);

insert into students values
(
	'RIT2013084',
	'Deepak Singh',
	'RIT2013084'
);

insert into students values
(
	'RIT2013085',
	'Shubham Soni',
	'RIT2013085'
);

insert into students values
(
	'RIT2013086',
	'Korada Viswakanth',
	'RIT2013086'
);

insert into students values
(
	'RIT2013087',
	'Vankdoth Harish',
	'RIT2013087'
);

insert into students values
(
	'RIT2013088',
	'Karia Priyank Nileshkumar',
	'RIT2013088'
);

insert into students values
(
	'RIT2014030',
	'Akash Chourasiya',
	'RIT2014030'
);

insert into students values
(
	'RIT2014033',
	'Dua',
	'RIT2014033'
);

insert into students values
(
	'RIT2014001',
	'Kumar',
	'RIT2014001'
);

insert into students values
(
	'RIT2014062',
	'Shivaprasad Goud',
	'RIT2014062'
);

insert into students values
(
	'RIT2014039',
	'Anudeep',
	'RIT2014039'
);

insert into students values
(
	'RIT2014008',
	'Harikrishna',
	'RIT2014008'
);

insert into students values
(
	'RIT2014060',
	'Sharma',
	'RIT2014060'
);

insert into students values
(
	'RIT2014020',
	'Deepak Patwa',
	'RIT2014020'
);

insert into students values
(
	'RIT2014028',
	'Verma',
	'RIT2014028'
);

insert into students values
(
	'RIT2014048',
	'Gauri Singhal',
	'RIT2014048'
);

insert into students values
(
	'RIT2014059',
	'Harshit Khandelwal',
	'RIT2014059'
);

insert into students values
(
	'RIT2014055',
	'Pant',
	'RIT2014055'
);

insert into students values
(
	'RIT2014007',
	'Saxena',
	'RIT2014007'
);

insert into students values
(
	'RIT2014014',
	'Kaif',
	'RIT2014014'
);

insert into students values
(
	'RIT2014063',
	'General K G',
	'RIT2014063'
);

insert into students values
(
	'RIT2014018',
	'Lochan Gupta',
	'RIT2014018'
);

insert into students values
(
	'RIT2014047',
	'Mana Agarwal',
	'RIT2014047'
);

insert into students values
(
	'RIT2014035',
	'Soni',
	'RIT2014035'
);

insert into students values
(
	'RIT2014050',
	'Yadav',
	'RIT2014050'
);

insert into students values
(
	'RIT2014057',
	'Mayank Goyal',
	'RIT2014057'
);

insert into students values
(
	'RIT2014034',
	'Shresta',
	'RIT2014034'
);

insert into students values
(
	'RIT2014043',
	'Agarwal',
	'RIT2014043'
);

insert into students values
(
	'RIT2014004',
	'Maurya',
	'RIT2014004'
);

insert into students values
(
	'RIT2014046',
	'Kumar',
	'RIT2014046'
);

insert into students values
(
	'RIT2014042',
	'Akash Naik',
	'RIT2014042'
);

insert into students values
(
	'RIT2014054',
	'Sonker',
	'RIT2014054'
);

insert into students values
(
	'RIT2014045',
	'Singh',
	'RIT2014045'
);

insert into students values
(
	'RIT2014017',
	'Nittesh Aggarwal',
	'RIT2014017'
);

insert into students values
(
	'RIT2014011',
	'Verma',
	'RIT2014011'
);

insert into students values
(
	'RIT2014013',
	'Mayank Poply',
	'RIT2014013'
);

insert into students values
(
	'RIT2014012',
	'Kumar Pattawi',
	'RIT2014012'
);

insert into students values
(
	'RIT2014052',
	'Prashanth',
	'RIT2014052'
);

insert into students values
(
	'RIT2014021',
	'Jain',
	'RIT2014021'
);

insert into students values
(
	'RIT2014006',
	'Rahul Gautam',
	'RIT2014006'
);

insert into students values
(
	'RIT2014009',
	'Rahul Kumar Prasad',
	'RIT2014009'
);

insert into students values
(
	'RIT2014024',
	'Jain',
	'RIT2014024'
);

insert into students values
(
	'RIT2014044',
	'Apoorva',
	'RIT2014044'
);

insert into students values
(
	'RIT2014051',
	'Mansi',
	'RIT2014051'
);

insert into students values
(
	'RIT2014022',
	'Priyanshu',
	'RIT2014022'
);

insert into students values
(
	'RIT2014027',
	'Mukul Kumar Anand',
	'RIT2014027'
);

insert into students values
(
	'RIT2014032',
	'Kumar',
	'RIT2014032'
);

insert into students values
(
	'RIT2014037',
	'Siddhartha',
	'RIT2014037'
);

insert into students values
(
	'RIT2014041',
	'Venkata Naveen Kumar',
	'RIT2014041'
);

insert into students values
(
	'RIT2014031',
	'Saraogi',
	'RIT2014031'
);

insert into students values
(
	'RIT2014058',
	'Satyam Mishra',
	'RIT2014058'
);

insert into students values
(
	'RIT2014010',
	'Krishna Yadav',
	'RIT2014010'
);

insert into students values
(
	'RIT2014003',
	'Shubham Jain',
	'RIT2014003'
);

insert into students values
(
	'RIT2014029',
	'Vamshi Krishna',
	'RIT2014029'
);

insert into students values
(
	'RIT2014015',
	'Uday Pratap Verma',
	'RIT2014015'
);

insert into students values
(
	'RIT2014016',
	'Priyanshu Ranjan',
	'RIT2014016'
);

insert into students values
(
	'RIT2014049',
	'Thenuan',
	'RIT2014049'
);

insert into students values
(
	'RIT2014061',
	'Pranay Kumar',
	'RIT2014061'
);

insert into students values
(
	'RIT2014002',
	'Arora',
	'RIT2014002'
);

insert into students values
(
	'RIT2014005',
	'Kumar Kalita',
	'RIT2014005'
);

insert into students values
(
	'RIT2014019',
	'Singh',
	'RIT2014019'
);

insert into students values
(
	'RIT2014023',
	'Kishor Sahu',
	'RIT2014023'
);

insert into students values
(
	'RIT2014025',
	'Patel',
	'RIT2014025'
);

insert into students values
(
	'RIT2014026',
	'Maurya',
	'RIT2014026'
);

insert into students values
(
	'RIT2014036',
	'Tiwari',
	'RIT2014036'
);

insert into students values
(
	'RIT2014038',
	'Rahul Yadav',
	'RIT2014038'
);

insert into students values
(
	'RIT2014040',
	'Jain',
	'RIT2014040'
);

insert into students values
(
	'RIT2014053',
	'Anuj',
	'RIT2014053'
);

insert into students values
(
	'RIT2014056',
	'Sonker',
	'RIT2014056'
);

insert into students values
(
	'RIT2014064',
	'Diwakar',
	'RIT2014064'
);

insert into students values
(
	'RIT2014067',
	'Singh',
	'RIT2014067'
);

insert into students values
(
	'RIT2014073',
	'Student',
	'RIT2014073'
);

insert into students values
(
	'RIT2014078',
	'Student',
	'RIT2014078'
);

insert into students values
(
	'RIT2014076',
	'Student',
	'RIT2014076'
);

insert into students values
(
	'RIT2014083',
	'Nitin Kumar',
	'RIT2014083'
);

insert into students values
(
	'RIT2014074',
	'Student',
	'RIT2014074'
);

insert into students values
(
	'RIT2014066',
	'Pratima Verma',
	'RIT2014066'
);

insert into students values
(
	'RIT2014068',
	'Prateek Bansal',
	'RIT2014068'
);

insert into students values
(
	'RIT2014079',
	'Shivam Tripathi',
	'RIT2014079'
);

insert into students values
(
	'RIT2014072',
	'Akshat Mathur',
	'RIT2014072'
);

insert into students values
(
	'RIT2014090',
	'Abhishek Agrawal',
	'RIT2014090'
);

insert into students values
(
	'RIT2014084',
	'Tez Bahadur Singh Yadav',
	'RIT2014084'
);

insert into students values
(
	'RIT2014081',
	'K Ravikiran',
	'RIT2014081'
);

insert into students values
(
	'RIT2014089',
	'P Ajaybabu',
	'RIT2014089'
);

insert into students values
(
	'RIT2014088',
	'A Bharadwaj',
	'RIT2014088'
);

insert into students values
(
	'RIT2014080',
	'T Charan Kumar',
	'RIT2014080'
);

insert into students values
(
	'RIT2014085',
	'Raaga Narla',
	'RIT2014085'
);

insert into students values
(
	'RIT2014092',
	'Neha Kumari',
	'RIT2014092'
);

insert into students values
(
	'RIT2014091',
	'Heena Meena',
	'RIT2014091'
);

insert into students values
(
	'RIT2014075',
	'Nitendra Kumar',
	'RIT2014075'
);

insert into students values
(
	'RIT2014082',
	'Kanhaiya Tripathi',
	'RIT2014082'
);

insert into students values
(
	'RIT2014065',
	'Divyansh Rao',
	'RIT2014065'
);

insert into students values
(
	'RIT2014077',
	'Arun Naik',
	'RIT2014077'
);

insert into students values
(
	'RIT2014087',
	'Shradha Sharma',
	'RIT2014087'
);

insert into students values
(
	'RIT2014086',
	'Bijendra',
	'RIT2014086'
);

insert into students values
(
	'RIT2015001',
	'Pushpendra Soni',
	'RIT2015001'
);

insert into students values
(
	'RIT2015002',
	'Suyog Surana',
	'RIT2015002'
);

insert into students values
(
	'RIT2015003',
	'Geetika Bakshi',
	'RIT2015003'
);

insert into students values
(
	'RIT2015004',
	'Medha Falguni Rai',
	'RIT2015004'
);

insert into students values
(
	'RIT2015005',
	'Angkita Hazarika',
	'RIT2015005'
);

insert into students values
(
	'RIT2015006',
	'Kartikey Singh',
	'RIT2015006'
);

insert into students values
(
	'RIT2015007',
	'Vishal Sah',
	'RIT2015007'
);

insert into students values
(
	'RIT2015008',
	'Mukul Jaiswal',
	'RIT2015008'
);

insert into students values
(
	'RIT2015009',
	'Pranav Maheshwary',
	'RIT2015009'
);

insert into students values
(
	'RIT2015010',
	'Anurag Verma',
	'RIT2015010'
);

insert into students values
(
	'RIT2015011',
	'Shivangi Singhal',
	'RIT2015011'
);

insert into students values
(
	'RIT2015012',
	'Harsh Gupta',
	'RIT2015012'
);

insert into students values
(
	'RIT2015013',
	'Suraj Singh Bhoriyal',
	'RIT2015013'
);

insert into students values
(
	'RIT2015014',
	'Priyam Bansal',
	'RIT2015014'
);

insert into students values
(
	'RIT2015015',
	'Pranjal Paliwal',
	'RIT2015015'
);

insert into students values
(
	'RIT2015016',
	'Abhishek Singhal',
	'RIT2015016'
);

insert into students values
(
	'RIT2015017',
	'Krishna Kumar Maurya',
	'RIT2015017'
);

insert into students values
(
	'RIT2015018',
	'Pranjal Agarwal',
	'RIT2015018'
);

insert into students values
(
	'RIT2015019',
	'Tejendra Kumar',
	'RIT2015019'
);

insert into students values
(
	'RIT2015020',
	'Nikita Jain',
	'RIT2015020'
);

insert into students values
(
	'RIT2015021',
	'Ajay Agarwal',
	'RIT2015021'
);

insert into students values
(
	'RIT2015022',
	'Jyotsna Rastogi',
	'RIT2015022'
);

insert into students values
(
	'RIT2015023',
	'Bhupendra Kumar Singh',
	'RIT2015023'
);

insert into students values
(
	'RIT2015024',
	'Mohd Azam Hayat',
	'RIT2015024'
);

insert into students values
(
	'RIT2015025',
	'Mehul Gupta',
	'RIT2015025'
);

insert into students values
(
	'RIT2015026',
	'Darsheel Aman',
	'RIT2015026'
);

insert into students values
(
	'RIT2015027',
	'Rohan Kumar Nayak',
	'RIT2015027'
);

insert into students values
(
	'RIT2015028',
	'Akhil Kumar Singh',
	'RIT2015028'
);

insert into students values
(
	'RIT2015029',
	'Priyank Agarwal',
	'RIT2015029'
);

insert into students values
(
	'RIT2015030',
	'Manuj Singh',
	'RIT2015030'
);

insert into students values
(
	'RIT2015031',
	'Banoth Naveen Kumar',
	'RIT2015031'
);

insert into students values
(
	'RIT2015032',
	'Arpit Gupta',
	'RIT2015032'
);

insert into students values
(
	'RIT2015033',
	'Mishra Rajani Priya',
	'RIT2015033'
);

insert into students values
(
	'RIT2015034',
	'Arun Singhal',
	'RIT2015034'
);

insert into students values
(
	'RIT2015035',
	'Akanksha Bhardwaj',
	'RIT2015035'
);

insert into students values
(
	'RIT2015036',
	'Ayush Agarwal',
	'RIT2015036'
);

insert into students values
(
	'RIT2015037',
	'Saurabh Katiyar',
	'RIT2015037'
);

insert into students values
(
	'RIT2015038',
	'Vicky Saini',
	'RIT2015038'
);

insert into students values
(
	'RIT2015039',
	'Aman Kuamr Dokania',
	'RIT2015039'
);

insert into students values
(
	'RIT2015040',
	'Siddharth Acharya',
	'RIT2015040'
);

insert into students values
(
	'RIT2015041',
	'Bobbili Vineela Moses',
	'RIT2015041'
);

insert into students values
(
	'RIT2015042',
	'Rituraj Kumar',
	'RIT2015042'
);

insert into students values
(
	'RIT2015043',
	'Shikha Singh',
	'RIT2015043'
);

insert into students values
(
	'RIT2015044',
	'Aseem Shrey',
	'RIT2015044'
);

insert into students values
(
	'RIT2015045',
	'Deepak Prakash Vinchurkar',
	'RIT2015045'
);

insert into students values
(
	'RIT2015046',
	'Kartik Mehrotra',
	'RIT2015046'
);

insert into students values
(
	'RIT2015047',
	'Niketan Verma',
	'RIT2015047'
);

insert into students values
(
	'RIT2015048',
	'Siddharth Singh',
	'RIT2015048'
);

insert into students values
(
	'RIT2015049',
	'Himanshu Singh',
	'RIT2015049'
);

insert into students values
(
	'RIT2015050',
	'Indal Saroj',
	'RIT2015050'
);

insert into students values
(
	'RIT2015051',
	'Ankit Singh Bisen',
	'RIT2015051'
);

insert into students values
(
	'RIT2015052',
	'Ashish Kumar Maurya',
	'RIT2015052'
);

insert into students values
(
	'RIT2015053',
	'Anurag Singh',
	'RIT2015053'
);

insert into students values
(
	'RIT2015054',
	'Etikala Moukthik',
	'RIT2015054'
);

insert into students values
(
	'RIT2015055',
	'Rajat Mishra',
	'RIT2015055'
);

insert into students values
(
	'RIT2015056',
	'Devraj Sen',
	'RIT2015056'
);

insert into students values
(
	'RIT2015057',
	'Himanshu Kumar',
	'RIT2015057'
);

insert into students values
(
	'RIT2015058',
	'Anurag Kumar Kushwaha',
	'RIT2015058'
);

insert into students values
(
	'RIT2015059',
	'Shivani Pal',
	'RIT2015059'
);

insert into students values
(
	'RIT2015060',
	'Vandana Yadav',
	'RIT2015060'
);

insert into students values
(
	'RIT2015061',
	'Singh Shailendra Shrinivas Maharani',
	'RIT2015061'
);

insert into students values
(
	'RIT2015062',
	'Pushpender Yadav',
	'RIT2015062'
);

insert into students values
(
	'RIT2015063',
	'Shubham Singh',
	'RIT2015063'
);

insert into students values
(
	'RIT2015064',
	'G Hemanth Reddy',
	'RIT2015064'
);

insert into students values
(
	'RIT2015065',
	'Redith Mehtani',
	'RIT2015065'
);

insert into students values
(
	'RIT2015066',
	'Katna Pruthvi Raj',
	'RIT2015066'
);

insert into students values
(
	'RIT2015067',
	'Saurabh Kumar Kaushal',
	'RIT2015067'
);

insert into students values
(
	'RIT2015068',
	'Alok Kumar',
	'RIT2015068'
);

insert into students values
(
	'RIT2015069',
	'Neeraj Kumar',
	'RIT2015069'
);

insert into students values
(
	'RIT2015070',
	'Nitin Patel',
	'RIT2015070'
);

insert into students values
(
	'RIT2015071',
	'Gaurav Singh',
	'RIT2015071'
);

insert into students values
(
	'RIT2015072',
	'Ananya Anand',
	'RIT2015072'
);

insert into students values
(
	'RIT2015073',
	'Shuchi Dwivedi',
	'RIT2015073'
);

insert into students values
(
	'RIT2015074',
	'Megha Mishra',
	'RIT2015074'
);

insert into students values
(
	'RIT2015075',
	'Sangani Srikanth',
	'RIT2015075'
);

insert into students values
(
	'RIT2015076',
	'Nitish Kajala',
	'RIT2015076'
);

insert into students values
(
	'RIT2015077',
	'Ayush Bansal',
	'RIT2015077'
);

insert into students values
(
	'RIT2015078',
	'Saksham Chawla',
	'RIT2015078'
);

insert into students values
(
	'RIT2015079',
	'Pratyush Pati Tripathi',
	'RIT2015079'
);

insert into students values
(
	'RIT2015080',
	'Danish Iqbal',
	'RIT2015080'
);

insert into students values
(
	'RIT2015081',
	'Anchal Kumar',
	'RIT2015081'
);

insert into students values
(
	'RIT2015082',
	'Loudya Naveen',
	'RIT2015082'
);

insert into students values
(
	'RIT2015083',
	'Piyush Gupta',
	'RIT2015083'
);

insert into students values
(
	'RIT2015084',
	'Piyush Govil',
	'RIT2015084'
);

insert into students values
(
	'RIT2015085',
	'Kankshit Ashish Tyagi',
	'RIT2015085'
);

insert into students values
(
	'RIT2015086',
	'Sapavat Murali',
	'RIT2015086'
);

insert into students values
(
	'RIT2015088',
	'Nitesh Singh Munda',
	'RIT2015088'
);

insert into students values
(
	'RIT2015089',
	'Vipul Singh',
	'RIT2015089'
);

insert into students values
(
	'RIT2012050',
	'Malothu Rajashekar',
	'RIT2012050'
);

insert into students values
(
	'IIT2014017',
	'Rahman',
	'IIT2014017'
);

insert into students values
(
	'IIT2014032',
	'Abhishek Sanjay',
	'IIT2014032'
);

insert into students values
(
	'IIT2014046',
	'Prakash',
	'IIT2014046'
);

insert into students values
(
	'IIT2014011',
	'Satyam',
	'IIT2014011'
);

insert into students values
(
	'IIT2014108',
	'Tomar',
	'IIT2014108'
);

insert into students values
(
	'IIT2014137',
	'Kumar',
	'IIT2014137'
);

insert into students values
(
	'IIT2014109',
	'Betanabhotla',
	'IIT2014109'
);

insert into students values
(
	'IIT2014066',
	'Shubhangi Shukla',
	'IIT2014066'
);

insert into students values
(
	'IIT2014106',
	'Baltiyal',
	'IIT2014106'
);

insert into students values
(
	'IIT2014033',
	'Narayan Singh',
	'IIT2014033'
);

insert into students values
(
	'IIT2014096',
	'Mehrotra',
	'IIT2014096'
);

insert into students values
(
	'IIT2014022',
	'Saria',
	'IIT2014022'
);

insert into students values
(
	'IIT2014038',
	'Jaiswal',
	'IIT2014038'
);

insert into students values
(
	'IIT2014064',
	'Krishna Nayak',
	'IIT2014064'
);

insert into students values
(
	'IIT2014142',
	'Dwivedi',
	'IIT2014142'
);

insert into students values
(
	'IIT2014083',
	'Gupta',
	'IIT2014083'
);

insert into students values
(
	'IIT2014134',
	'Saha',
	'IIT2014134'
);

insert into students values
(
	'IIT2014097',
	'Aditya Singh',
	'IIT2014097'
);

insert into students values
(
	'IIT2014003',
	'Tiwary',
	'IIT2014003'
);

insert into students values
(
	'IIT2014029',
	'Md Asif Khursheed',
	'IIT2014029'
);

insert into students values
(
	'IIT2014058',
	'Deepak',
	'IIT2014058'
);

insert into students values
(
	'IIT2014082',
	'Kumar',
	'IIT2014082'
);

insert into students values
(
	'IIT2014070',
	'Hiraman Bawane',
	'IIT2014070'
);

insert into students values
(
	'IIT2014123',
	'Geetha Madhuri',
	'IIT2014123'
);

insert into students values
(
	'IIT2014090',
	'Shyam Naik',
	'IIT2014090'
);

insert into students values
(
	'IIT2014118',
	'Abhishek Jaiswal',
	'IIT2014118'
);

insert into students values
(
	'IIT2014079',
	'Soni',
	'IIT2014079'
);

insert into students values
(
	'IIT2014040',
	'Kumar',
	'IIT2014040'
);

insert into students values
(
	'IIT2014107',
	'Arya',
	'IIT2014107'
);

insert into students values
(
	'IIT2014102',
	'Srinidhi',
	'IIT2014102'
);

insert into students values
(
	'IIT2014120',
	'Sahil Agarwal',
	'IIT2014120'
);

insert into students values
(
	'IIT2014016',
	'Pandey',
	'IIT2014016'
);

insert into students values
(
	'IIT2014043',
	'Jain',
	'IIT2014043'
);

insert into students values
(
	'IIT2014009',
	'Rahman',
	'IIT2014009'
);

insert into students values
(
	'IIT2014136',
	'Ramakrishna Pranay Kumar',
	'IIT2014136'
);

insert into students values
(
	'IIT2014008',
	'Gupta',
	'IIT2014008'
);

insert into students values
(
	'IIT2014061',
	'Shubham Gupta2',
	'IIT2014061'
);

insert into students values
(
	'IIT2014023',
	'Haaris Hashmi',
	'IIT2014023'
);

insert into students values
(
	'IIT2014071',
	'Harsh Shah',
	'IIT2014071'
);

insert into students values
(
	'IIT2014001',
	'Kumar Chaurasia',
	'IIT2014001'
);

insert into students values
(
	'IIT2014088',
	'Hindwani',
	'IIT2014088'
);

insert into students values
(
	'IIT2014002',
	'Shah',
	'IIT2014002'
);

insert into students values
(
	'IIT2014005',
	'Zafar Khan',
	'IIT2014005'
);

insert into students values
(
	'IIT2014020',
	'Ghimire',
	'IIT2014020'
);

insert into students values
(
	'IIT2014052',
	'Goel',
	'IIT2014052'
);

insert into students values
(
	'IIT2014099',
	'Shivam Gupta',
	'IIT2014099'
);

insert into students values
(
	'IIT2014021',
	'Agrawal',
	'IIT2014021'
);

insert into students values
(
	'IIT2014073',
	'Kumar Sharma',
	'IIT2014073'
);

insert into students values
(
	'IIT2014128',
	'Sachan',
	'IIT2014128'
);

insert into students values
(
	'IIT2014131',
	'Sampath',
	'IIT2014131'
);

insert into students values
(
	'IIT2014132',
	'Kumar Toppo',
	'IIT2014132'
);

insert into students values
(
	'IIT2014138',
	'Singh',
	'IIT2014138'
);

insert into students values
(
	'IIT2014140',
	'Kumar Tanwar',
	'IIT2014140'
);

insert into students values
(
	'IIT2014143',
	'Rama Krishna Saketh',
	'IIT2014143'
);

insert into students values
(
	'IIT2014048',
	'Dheeraj Keshav',
	'IIT2014048'
);

insert into students values
(
	'IIT2014007',
	'Avinash Jha',
	'IIT2014007'
);

insert into students values
(
	'IIT2014081',
	'Monga',
	'IIT2014081'
);

insert into students values
(
	'IIT2014027',
	'Akhil',
	'IIT2014027'
);

insert into students values
(
	'IIT2014042',
	'Manish Kumar',
	'IIT2014042'
);

insert into students values
(
	'IIT2014113',
	'Uday Kumar',
	'IIT2014113'
);

insert into students values
(
	'IIT2014036',
	'Kumar',
	'IIT2014036'
);

insert into students values
(
	'IIT2014075',
	'Yadav',
	'IIT2014075'
);

insert into students values
(
	'IIT2014044',
	'Gupta',
	'IIT2014044'
);

insert into students values
(
	'IIT2014013',
	'Acharya',
	'IIT2014013'
);

insert into students values
(
	'IIT2014014',
	'Jaiswal',
	'IIT2014014'
);

insert into students values
(
	'IIT2014039',
	'Jain',
	'IIT2014039'
);

insert into students values
(
	'IIT2014139',
	'Soni',
	'IIT2014139'
);

insert into students values
(
	'IIT2014101',
	'Reddy Mahendra Reddy',
	'IIT2014101'
);

insert into students values
(
	'IIT2014067',
	'Maheshwari',
	'IIT2014067'
);

insert into students values
(
	'IIT2014050',
	'Sugreev Prasad',
	'IIT2014050'
);

insert into students values
(
	'IIT2014089',
	'Goyal',
	'IIT2014089'
);

insert into students values
(
	'IIT2014041',
	'Khaneja',
	'IIT2014041'
);

insert into students values
(
	'IIT2014078',
	'Lavan Kumar',
	'IIT2014078'
);

insert into students values
(
	'IIT2014111',
	'Nandy',
	'IIT2014111'
);

insert into students values
(
	'IIT2014094',
	'Nikhil Chowdary',
	'IIT2014094'
);

insert into students values
(
	'IIT2014129',
	'Nikhil Ranjan',
	'IIT2014129'
);

insert into students values
(
	'IIT2014074',
	'Yadav',
	'IIT2014074'
);

insert into students values
(
	'IIT2014015',
	'Narisetty',
	'IIT2014015'
);

insert into students values
(
	'IIT2014006',
	'Patel',
	'IIT2014006'
);

insert into students values
(
	'IIT2014126',
	'Nikhil Jangpangi',
	'IIT2014126'
);

insert into students values
(
	'IIT2014112',
	'Prasad Mangalore',
	'IIT2014112'
);

insert into students values
(
	'IIT2014068',
	'Prateek',
	'IIT2014068'
);

insert into students values
(
	'IIT2014024',
	'Chaudhary',
	'IIT2014024'
);

insert into students values
(
	'IIT2014095',
	'Gupta',
	'IIT2014095'
);

insert into students values
(
	'IIT2014049',
	'Prince Sihag',
	'IIT2014049'
);

insert into students values
(
	'IIT2014057',
	'Beesipogu',
	'IIT2014057'
);

insert into students values
(
	'IIT2014019',
	'Pammi',
	'IIT2014019'
);

insert into students values
(
	'IIT2014122',
	'Raj',
	'IIT2014122'
);

insert into students values
(
	'IIT2014104',
	'Jain',
	'IIT2014104'
);

insert into students values
(
	'IIT2014004',
	'Panchariya',
	'IIT2014004'
);

insert into students values
(
	'IIT2014150',
	'Ravi Shanker',
	'IIT2014150'
);

insert into students values
(
	'IIT2014149',
	'Ravi Teja',
	'IIT2014149'
);

insert into students values
(
	'IIT2014018',
	'Malhotra',
	'IIT2014018'
);

insert into students values
(
	'IIT2014119',
	'Ankush Jangid',
	'IIT2014119'
);

insert into students values
(
	'IIT2014012',
	'Jha',
	'IIT2014012'
);

insert into students values
(
	'IIT2014047',
	'Rydel Gerard',
	'IIT2014047'
);

insert into students values
(
	'IIT2014065',
	'Sunil Kumar',
	'IIT2014065'
);

insert into students values
(
	'IIT2014147',
	'Shamshery',
	'IIT2014147'
);

insert into students values
(
	'IIT2014069',
	'Vandit Khandelwal',
	'IIT2014069'
);

insert into students values
(
	'IIT2014114',
	'Sarath Chandra Reddy',
	'IIT2014114'
);

insert into students values
(
	'IIT2014063',
	'Sarthak Panda',
	'IIT2014063'
);

insert into students values
(
	'IIT2014010',
	'Tibrewal',
	'IIT2014010'
);

insert into students values
(
	'IIT2014056',
	'Sharath Chandra',
	'IIT2014056'
);

insert into students values
(
	'IIT2014045',
	'Shiv Shankar',
	'IIT2014045'
);

insert into students values
(
	'IIT2014084',
	'Kumar',
	'IIT2014084'
);

insert into students values
(
	'IIT2014130',
	'Sahil Chaudhary',
	'IIT2014130'
);

insert into students values
(
	'IIT2014062',
	'Siddharth Singh',
	'IIT2014062'
);

insert into students values
(
	'IIT2014091',
	'Singh',
	'IIT2014091'
);

insert into students values
(
	'IIT2014053',
	'Singh',
	'IIT2014053'
);

insert into students values
(
	'IIT2014026',
	'Kumar',
	'IIT2014026'
);

insert into students values
(
	'IIT2014093',
	'Devi Madala',
	'IIT2014093'
);

insert into students values
(
	'IIT2014125',
	'Sulyab T V',
	'IIT2014125'
);

insert into students values
(
	'IIT2014034',
	'Dutt Maurya',
	'IIT2014034'
);

insert into students values
(
	'IIT2014060',
	'Kumar Dhayal',
	'IIT2014060'
);

insert into students values
(
	'IIT2014085',
	'Tausin Arshad',
	'IIT2014085'
);

insert into students values
(
	'IIT2014025',
	'Thareja',
	'IIT2014025'
);

insert into students values
(
	'IIT2014072',
	'Vikramkumar Jani',
	'IIT2014072'
);

insert into students values
(
	'IIT2014059',
	'Sudhakar Pedapalliwar',
	'IIT2014059'
);

insert into students values
(
	'IIT2014103',
	'Dumka',
	'IIT2014103'
);

insert into students values
(
	'IIT2014127',
	'Bana',
	'IIT2014127'
);

insert into students values
(
	'IIT2014080',
	'Sahu',
	'IIT2014080'
);

insert into students values
(
	'IIT2014145',
	'Poojita Reddy',
	'IIT2014145'
);

insert into students values
(
	'IIT2014135',
	'Singh',
	'IIT2014135'
);

insert into students values
(
	'IIT2014133',
	'Vinay Sowmya',
	'IIT2014133'
);

insert into students values
(
	'IIT2014146',
	'Agarwal',
	'IIT2014146'
);

insert into students values
(
	'IIT2014087',
	'Kumar',
	'IIT2014087'
);

insert into students values
(
	'IIT2014086',
	'Teja',
	'IIT2014086'
);

insert into students values
(
	'IIT2014144',
	'Rupesh',
	'IIT2014144'
);

insert into students values
(
	'IIT2014092',
	'Nikitha',
	'IIT2014092'
);

insert into students values
(
	'IIT2014030',
	'Vinod Kumar',
	'IIT2014030'
);

insert into students values
(
	'IIT2014051',
	'Yashwant',
	'IIT2014051'
);

insert into students values
(
	'IIT2014031',
	'Garg',
	'IIT2014031'
);

insert into students values
(
	'IIT2014035',
	'Joshi',
	'IIT2014035'
);

insert into students values
(
	'IIT2014037',
	'Jha',
	'IIT2014037'
);

insert into students values
(
	'IIT2014054',
	'Raj',
	'IIT2014054'
);

insert into students values
(
	'IIT2014055',
	'Rajeswar Rao',
	'IIT2014055'
);

insert into students values
(
	'IIT2014077',
	'Shiv',
	'IIT2014077'
);

insert into students values
(
	'IIT2014098',
	'Supriti',
	'IIT2014098'
);

insert into students values
(
	'IIT2014100',
	'Kanwal',
	'IIT2014100'
);

insert into students values
(
	'IIT2014105',
	'Kundun',
	'IIT2014105'
);

insert into students values
(
	'IIT2014110',
	'Vijay',
	'IIT2014110'
);

insert into students values
(
	'IIT2014115',
	'Raju',
	'IIT2014115'
);

insert into students values
(
	'IIT2014116',
	'Ashish Reddy',
	'IIT2014116'
);

insert into students values
(
	'IIT2014117',
	'Chauhan',
	'IIT2014117'
);

insert into students values
(
	'IIT2014121',
	'Shiv Pratap Singh',
	'IIT2014121'
);

insert into students values
(
	'IIT2014141',
	'Abhishek Deora',
	'IIT2014141'
);

insert into students values
(
	'IIT2014148',
	'Sairam',
	'IIT2014148'
);

insert into students values
(
	'IIT2014151',
	'Pranjit Bharali',
	'IIT2014151'
);

insert into students values
(
	'IIT2014152',
	'Nabeel Bhattacharya',
	'IIT2014152'
);

insert into students values
(
	'IIT2014153',
	'Sameer',
	'IIT2014153'
);

insert into students values
(
	'IIT2014154',
	'Naveen Kumar Shukla',
	'IIT2014154'
);

insert into students values
(
	'IIT2014155',
	'Shivam Awasthi',
	'IIT2014155'
);

insert into students values
(
	'IIT2014156',
	'Bharat Gupta',
	'IIT2014156'
);

insert into students values
(
	'IIT2014157',
	'Parshant Singh',
	'IIT2014157'
);

insert into students values
(
	'IIT2014158',
	'Rudraksha Gupta',
	'IIT2014158'
);

insert into students values
(
	'IIT2014159',
	'Beri',
	'IIT2014159'
);

insert into students values
(
	'IIT2014160',
	'Sarthak Sharma',
	'IIT2014160'
);

insert into students values
(
	'IIT2014161',
	'Neeraj',
	'IIT2014161'
);

insert into students values
(
	'IIT2014162',
	'Pavitra',
	'IIT2014162'
);

insert into students values
(
	'IIT2014163',
	'Likhama Ram',
	'IIT2014163'
);

insert into students values
(
	'IIT2014164',
	'Sneha',
	'IIT2014164'
);

insert into students values
(
	'IIT2014165',
	'Kumar',
	'IIT2014165'
);

insert into students values
(
	'IIT2014501',
	'Sachin',
	'IIT2014501'
);

insert into students values
(
	'IIT2014502',
	'Nishit Gupta',
	'IIT2014502'
);

insert into students values
(
	'IIT2014503',
	'Rajat Saxena',
	'IIT2014503'
);

insert into students values
(
	'IIT2014504',
	'Sahil Prakash',
	'IIT2014504'
);

insert into students values
(
	'IIT2014505',
	'Poddar',
	'IIT2014505'
);

insert into students values
(
	'IIT2014506',
	'Sacheendra Mohan Singh',
	'IIT2014506'
);

insert into students values
(
	'IIT2014507',
	'Utkarsh Srivastava',
	'IIT2014507'
);

insert into students values
(
	'IIT2014508',
	'Anurag',
	'IIT2014508'
);

insert into students values
(
	'IIT2015001',
	'T Saikiran Kumar',
	'IIT2015001'
);

insert into students values
(
	'IIT2015002',
	'Affan Ahmad Fahmi',
	'IIT2015002'
);

insert into students values
(
	'IIT2015003',
	'Ridhima Agarwal',
	'IIT2015003'
);

insert into students values
(
	'IIT2015004',
	'Salman Naseer Ahmed',
	'IIT2015004'
);

insert into students values
(
	'IIT2015005',
	'Rahul Gyawali',
	'IIT2015005'
);

insert into students values
(
	'IIT2015006',
	'Aditya Narain Gupta',
	'IIT2015006'
);

insert into students values
(
	'IIT2015007',
	'Kunal Gupta',
	'IIT2015007'
);

insert into students values
(
	'IIT2015008',
	'Ayush Raj',
	'IIT2015008'
);

insert into students values
(
	'IIT2015009',
	'Somveer Sharma',
	'IIT2015009'
);

insert into students values
(
	'IIT2015010',
	'Tarun Jain',
	'IIT2015010'
);

insert into students values
(
	'IIT2015011',
	'Ram Kishor',
	'IIT2015011'
);

insert into students values
(
	'IIT2015012',
	'Aditya Pimparkar',
	'IIT2015012'
);

insert into students values
(
	'IIT2015013',
	'Aditya Sapra',
	'IIT2015013'
);

insert into students values
(
	'IIT2015014',
	'Sandeep Kumar Singh',
	'IIT2015014'
);

insert into students values
(
	'IIT2015015',
	'Richa Vinian',
	'IIT2015015'
);

insert into students values
(
	'IIT2015016',
	'Kaustubh Rakesh',
	'IIT2015016'
);

insert into students values
(
	'IIT2015017',
	'Sudeept Dwivedi',
	'IIT2015017'
);

insert into students values
(
	'IIT2015018',
	'Prince Kumar Nanda',
	'IIT2015018'
);

insert into students values
(
	'IIT2015019',
	'Tanishk Dhirendra Rana',
	'IIT2015019'
);

insert into students values
(
	'IIT2015020',
	'Sagar Kumar',
	'IIT2015020'
);

insert into students values
(
	'IIT2015021',
	'Anshul Srivastava',
	'IIT2015021'
);

insert into students values
(
	'IIT2015022',
	'Aashi Pundir',
	'IIT2015022'
);

insert into students values
(
	'IIT2015023',
	'Utkarsh Gupta',
	'IIT2015023'
);

insert into students values
(
	'IIT2015024',
	'Gulshan Kumar',
	'IIT2015024'
);

insert into students values
(
	'IIT2015025',
	'Harsh Gupta',
	'IIT2015025'
);

insert into students values
(
	'IIT2015026',
	'Somya Verma',
	'IIT2015026'
);

insert into students values
(
	'IIT2015027',
	'Praveen Pourush',
	'IIT2015027'
);

insert into students values
(
	'IIT2015028',
	'Chinmoy Das',
	'IIT2015028'
);

insert into students values
(
	'IIT2015029',
	'Nagudasari Dileep Kumar',
	'IIT2015029'
);

insert into students values
(
	'IIT2015030',
	'Vankayalapati Chandra Kant',
	'IIT2015030'
);

insert into students values
(
	'IIT2015031',
	'Shefali Verma',
	'IIT2015031'
);

insert into students values
(
	'IIT2015032',
	'Rohan Mohan Rayaraddi',
	'IIT2015032'
);

insert into students values
(
	'IIT2015033',
	'Ammula Sudhakar',
	'IIT2015033'
);

insert into students values
(
	'IIT2015034',
	'Sandeep Kumar',
	'IIT2015034'
);

insert into students values
(
	'IIT2015035',
	'Mokana Dileep',
	'IIT2015035'
);

insert into students values
(
	'IIT2015036',
	'Abhinav Khare',
	'IIT2015036'
);

insert into students values
(
	'IIT2015038',
	'Vipul Kumar',
	'IIT2015038'
);

insert into students values
(
	'IIT2015039',
	'Nishant Verma',
	'IIT2015039'
);

insert into students values
(
	'IIT2015040',
	'Tushar Minj',
	'IIT2015040'
);

insert into students values
(
	'IIT2015041',
	'Kothe Venkata Sesha Srikar',
	'IIT2015041'
);

insert into students values
(
	'IIT2015042',
	'Raghav Saboo',
	'IIT2015042'
);

insert into students values
(
	'IIT2015043',
	'Vikash Kumar Choudhary',
	'IIT2015043'
);

insert into students values
(
	'IIT2015044',
	'Chaudhari Jayesh Ajaybhai',
	'IIT2015044'
);

insert into students values
(
	'IIT2015045',
	'Harsh Vardhan',
	'IIT2015045'
);

insert into students values
(
	'IIT2015046',
	'Sakshi Singh',
	'IIT2015046'
);

insert into students values
(
	'IIT2015047',
	'Rishabh Rai',
	'IIT2015047'
);

insert into students values
(
	'IIT2015048',
	'Aishwarya Dutt Maurya',
	'IIT2015048'
);

insert into students values
(
	'IIT2015049',
	'Shobhit Upadhyay',
	'IIT2015049'
);

insert into students values
(
	'IIT2015050',
	'Nitesh Gupta',
	'IIT2015050'
);

insert into students values
(
	'IIT2015051',
	'Moturu Diwakar',
	'IIT2015051'
);

insert into students values
(
	'IIT2015052',
	'Payal Prasad',
	'IIT2015052'
);

insert into students values
(
	'IIT2015053',
	'Supreet Kaur Sandhu',
	'IIT2015053'
);

insert into students values
(
	'IIT2015054',
	'Arpita Jaiswal',
	'IIT2015054'
);

insert into students values
(
	'IIT2015055',
	'Gajangi Shyam Sunder',
	'IIT2015055'
);

insert into students values
(
	'IIT2015056',
	'Chintala Krishna Vamshi',
	'IIT2015056'
);

insert into students values
(
	'IIT2015057',
	'Prabhat Rudrapratap Singh',
	'IIT2015057'
);

insert into students values
(
	'IIT2015058',
	'Boris Hembrom',
	'IIT2015058'
);

insert into students values
(
	'IIT2015059',
	'Tanmay Jaiswal',
	'IIT2015059'
);

insert into students values
(
	'IIT2015060',
	'Pentakota Dinesh',
	'IIT2015060'
);

insert into students values
(
	'IIT2015062',
	'Marturu Rajkumar',
	'IIT2015062'
);

insert into students values
(
	'IIT2015063',
	'Sudhanshu Negi',
	'IIT2015063'
);

insert into students values
(
	'IIT2015064',
	'Jayesh Patil',
	'IIT2015064'
);

insert into students values
(
	'IIT2015065',
	'Soumik Chatterjee',
	'IIT2015065'
);

insert into students values
(
	'IIT2015066',
	'Abhishek Nandan',
	'IIT2015066'
);

insert into students values
(
	'IIT2015067',
	'S Akash',
	'IIT2015067'
);

insert into students values
(
	'IIT2015068',
	'Rishabh',
	'IIT2015068'
);

insert into students values
(
	'IIT2015069',
	'Aditi',
	'IIT2015069'
);

insert into students values
(
	'IIT2015070',
	'Umang Narwal',
	'IIT2015070'
);

insert into students values
(
	'IIT2015071',
	'Piyush Arora',
	'IIT2015071'
);

insert into students values
(
	'IIT2015072',
	'Yash Gupta',
	'IIT2015072'
);

insert into students values
(
	'IIT2015073',
	'Rohan Chaudhary',
	'IIT2015073'
);

insert into students values
(
	'IIT2015074',
	'Padia Shubham Atulkumar',
	'IIT2015074'
);

insert into students values
(
	'IIT2015075',
	'Tushar Jandial',
	'IIT2015075'
);

insert into students values
(
	'IIT2015076',
	'Anurag Bhardwaj',
	'IIT2015076'
);

insert into students values
(
	'IIT2015077',
	'Abhishek Kumar',
	'IIT2015077'
);

insert into students values
(
	'IIT2015078',
	'Jitendra Kumar',
	'IIT2015078'
);

insert into students values
(
	'IIT2015079',
	'Mohammad Ayan Sheikh',
	'IIT2015079'
);

insert into students values
(
	'IIT2015080',
	'Ayush Bhatt',
	'IIT2015080'
);

insert into students values
(
	'IIT2015081',
	'Roshan Kumar',
	'IIT2015081'
);

insert into students values
(
	'IIT2015082',
	'Harpahul Singh Bhatia',
	'IIT2015082'
);

insert into students values
(
	'IIT2015083',
	'Shubham Bhandari',
	'IIT2015083'
);

insert into students values
(
	'IIT2015084',
	'Akash Kumar',
	'IIT2015084'
);

insert into students values
(
	'IIT2015085',
	'Swapnil Sharma',
	'IIT2015085'
);

insert into students values
(
	'IIT2015086',
	'Gadpayale Khushahal Ramlal',
	'IIT2015086'
);

insert into students values
(
	'IIT2015087',
	'Atul Kumar Sinha',
	'IIT2015087'
);

insert into students values
(
	'IIT2015088',
	'Sanjanwala Pranjal Anuj',
	'IIT2015088'
);

insert into students values
(
	'IIT2015089',
	'Arpit Prashant Bahety',
	'IIT2015089'
);

insert into students values
(
	'IIT2015090',
	'Himanshu Gusain',
	'IIT2015090'
);

insert into students values
(
	'IIT2015091',
	'Murarka Tushar Rajkumar',
	'IIT2015091'
);

insert into students values
(
	'IIT2015092',
	'Praveen Ronald Tudu',
	'IIT2015092'
);

insert into students values
(
	'IIT2015093',
	'Anand Mandloi',
	'IIT2015093'
);

insert into students values
(
	'IIT2015094',
	'Pranjul Tripathi',
	'IIT2015094'
);

insert into students values
(
	'IIT2015095',
	'Vinay Pandey',
	'IIT2015095'
);

insert into students values
(
	'IIT2015096',
	'Ritika Motwani',
	'IIT2015096'
);

insert into students values
(
	'IIT2015097',
	'Aditya Dewan',
	'IIT2015097'
);

insert into students values
(
	'IIT2015099',
	'Prajjawal Agarwal',
	'IIT2015099'
);

insert into students values
(
	'IIT2015101',
	'Priya Singh',
	'IIT2015101'
);

insert into students values
(
	'IIT2015102',
	'Sanginadham Anudeep',
	'IIT2015102'
);

insert into students values
(
	'IIT2015103',
	'Pradeep Kumar',
	'IIT2015103'
);

insert into students values
(
	'IIT2015104',
	'Ashwin Aishvarya Vardhan',
	'IIT2015104'
);

insert into students values
(
	'IIT2015105',
	'Yash Bhatia',
	'IIT2015105'
);

insert into students values
(
	'IIT2015106',
	'Sai Praneetha M',
	'IIT2015106'
);

insert into students values
(
	'IIT2015107',
	'Narendula Manigeeth',
	'IIT2015107'
);

insert into students values
(
	'IIT2015108',
	'Jhatothu Gopi Sivanandh',
	'IIT2015108'
);

insert into students values
(
	'IIT2015109',
	'Kadimetla Jaya Pavan Kumar Reddy',
	'IIT2015109'
);

insert into students values
(
	'IIT2015110',
	'Bhuvanagiri Eshwar Chandra',
	'IIT2015110'
);

insert into students values
(
	'IIT2015111',
	'Nagateja Banothu',
	'IIT2015111'
);

insert into students values
(
	'IIT2015112',
	'Subhash Kumar',
	'IIT2015112'
);

insert into students values
(
	'IIT2015113',
	'Faheem Hassan Zunjani',
	'IIT2015113'
);

insert into students values
(
	'IIT2015114',
	'Himanshu Verma',
	'IIT2015114'
);

insert into students values
(
	'IIT2015115',
	'Lohia Arpit Ajay',
	'IIT2015115'
);

insert into students values
(
	'IIT2015116',
	'Nimmala Anusha',
	'IIT2015116'
);

insert into students values
(
	'IIT2015117',
	'Santhosh Kumar K',
	'IIT2015117'
);

insert into students values
(
	'IIT2015118',
	'Vallambatla Niharika',
	'IIT2015118'
);

insert into students values
(
	'IIT2015119',
	'Gourab Dey',
	'IIT2015119'
);

insert into students values
(
	'IIT2015120',
	'Yadav Chaitanya Ashok',
	'IIT2015120'
);

insert into students values
(
	'IIT2015121',
	'Indresh Attri',
	'IIT2015121'
);

insert into students values
(
	'IIT2015122',
	'Rajat Bir Singh Bajwa',
	'IIT2015122'
);

insert into students values
(
	'IIT2015123',
	'Aayush Goyal',
	'IIT2015123'
);

insert into students values
(
	'IIT2015124',
	'Deepak Kumar Yadav',
	'IIT2015124'
);

insert into students values
(
	'IIT2015125',
	'Tanisha Keshri',
	'IIT2015125'
);

insert into students values
(
	'IIT2015126',
	'Abhishek Negi',
	'IIT2015126'
);

insert into students values
(
	'IIT2015127',
	'Pradyumna Prakhar Sinha',
	'IIT2015127'
);

insert into students values
(
	'IIT2015128',
	'D.rohan Veera Rao',
	'IIT2015128'
);

insert into students values
(
	'IIT2015129',
	'Pavan Kumar K',
	'IIT2015129'
);

insert into students values
(
	'IIT2015130',
	'Balaga Gayatri',
	'IIT2015130'
);

insert into students values
(
	'IIT2015131',
	'Pallavjeet Singh Nirwan',
	'IIT2015131'
);

insert into students values
(
	'IIT2015132',
	'Aakash Malik',
	'IIT2015132'
);

insert into students values
(
	'IIT2015133',
	'Manish Kumar',
	'IIT2015133'
);

insert into students values
(
	'IIT2015134',
	'Mubaris.n.k',
	'IIT2015134'
);

insert into students values
(
	'IIT2015136',
	'Komala.m',
	'IIT2015136'
);

insert into students values
(
	'IIT2015137',
	'Sama Praveen',
	'IIT2015137'
);

insert into students values
(
	'IIT2013001',
	'Abeer Khan',
	'IIT2013001'
);

insert into students values
(
	'IIT2013002',
	'Dikshant Devkota',
	'IIT2013002'
);

insert into students values
(
	'IIT2013003',
	'Syed Abdul Mabood',
	'IIT2013003'
);

insert into students values
(
	'IIT2013004',
	'Ujwal Rai',
	'IIT2013004'
);

insert into students values
(
	'IIT2013005',
	'Farzaan Ahmed V. Shaikh',
	'IIT2013005'
);

insert into students values
(
	'IIT2013006',
	'Medha Shree',
	'IIT2013006'
);

insert into students values
(
	'IIT2013007',
	'Pankhuri Tyagi',
	'IIT2013007'
);

insert into students values
(
	'IIT2013008',
	'Himadri Agarwal',
	'IIT2013008'
);

insert into students values
(
	'IIT2013009',
	'Sachin Pokharel',
	'IIT2013009'
);

insert into students values
(
	'IIT2013010',
	'Omar Hassan Shalla',
	'IIT2013010'
);

insert into students values
(
	'IIT2013011',
	'Pradeep Nagar',
	'IIT2013011'
);

insert into students values
(
	'IIT2013012',
	'Ayush Verma',
	'IIT2013012'
);

insert into students values
(
	'IIT2013013',
	'Neeraj Kumar',
	'IIT2013013'
);

insert into students values
(
	'IIT2013015',
	'Sanjay Singh',
	'IIT2013015'
);

insert into students values
(
	'IIT2013016',
	'Sonal Gupta',
	'IIT2013016'
);

insert into students values
(
	'IIT2013017',
	'Arpit Gupta',
	'IIT2013017'
);

insert into students values
(
	'IIT2013019',
	'Mohit Mangnani',
	'IIT2013019'
);

insert into students values
(
	'IIT2013020',
	'Ashish Kumar Gupta',
	'IIT2013020'
);

insert into students values
(
	'IIT2013022',
	'Sanchit Bhushan',
	'IIT2013022'
);

insert into students values
(
	'IIT2013023',
	'Osama Siddiqui',
	'IIT2013023'
);

insert into students values
(
	'IIT2013024',
	'Krishna Agarwal',
	'IIT2013024'
);

insert into students values
(
	'IIT2013025',
	'Eti Goel',
	'IIT2013025'
);

insert into students values
(
	'IIT2013026',
	'Diksha',
	'IIT2013026'
);

insert into students values
(
	'IIT2013027',
	'Vaibhav Srivastava',
	'IIT2013027'
);

insert into students values
(
	'IIT2013028',
	'Sanjay Rohit',
	'IIT2013028'
);

insert into students values
(
	'IIT2013029',
	'Surabhi',
	'IIT2013029'
);

insert into students values
(
	'IIT2013030',
	'Rajat Bhai',
	'IIT2013030'
);

insert into students values
(
	'IIT2013031',
	'Atishey Jain',
	'IIT2013031'
);

insert into students values
(
	'IIT2013032',
	'Amba Khare',
	'IIT2013032'
);

insert into students values
(
	'IIT2013033',
	'Kanwar Singh',
	'IIT2013033'
);

insert into students values
(
	'IIT2013034',
	'Praneel Rathore',
	'IIT2013034'
);

insert into students values
(
	'IIT2013035',
	'Tushar Sharma',
	'IIT2013035'
);

insert into students values
(
	'IIT2013036',
	'Aditya Varshney',
	'IIT2013036'
);

insert into students values
(
	'IIT2013037',
	'Shiv Dhingra',
	'IIT2013037'
);

insert into students values
(
	'IIT2013038',
	'Himanshu Tuteja',
	'IIT2013038'
);

insert into students values
(
	'IIT2013039',
	'Dikshant Gupta',
	'IIT2013039'
);

insert into students values
(
	'IIT2013040',
	'Pawan Kumar Sah',
	'IIT2013040'
);

insert into students values
(
	'IIT2013041',
	'Aashish Chaudhary',
	'IIT2013041'
);

insert into students values
(
	'IIT2013042',
	'Killamsetty Bhagyaraj',
	'IIT2013042'
);

insert into students values
(
	'IIT2013043',
	'Namit Agrawal',
	'IIT2013043'
);

insert into students values
(
	'IIT2013044',
	'Aditya Vardhan',
	'IIT2013044'
);

insert into students values
(
	'IIT2013045',
	'Tulika Saxena',
	'IIT2013045'
);

insert into students values
(
	'IIT2013046',
	'Priya Sagar',
	'IIT2013046'
);

insert into students values
(
	'IIT2013047',
	'Ankur Gupta',
	'IIT2013047'
);

insert into students values
(
	'IIT2013048',
	'Shelly',
	'IIT2013048'
);

insert into students values
(
	'IIT2013049',
	'Hardik Dosi',
	'IIT2013049'
);

insert into students values
(
	'IIT2013050',
	'Rajat Jaiswal',
	'IIT2013050'
);

insert into students values
(
	'IIT2013051',
	'Kartik Arora',
	'IIT2013051'
);

insert into students values
(
	'IIT2013052',
	'Vaibhav Singh',
	'IIT2013052'
);

insert into students values
(
	'IIT2013053',
	'Vinay Kumar Maurya',
	'IIT2013053'
);

insert into students values
(
	'IIT2013054',
	'Kamaldeep Singh',
	'IIT2013054'
);

insert into students values
(
	'IIT2013055',
	'Swapnil Saxena',
	'IIT2013055'
);

insert into students values
(
	'IIT2013056',
	'Amit Bhardwaj',
	'IIT2013056'
);

insert into students values
(
	'IIT2013057',
	'Nitesh Kumar Gaur',
	'IIT2013057'
);

insert into students values
(
	'IIT2013058',
	'Divyanshu Raj',
	'IIT2013058'
);

insert into students values
(
	'IIT2013059',
	'Ramsiya Meena',
	'IIT2013059'
);

insert into students values
(
	'IIT2013060',
	'Rahul Kumar',
	'IIT2013060'
);

insert into students values
(
	'IIT2013061',
	'Aayush Garg',
	'IIT2013061'
);

insert into students values
(
	'IIT2013062',
	'Lavesh Kaushik',
	'IIT2013062'
);

insert into students values
(
	'IIT2013063',
	'Deepak Kumar Sah',
	'IIT2013063'
);

insert into students values
(
	'IIT2013064',
	'Sakshi Yadav',
	'IIT2013064'
);

insert into students values
(
	'IIT2013065',
	'Yovan Sethi',
	'IIT2013065'
);

insert into students values
(
	'IIT2013066',
	'Adit Kumar',
	'IIT2013066'
);

insert into students values
(
	'IIT2013067',
	'Ajit Kumar Yadav',
	'IIT2013067'
);

insert into students values
(
	'IIT2013068',
	'Yanamadala Jaiprakash',
	'IIT2013068'
);

insert into students values
(
	'IIT2013069',
	'N R Kavya',
	'IIT2013069'
);

insert into students values
(
	'IIT2013070',
	'Vishal Saniyar',
	'IIT2013070'
);

insert into students values
(
	'IIT2013071',
	'Ashish Chauhan',
	'IIT2013071'
);

insert into students values
(
	'IIT2013072',
	'Vannepuri Praveen Kumar',
	'IIT2013072'
);

insert into students values
(
	'IIT2013073',
	'Rahul Kumar Keshri',
	'IIT2013073'
);

insert into students values
(
	'IIT2013074',
	'Shashank Sutihar',
	'IIT2013074'
);

insert into students values
(
	'IIT2013075',
	'Vishnu Ks',
	'IIT2013075'
);

insert into students values
(
	'IIT2013076',
	'Akshay Karnwal',
	'IIT2013076'
);

insert into students values
(
	'IIT2013077',
	'Megha Agrawal',
	'IIT2013077'
);

insert into students values
(
	'IIT2013079',
	'Ayush Awasthi',
	'IIT2013079'
);

insert into students values
(
	'IIT2013080',
	'Prabhat Kumar Arya',
	'IIT2013080'
);

insert into students values
(
	'IIT2013081',
	'Manisha Mahaur',
	'IIT2013081'
);

insert into students values
(
	'IIT2013082',
	'Shilpi Gautam',
	'IIT2013082'
);

insert into students values
(
	'IIT2013083',
	'Vaibhav Jain',
	'IIT2013083'
);

insert into students values
(
	'IIT2013084',
	'Prashant Varshney',
	'IIT2013084'
);

insert into students values
(
	'IIT2013085',
	'Kasturi Sai Krishna',
	'IIT2013085'
);

insert into students values
(
	'IIT2013086',
	'M. Vinay Raj',
	'IIT2013086'
);

insert into students values
(
	'IIT2013087',
	'Surabhi Chaudhary',
	'IIT2013087'
);

insert into students values
(
	'IIT2013088',
	'Shivam',
	'IIT2013088'
);

insert into students values
(
	'IIT2013090',
	'Harsha Agarawal',
	'IIT2013090'
);

insert into students values
(
	'IIT2013091',
	'Aishwarya Chaurasia',
	'IIT2013091'
);

insert into students values
(
	'IIT2013092',
	'Bhoopesh Kumar Goyal',
	'IIT2013092'
);

insert into students values
(
	'IIT2013093',
	'Maneesh Kumar Verma',
	'IIT2013093'
);

insert into students values
(
	'IIT2013094',
	'Shankar Yadav',
	'IIT2013094'
);

insert into students values
(
	'IIT2013095',
	'Rahul Raj',
	'IIT2013095'
);

insert into students values
(
	'IIT2013096',
	'Sarvapriya Raj',
	'IIT2013096'
);

insert into students values
(
	'IIT2013097',
	'Sujeet Kumar Jaiswal',
	'IIT2013097'
);

insert into students values
(
	'IIT2013098',
	'Pushpamala',
	'IIT2013098'
);

insert into students values
(
	'IIT2013099',
	'Abhishek Kumar',
	'IIT2013099'
);

insert into students values
(
	'IIT2013101',
	'Veeresh Gendle',
	'IIT2013101'
);

insert into students values
(
	'IIT2013102',
	'Nipun Jindal',
	'IIT2013102'
);

insert into students values
(
	'IIT2013104',
	'Shivam Kumar',
	'IIT2013104'
);

insert into students values
(
	'IIT2013105',
	'Yash Bansal',
	'IIT2013105'
);

insert into students values
(
	'IIT2013106',
	'Chintada Madhan Kumar',
	'IIT2013106'
);

insert into students values
(
	'IIT2013107',
	'Arpit Goel',
	'IIT2013107'
);

insert into students values
(
	'IIT2013108',
	'Chetram Chaudhary',
	'IIT2013108'
);

insert into students values
(
	'IIT2013109',
	'Abhishek Kumar',
	'IIT2013109'
);

insert into students values
(
	'IIT2013110',
	'Samarth Goyal',
	'IIT2013110'
);

insert into students values
(
	'IIT2013111',
	'Sachin Verma',
	'IIT2013111'
);

insert into students values
(
	'IIT2013112',
	'Vadthyavath Aravind',
	'IIT2013112'
);

insert into students values
(
	'IIT2013113',
	'Tanuj Sharma',
	'IIT2013113'
);

insert into students values
(
	'IIT2013114',
	'Aettapu Rahul',
	'IIT2013114'
);

insert into students values
(
	'IIT2013115',
	'Utkarsh Agarwal',
	'IIT2013115'
);

insert into students values
(
	'IIT2013116',
	'Salveru Anvesh',
	'IIT2013116'
);

insert into students values
(
	'IIT2013117',
	'Anirudh Gupta',
	'IIT2013117'
);

insert into students values
(
	'IIT2013118',
	'Tankala Harish',
	'IIT2013118'
);

insert into students values
(
	'IIT2013119',
	'Velthuri Abhishek',
	'IIT2013119'
);

insert into students values
(
	'IIT2013120',
	'Rajat Gupta',
	'IIT2013120'
);

insert into students values
(
	'IIT2013121',
	'Kumar Sanyam',
	'IIT2013121'
);

insert into students values
(
	'IIT2013122',
	'Baishali Saha',
	'IIT2013122'
);

insert into students values
(
	'IIT2013123',
	'Gyayak Sanghi',
	'IIT2013123'
);

insert into students values
(
	'IIT2013124',
	'Nipun',
	'IIT2013124'
);

insert into students values
(
	'IIT2013125',
	'Ankur',
	'IIT2013125'
);

insert into students values
(
	'IIT2013127',
	'Mayank Vijay',
	'IIT2013127'
);

insert into students values
(
	'IIT2013128',
	'Abhishek Kumar Agrawal',
	'IIT2013128'
);

insert into students values
(
	'IIT2013129',
	'Abhishek Jaiswal',
	'IIT2013129'
);

insert into students values
(
	'IIT2013130',
	'Raju Chaurasia',
	'IIT2013130'
);

insert into students values
(
	'IIT2013131',
	'Shubham Prasad',
	'IIT2013131'
);

insert into students values
(
	'IIT2013132',
	'Alka Ranjan',
	'IIT2013132'
);

insert into students values
(
	'IIT2013133',
	'K Ashwin',
	'IIT2013133'
);

insert into students values
(
	'IIT2013134',
	'Sp. Harish',
	'IIT2013134'
);

insert into students values
(
	'IIT2013135',
	'Shikhar Garg',
	'IIT2013135'
);

insert into students values
(
	'IIT2013136',
	'Hardeep',
	'IIT2013136'
);

insert into students values
(
	'IIT2013137',
	'Richa Sharma',
	'IIT2013137'
);

insert into students values
(
	'IIT2013138',
	'Manish Ved',
	'IIT2013138'
);

insert into students values
(
	'IIT2013139',
	'Apurv Khatri',
	'IIT2013139'
);

insert into students values
(
	'IIT2013140',
	'Prashant Gupta',
	'IIT2013140'
);

insert into students values
(
	'IIT2013141',
	'Akash Dubey',
	'IIT2013141'
);

insert into students values
(
	'IIT2013142',
	'Vishrut Mishra',
	'IIT2013142'
);

insert into students values
(
	'IIT2013143',
	'Amrita Singh',
	'IIT2013143'
);

insert into students values
(
	'IIT2013144',
	'Ekansh Katiyar',
	'IIT2013144'
);

insert into students values
(
	'IIT2013145',
	'Jagjot Singh',
	'IIT2013145'
);

insert into students values
(
	'IIT2013146',
	'Sagar Deshmukh',
	'IIT2013146'
);

insert into students values
(
	'IIT2013147',
	'Nalin Kanungo',
	'IIT2013147'
);

insert into students values
(
	'IIT2013148',
	'Navratna Sharma',
	'IIT2013148'
);

insert into students values
(
	'IIT2013149',
	'Shubham Chaudhary',
	'IIT2013149'
);

insert into students values
(
	'IIT2013151',
	'Sonu Singh Meena',
	'IIT2013151'
);

insert into students values
(
	'IIT2013153',
	'Juhi Kumari',
	'IIT2013153'
);

insert into students values
(
	'IIT2013154',
	'Vikas Gangwal',
	'IIT2013154'
);

insert into students values
(
	'IIT2013155',
	'Ashutosh Singh',
	'IIT2013155'
);

insert into students values
(
	'IIT2013156',
	'Vipul Verma',
	'IIT2013156'
);

insert into students values
(
	'IIT2013157',
	'Ankit Verma',
	'IIT2013157'
);

insert into students values
(
	'IIT2013158',
	'Sumit Sethia',
	'IIT2013158'
);

insert into students values
(
	'IIT2013159',
	'Abhishek Kumar',
	'IIT2013159'
);

insert into students values
(
	'IIT2013160',
	'Anand Kumar Kotriwal',
	'IIT2013160'
);

insert into students values
(
	'IIT2013161',
	'Pankaj Birat',
	'IIT2013161'
);

insert into students values
(
	'IIT2013162',
	'Rohit Tulasyan',
	'IIT2013162'
);

insert into students values
(
	'IIT2013163',
	'Shivam Mitra',
	'IIT2013163'
);

insert into students values
(
	'IIT2013164',
	'Ayushi Garg',
	'IIT2013164'
);

insert into students values
(
	'IIT2013165',
	'Mohit Kumar Pandey',
	'IIT2013165'
);

insert into students values
(
	'IIT2013166',
	'Abhishek Vijayan',
	'IIT2013166'
);

insert into students values
(
	'IIT2013167',
	'Ammisetty Manikanta',
	'IIT2013167'
);

insert into students values
(
	'IIT2013169',
	'Ankit Mund',
	'IIT2013169'
);

insert into students values
(
	'IIT2013170',
	'Richa Singh',
	'IIT2013170'
);

insert into students values
(
	'IIT2013171',
	'Ravula Keerthi Reddy',
	'IIT2013171'
);

insert into students values
(
	'IIT2013172',
	'B. Shubham Liladhar',
	'IIT2013172'
);

insert into students values
(
	'IIT2013173',
	'Manav Sharma',
	'IIT2013173'
);

insert into students values
(
	'IIT2013174',
	'Sneha Jha',
	'IIT2013174'
);

insert into students values
(
	'IIT2013176',
	'Pedakam Sneha',
	'IIT2013176'
);

insert into students values
(
	'IIT2013177',
	'Pukar Sapkota',
	'IIT2013177'
);

insert into students values
(
	'IIT2013178',
	'Sumit Kumar',
	'IIT2013178'
);

insert into students values
(
	'IIT2013179',
	'Akanksha Saini',
	'IIT2013179'
);

insert into students values
(
	'IIT2013180',
	'Shubham Gupta',
	'IIT2013180'
);

insert into students values
(
	'IIT2013181',
	'Chanchal Mishra',
	'IIT2013181'
);

insert into students values
(
	'IIT2013182',
	'Akshat Baboota',
	'IIT2013182'
);

insert into students values
(
	'IIT2013183',
	'Vijay Gupta',
	'IIT2013183'
);

insert into students values
(
	'IIT2013184',
	'Manish Meena',
	'IIT2013184'
);

insert into students values
(
	'IIT2013185',
	'Mehul Agarwal',
	'IIT2013185'
);

insert into students values
(
	'IIT2013186',
	'Rajnandan Sikdar',
	'IIT2013186'
);

insert into students values
(
	'IIT2013187',
	'Abhishek',
	'IIT2013187'
);

insert into students values
(
	'IIT2013188',
	'Mukesh Kumar',
	'IIT2013188'
);

insert into students values
(
	'IIT2013189',
	'Neeraj Agarwal',
	'IIT2013189'
);

insert into students values
(
	'IIT2013190',
	'Rishabh Tiwari',
	'IIT2013190'
);

insert into students values
(
	'IIT2013191',
	'Harish Kumar',
	'IIT2013191'
);

insert into students values
(
	'IIT2013192',
	'Tanushree Anand',
	'IIT2013192'
);

insert into students values
(
	'IIT2013193',
	'Saptak Sengupta',
	'IIT2013193'
);

insert into students values
(
	'IIT2013194',
	'Priyank Upadhya',
	'IIT2013194'
);

insert into students values
(
	'IIT2013195',
	'Sonu Kumawat',
	'IIT2013195'
);

insert into students values
(
	'IIT2013196',
	'Shaiwal Sachdev',
	'IIT2013196'
);

insert into students values
(
	'IIT2013197',
	'Vivek Anand',
	'IIT2013197'
);

insert into students values
(
	'IIT2013198',
	'Anurag Das',
	'IIT2013198'
);

insert into students values
(
	'IIT2013199',
	'Rokkam Sai Naga Rohith',
	'IIT2013199'
);

insert into students values
(
	'IIT2013200',
	'Amit Kumar Gautam',
	'IIT2013200'
);

insert into students values
(
	'IIT2013201',
	'Rathod Ravinder',
	'IIT2013201'
);

insert into students values
(
	'IIT2013202',
	'Anurag Pasi',
	'IIT2013202'
);

insert into students values
(
	'IIT2013203',
	'Vangapalli Tejasree',
	'IIT2013203'
);

insert into students values
(
	'IIT2013204',
	'Shobhit Sharma',
	'IIT2013204'
);

insert into students values
(
	'IIT2013205',
	'Rasthapuram Sumalatha',
	'IIT2013205'
);

insert into students values
(
	'IIT2013206',
	'Shreyas Satyamurthy',
	'IIT2013206'
);

insert into students values
(
	'IIT2013207',
	'Akash Yadav',
	'IIT2013207'
);

insert into students values
(
	'IIT2013208',
	'Shubham Nanda',
	'IIT2013208'
);

insert into students values
(
	'IIT2013209',
	'Mansi Jaiswal',
	'IIT2013209'
);

insert into students values
(
	'IIT2013210',
	'Pratham Pandey',
	'IIT2013210'
);

insert into students values
(
	'IIT2013211',
	'Yashika',
	'IIT2013211'
);

insert into students values
(
	'IIT2013212',
	'Sanjeev S',
	'IIT2013212'
);

insert into students values
(
	'IIT2015138',
	'Vaibhav Bansal',
	'IIT2015138'
);

insert into students values
(
	'IIT2015139',
	'Santosh Kumar',
	'IIT2015139'
);

insert into students values
(
	'IIT2015140',
	'Thotapalli Sadvi Ramana',
	'IIT2015140'
);

insert into students values
(
	'IIT2015141',
	'Vishal Kumar Singh',
	'IIT2015141'
);

insert into students values
(
	'IIT2015142',
	'Kamlesh Gupta',
	'IIT2015142'
);

insert into students values
(
	'IIT2015143',
	'Anurag Kumar',
	'IIT2015143'
);

insert into students values
(
	'IIT2015144',
	'Shyam K Kotecha',
	'IIT2015144'
);

insert into students values
(
	'IIT2015145',
	'Dipendra Singh',
	'IIT2015145'
);

insert into students values
(
	'IIT2015146',
	'Shivam',
	'IIT2015146'
);

insert into students values
(
	'IIT2016001',
	'Owais Saad Shuja',
	'IIT2016001'
);

insert into students values
(
	'IIT2016002',
	'Pallak Srivastava',
	'IIT2016002'
);

insert into students values
(
	'IIT2016003',
	'Kanishka Shekhar',
	'IIT2016003'
);

insert into students values
(
	'IIT2016004',
	'Rakesh Ranjan',
	'IIT2016004'
);

insert into students values
(
	'IIT2016005',
	'Mohammed Nabeel A V Jawahir',
	'IIT2016005'
);

insert into students values
(
	'IIT2016006',
	'Rishabh Agnihotri',
	'IIT2016006'
);

insert into students values
(
	'IIT2016007',
	'Mantek Singh',
	'IIT2016007'
);

insert into students values
(
	'IIT2016008',
	'Gaurav Tiwari',
	'IIT2016008'
);

insert into students values
(
	'IIT2016009',
	'Lakshya Khattar',
	'IIT2016009'
);

insert into students values
(
	'IIT2016010',
	'Subham Raj',
	'IIT2016010'
);

insert into students values
(
	'IIT2016011',
	'Mukul Kumar Singh',
	'IIT2016011'
);

insert into students values
(
	'IIT2016012',
	'Mandeep Chakma',
	'IIT2016012'
);

insert into students values
(
	'IIT2016013',
	'Divy Prakash Vaishnav',
	'IIT2016013'
);

insert into students values
(
	'IIT2016014',
	'Akash Dixit',
	'IIT2016014'
);

insert into students values
(
	'IIT2016015',
	'Nishant Malik',
	'IIT2016015'
);

insert into students values
(
	'IIT2016016',
	'Mansi Choudhary',
	'IIT2016016'
);

insert into students values
(
	'IIT2016017',
	'Ashutosh Vishwakarma',
	'IIT2016017'
);

insert into students values
(
	'IIT2016018',
	'Akshay Kumar',
	'IIT2016018'
);

insert into students values
(
	'IIT2016019',
	'Basireddy Durga Shruti Reddy',
	'IIT2016019'
);

insert into students values
(
	'IIT2016020',
	'Garima Chadha',
	'IIT2016020'
);

insert into students values
(
	'IIT2016021',
	'Yashwardhan Gupta',
	'IIT2016021'
);

insert into students values
(
	'IIT2016022',
	'Mridul Atul Gupta',
	'IIT2016022'
);

insert into students values
(
	'IIT2016023',
	'Shubhangi Nigam',
	'IIT2016023'
);

insert into students values
(
	'IIT2016024',
	'Ankit Kumar',
	'IIT2016024'
);

insert into students values
(
	'IIT2016025',
	'Shiv Kumar Yadav',
	'IIT2016025'
);

insert into students values
(
	'IIT2016026',
	'Parth Agarwal',
	'IIT2016026'
);

insert into students values
(
	'IIT2016027',
	'Deepak Kumar',
	'IIT2016027'
);

insert into students values
(
	'IIT2016028',
	'Prathmesh Pathwar',
	'IIT2016028'
);

insert into students values
(
	'IIT2016029',
	'Prakash Kumar Yadav',
	'IIT2016029'
);

insert into students values
(
	'IIT2016030',
	'G Srisha Anagh',
	'IIT2016030'
);

insert into students values
(
	'IIT2016031',
	'Guggilla Apoorva',
	'IIT2016031'
);

insert into students values
(
	'IIT2016032',
	'Rohit Kumar',
	'IIT2016032'
);

insert into students values
(
	'IIT2016033',
	'Akash Mishra',
	'IIT2016033'
);

insert into students values
(
	'IIT2016034',
	'Vaibhav Srivastava',
	'IIT2016034'
);

insert into students values
(
	'IIT2016035',
	'Piyush Dinkar Gurnule',
	'IIT2016035'
);

insert into students values
(
	'IIT2016036',
	'Arindam Das Modak',
	'IIT2016036'
);

insert into students values
(
	'IIT2016037',
	'Deepanshu Goyal',
	'IIT2016037'
);

insert into students values
(
	'IIT2016038',
	'Gagan Ganapathy Sudhir Ajjikuttira',
	'IIT2016038'
);

insert into students values
(
	'IIT2016039',
	'Sai Charan Teja Tanguturu',
	'IIT2016039'
);

insert into students values
(
	'IIT2016040',
	'Anmol Singh Sethi',
	'IIT2016040'
);

insert into students values
(
	'IIT2016041',
	'Vikash Kumar',
	'IIT2016041'
);

insert into students values
(
	'IIT2016042',
	'Manavdeep Singh',
	'IIT2016042'
);

insert into students values
(
	'IIT2016043',
	'Rollicks Lakra',
	'IIT2016043'
);

insert into students values
(
	'IIT2016044',
	'Sindhu Bachu',
	'IIT2016044'
);

insert into students values
(
	'IIT2016045',
	'Saurabh Mishra',
	'IIT2016045'
);

insert into students values
(
	'IIT2016046',
	'Rajaram Jat',
	'IIT2016046'
);

insert into students values
(
	'IIT2016047',
	'Rishab Agarwal',
	'IIT2016047'
);

insert into students values
(
	'IIT2016048',
	'Gaurav Gehlot',
	'IIT2016048'
);

insert into students values
(
	'IIT2016049',
	'Vipul Singhal',
	'IIT2016049'
);

insert into students values
(
	'IIT2016050',
	'Ankit Shrey',
	'IIT2016050'
);

insert into students values
(
	'IIT2016051',
	'Austin Kispotta',
	'IIT2016051'
);

insert into students values
(
	'IIT2016052',
	'Rakesh Lakra',
	'IIT2016052'
);

insert into students values
(
	'IIT2016053',
	'Surabhi Pramod Gogte',
	'IIT2016053'
);

insert into students values
(
	'IIT2016054',
	'Prateek Saraswat',
	'IIT2016054'
);

insert into students values
(
	'IIT2016055',
	'Harshit Agarwal',
	'IIT2016055'
);

insert into students values
(
	'IIT2016056',
	'Prajal Bhandari',
	'IIT2016056'
);

insert into students values
(
	'IIT2016057',
	'Akshat Jain',
	'IIT2016057'
);

insert into students values
(
	'IIT2016058',
	'Vikas Kumar',
	'IIT2016058'
);

insert into students values
(
	'IIT2016059',
	'Manish Ranjan',
	'IIT2016059'
);

insert into students values
(
	'IIT2016060',
	'Harshit Jain',
	'IIT2016060'
);

insert into students values
(
	'IIT2016061',
	'Himank Goel',
	'IIT2016061'
);

insert into students values
(
	'IIT2016062',
	'Sunil Sohanlal Bansiwal',
	'IIT2016062'
);

insert into students values
(
	'IIT2016063',
	'Yash Yadav',
	'IIT2016063'
);

insert into students values
(
	'IIT2016064',
	'Sumit Diwakar',
	'IIT2016064'
);

insert into students values
(
	'IIT2016065',
	'Manan Maheshwari',
	'IIT2016065'
);

insert into students values
(
	'IIT2016066',
	'Nandan Raj',
	'IIT2016066'
);

insert into students values
(
	'IIT2016067',
	'Maanas Vohra',
	'IIT2016067'
);

insert into students values
(
	'IIT2016068',
	'Shreyansh Chaudhary',
	'IIT2016068'
);

insert into students values
(
	'IIT2016069',
	'Siddhant Gautam',
	'IIT2016069'
);

insert into students values
(
	'IIT2016070',
	'Hemant Singh',
	'IIT2016070'
);

insert into students values
(
	'IIT2016071',
	'Maruthi Kashyap Vissapragada',
	'IIT2016071'
);

insert into students values
(
	'IIT2016072',
	'Badnena Svvr Upendra',
	'IIT2016072'
);

insert into students values
(
	'IIT2016073',
	'Himanshu Bharti',
	'IIT2016073'
);

insert into students values
(
	'IIT2016074',
	'Nitin Vijay',
	'IIT2016074'
);

insert into students values
(
	'IIT2016075',
	'Siddharth Simharaju',
	'IIT2016075'
);

insert into students values
(
	'IIT2016076',
	'Swapnil Sheshrao Gharat',
	'IIT2016076'
);

insert into students values
(
	'IIT2016077',
	'Iqrar Ahmad',
	'IIT2016077'
);

insert into students values
(
	'IIT2016078',
	'Dheeraj Chouhan',
	'IIT2016078'
);

insert into students values
(
	'IIT2016079',
	'Harsh Jain',
	'IIT2016079'
);

insert into students values
(
	'IIT2016080',
	'Priyanka Karnati',
	'IIT2016080'
);

insert into students values
(
	'IIT2016081',
	'Pulkit Dinesh Chandra Jaroli',
	'IIT2016081'
);

insert into students values
(
	'IIT2016082',
	'Tondomker Sai Sathy Praful',
	'IIT2016082'
);

insert into students values
(
	'IIT2016083',
	'Madhur Gupta',
	'IIT2016083'
);

insert into students values
(
	'IIT2016084',
	'Shubham',
	'IIT2016084'
);

insert into students values
(
	'IIT2016085',
	'Luv',
	'IIT2016085'
);

insert into students values
(
	'IIT2016086',
	'Pranav Mahajan',
	'IIT2016086'
);

insert into students values
(
	'IIT2016087',
	'Saurabh Dabas',
	'IIT2016087'
);

insert into students values
(
	'IIT2016088',
	'Simran Gill',
	'IIT2016088'
);

insert into students values
(
	'IIT2016089',
	'Reena Yadav',
	'IIT2016089'
);

insert into students values
(
	'IIT2016090',
	'Saksham Singh',
	'IIT2016090'
);

insert into students values
(
	'IIT2016091',
	'Anirudhsingh Rathore',
	'IIT2016091'
);

insert into students values
(
	'IIT2016092',
	'Ashish Agarwal',
	'IIT2016092'
);

insert into students values
(
	'IIT2016094',
	'Akshat',
	'IIT2016094'
);

insert into students values
(
	'IIT2016095',
	'Parag Parihar',
	'IIT2016095'
);

insert into students values
(
	'IIT2016096',
	'Kalagara Sarath Chandra Krishna Preetham',
	'IIT2016096'
);

insert into students values
(
	'IIT2016097',
	'Sashi Tarun Kondapalli',
	'IIT2016097'
);

insert into students values
(
	'IIT2016098',
	'Shubhrajit Mandal',
	'IIT2016098'
);

insert into students values
(
	'IIT2016099',
	'Sanika Sudam Surse',
	'IIT2016099'
);

insert into students values
(
	'IIT2016100',
	'Sourav Mitra',
	'IIT2016100'
);

insert into students values
(
	'IIT2016101',
	'Lekhika Dugtal',
	'IIT2016101'
);

insert into students values
(
	'IIT2016102',
	'Aashutosh Mundra',
	'IIT2016102'
);

insert into students values
(
	'IIT2016103',
	'Chahak Sharma',
	'IIT2016103'
);

insert into students values
(
	'IIT2016104',
	'Pravin Brijmohan Rathore',
	'IIT2016104'
);

insert into students values
(
	'IIT2016105',
	'Aswanth K',
	'IIT2016105'
);

insert into students values
(
	'IIT2016106',
	'Aswin Vb',
	'IIT2016106'
);

insert into students values
(
	'IIT2016107',
	'Amit K S',
	'IIT2016107'
);

insert into students values
(
	'IIT2016108',
	'Harshit Agarwal',
	'IIT2016108'
);

insert into students values
(
	'IIT2016109',
	'Bhargav Satya Narasimha Chinta',
	'IIT2016109'
);

insert into students values
(
	'IIT2016110',
	'Vipul Sharma',
	'IIT2016110'
);

insert into students values
(
	'IIT2016111',
	'Kadambari Anuranjana',
	'IIT2016111'
);

insert into students values
(
	'IIT2016112',
	'Mohit Verma',
	'IIT2016112'
);

insert into students values
(
	'IIT2016113',
	'Siddhanth Babu Jagluri Gajendra Rao',
	'IIT2016113'
);

insert into students values
(
	'IIT2016114',
	'Sarabjyotsingh Charan Singh Multani',
	'IIT2016114'
);

insert into students values
(
	'IIT2016115',
	'Kundan Solanki',
	'IIT2016115'
);

insert into students values
(
	'IIT2016116',
	'Shyam Kumar',
	'IIT2016116'
);

insert into students values
(
	'IIT2016117',
	'Utkarsh Agarwal',
	'IIT2016117'
);

insert into students values
(
	'IIT2016118',
	'Abhijeet Prakash',
	'IIT2016118'
);

insert into students values
(
	'IIT2016119',
	'Pawan Patidar',
	'IIT2016119'
);

insert into students values
(
	'IIT2016120',
	'Avanish Chand',
	'IIT2016120'
);

insert into students values
(
	'IIT2016121',
	'Abhishek Kumar',
	'IIT2016121'
);

insert into students values
(
	'IIT2016122',
	'Shivam Fialok',
	'IIT2016122'
);

insert into students values
(
	'IIT2016123',
	'Balaji Ramavathu',
	'IIT2016123'
);

insert into students values
(
	'IIT2016124',
	'Chandan Kumar',
	'IIT2016124'
);

insert into students values
(
	'IIT2016125',
	'Neil Leeson Syiemlieh',
	'IIT2016125'
);

insert into students values
(
	'IIT2016126',
	'Madamshetty Sai Rakshit',
	'IIT2016126'
);

insert into students values
(
	'IIT2016127',
	'Rohit Rohit',
	'IIT2016127'
);

insert into students values
(
	'IIT2016128',
	'Anupam Dagar',
	'IIT2016128'
);

insert into students values
(
	'IIT2016129',
	'Rohan Vinod Bhalerao',
	'IIT2016129'
);

insert into students values
(
	'IIT2016130',
	'Elaine Mary Rose',
	'IIT2016130'
);

insert into students values
(
	'IIT2016131',
	'Anil Gupta Somisetty',
	'IIT2016131'
);

insert into students values
(
	'IIT2016132',
	'Nitin Raj Namdev Balaji Singh',
	'IIT2016132'
);

insert into students values
(
	'IIT2016133',
	'Utpal Aman',
	'IIT2016133'
);

insert into students values
(
	'IIT2016134',
	'Ridam Arora',
	'IIT2016134'
);

insert into students values
(
	'IIT2016135',
	'Varun Singh',
	'IIT2016135'
);

insert into students values
(
	'IIT2016136',
	'Tanya Agarwal',
	'IIT2016136'
);

insert into students values
(
	'IIT2016137',
	'Sheldon Lawrence Tauro',
	'IIT2016137'
);

insert into students values
(
	'IIT2016138',
	'Manas Ranjan Adha',
	'IIT2016138'
);

insert into students values
(
	'IIT2016139',
	'Rochisha Haldyani',
	'IIT2016139'
);

insert into students values
(
	'IIT2016140',
	'Ranjan Kumar',
	'IIT2016140'
);

insert into students values
(
	'IIT2016141',
	'Chodisetti Ravi Chandra',
	'IIT2016141'
);

insert into students values
(
	'IIT2016142',
	'Rahul Udaiwal',
	'IIT2016142'
);

insert into students values
(
	'IIT2016143',
	'Anshuman Anshuman',
	'IIT2016143'
);

insert into students values
(
	'IIT2012094',
	'Gadi Kedhar Naidu',
	'IIT2012094'
);

insert into students values
(
	'IIT2012030',
	'Saheb Kumar Ram',
	'IIT2012030'
);

insert into students values
(
	'IEC2013003',
	'Abhishek Panchal',
	'IEC2013003'
);

insert into students values
(
	'IEC2013004',
	'Shashwat Srivastava',
	'IEC2013004'
);

insert into students values
(
	'IEC2013005',
	'Ruhi',
	'IEC2013005'
);

insert into students values
(
	'IEC2013006',
	'Shreyans Tiwari',
	'IEC2013006'
);

insert into students values
(
	'IEC2013007',
	'Shivam Singh',
	'IEC2013007'
);

insert into students values
(
	'IEC2013008',
	'Dhruv Raj Singh',
	'IEC2013008'
);

insert into students values
(
	'IEC2013009',
	'Prashant Kapoor',
	'IEC2013009'
);

insert into students values
(
	'IEC2013010',
	'Vishal Singh',
	'IEC2013010'
);

insert into students values
(
	'IEC2013012',
	'Guglavath Rakesh',
	'IEC2013012'
);

insert into students values
(
	'IEC2013013',
	'Subham Sharma',
	'IEC2013013'
);

insert into students values
(
	'IEC2013014',
	'Amit Anand',
	'IEC2013014'
);

insert into students values
(
	'IEC2013015',
	'Sweety Kumari',
	'IEC2013015'
);

insert into students values
(
	'IEC2013016',
	'Kumar Shubham Singh',
	'IEC2013016'
);

insert into students values
(
	'IEC2013017',
	'Hetiraj Himanshu',
	'IEC2013017'
);

insert into students values
(
	'IEC2013018',
	'Vishnu Agarwal',
	'IEC2013018'
);

insert into students values
(
	'IEC2013020',
	'Anil Kumar',
	'IEC2013020'
);

insert into students values
(
	'IEC2013021',
	'Saini Arpit Shripal',
	'IEC2013021'
);

insert into students values
(
	'IEC2013022',
	'Komatireddy Sneha',
	'IEC2013022'
);

insert into students values
(
	'IEC2013023',
	'Ajit Kumar',
	'IEC2013023'
);

insert into students values
(
	'IEC2013025',
	'Amol Kumar Paswan',
	'IEC2013025'
);

insert into students values
(
	'IEC2013026',
	'Akshat Sood',
	'IEC2013026'
);

insert into students values
(
	'IEC2013027',
	'Vineel Sreedhar Reddy Kaipu',
	'IEC2013027'
);

insert into students values
(
	'IEC2013031',
	'Trisha Singh',
	'IEC2013031'
);

insert into students values
(
	'IEC2013033',
	'Govind',
	'IEC2013033'
);

insert into students values
(
	'IEC2013034',
	'Puthi Bhavana',
	'IEC2013034'
);

insert into students values
(
	'IEC2013035',
	'Suraj Prasad',
	'IEC2013035'
);

insert into students values
(
	'IEC2013036',
	'Shubham Dewangan',
	'IEC2013036'
);

insert into students values
(
	'IEC2013037',
	'Yashaswa Jain',
	'IEC2013037'
);

insert into students values
(
	'IEC2013038',
	'Tanmay Binjrajka',
	'IEC2013038'
);

insert into students values
(
	'IEC2013039',
	'Thuniki Yashwanth Reddy',
	'IEC2013039'
);

insert into students values
(
	'IEC2013040',
	'Cherukuri Surya',
	'IEC2013040'
);

insert into students values
(
	'IEC2013041',
	'Aman Mahajan',
	'IEC2013041'
);

insert into students values
(
	'IEC2013042',
	'Shikhar Bhatia',
	'IEC2013042'
);

insert into students values
(
	'IEC2013044',
	'Shubhankar Mishra',
	'IEC2013044'
);

insert into students values
(
	'IEC2013045',
	'Kotla Rakesh Kumar Reddy',
	'IEC2013045'
);

insert into students values
(
	'IEC2013046',
	'Manoj Kumar',
	'IEC2013046'
);

insert into students values
(
	'IEC2013047',
	'Karada Hareesh',
	'IEC2013047'
);

insert into students values
(
	'IEC2013048',
	'Banoth Ravindar',
	'IEC2013048'
);

insert into students values
(
	'IEC2013050',
	'Apoorva Agrawal',
	'IEC2013050'
);

insert into students values
(
	'IEC2013051',
	'Mohit Rewtani',
	'IEC2013051'
);

insert into students values
(
	'IEC2013052',
	'Gagan Kumar',
	'IEC2013052'
);

insert into students values
(
	'IEC2013053',
	'D. Venkata Vamsi Krishna',
	'IEC2013053'
);

insert into students values
(
	'IEC2013054',
	'Ajay Pratap Srivas',
	'IEC2013054'
);

insert into students values
(
	'IEC2013055',
	'Ayushi Gupta',
	'IEC2013055'
);

insert into students values
(
	'IEC2013056',
	'Kartikeya Kumar Kashyap',
	'IEC2013056'
);

insert into students values
(
	'IEC2013057',
	'Ankit Nigam',
	'IEC2013057'
);

insert into students values
(
	'IEC2013058',
	'Jantraj Meena',
	'IEC2013058'
);

insert into students values
(
	'IEC2013059',
	'Manan Jain',
	'IEC2013059'
);

insert into students values
(
	'IEC2013061',
	'Mahajan Piyush Diwakarrao',
	'IEC2013061'
);

insert into students values
(
	'IEC2013062',
	'Ankit Kumar Sihara',
	'IEC2013062'
);

insert into students values
(
	'IEC2013063',
	'Bodduluri Nikhil Sowrya',
	'IEC2013063'
);

insert into students values
(
	'IEC2013064',
	'Sonu Singh Yadav',
	'IEC2013064'
);

insert into students values
(
	'IEC2013065',
	'Anjana Singh',
	'IEC2013065'
);

insert into students values
(
	'IEC2013066',
	'Seerapu Adhitya Shasa Sai',
	'IEC2013066'
);

insert into students values
(
	'IEC2013067',
	'Kriti Vaish',
	'IEC2013067'
);

insert into students values
(
	'IEC2013068',
	'Sumit Kumar Verma',
	'IEC2013068'
);

insert into students values
(
	'IEC2013069',
	'Akhil',
	'IEC2013069'
);

insert into students values
(
	'IEC2013071',
	'Sinha Aditya Vikram',
	'IEC2013071'
);

insert into students values
(
	'IEC2013072',
	'R Srivastav',
	'IEC2013072'
);

insert into students values
(
	'IEC2013073',
	'Amit Agrawal',
	'IEC2013073'
);

insert into students values
(
	'IEC2013074',
	'Banoth Rajashekhar',
	'IEC2013074'
);

insert into students values
(
	'IEC2013075',
	'Priyamvada',
	'IEC2013075'
);

insert into students values
(
	'IEC2013076',
	'Yash Gupta',
	'IEC2013076'
);

insert into students values
(
	'IEC2013077',
	'Munawwar Hameed Nazri',
	'IEC2013077'
);

insert into students values
(
	'IEC2013078',
	'Arushi Goel',
	'IEC2013078'
);

insert into students values
(
	'IEC2013079',
	'Arpit Singh',
	'IEC2013079'
);

insert into students values
(
	'IEC2013080',
	'Aniket Mukherjee',
	'IEC2013080'
);

insert into students values
(
	'IEC2013082',
	'Ashwani Kumar',
	'IEC2013082'
);

insert into students values
(
	'IEC2013083',
	'Karingu Sumanth Goud',
	'IEC2013083'
);

insert into students values
(
	'IEC2013084',
	'Rishav Gupta',
	'IEC2013084'
);

insert into students values
(
	'IEC2013085',
	'Saurav Jha',
	'IEC2013085'
);

insert into students values
(
	'IEC2013086',
	'Vipin Verma',
	'IEC2013086'
);

insert into students values
(
	'IEC2013087',
	'Rajan Kumar',
	'IEC2013087'
);

insert into students values
(
	'IEC2013088',
	'Shobhit Mittal',
	'IEC2013088'
);

insert into students values
(
	'IEC2013090',
	'Nitin Kumar Singh',
	'IEC2013090'
);

insert into students values
(
	'IEC2013091',
	'Chitturi Sri Abhinaya',
	'IEC2013091'
);

insert into students values
(
	'IEC2013092',
	'Prashant Kumar',
	'IEC2013092'
);

insert into students values
(
	'IEC2013093',
	'Shirin Patil',
	'IEC2013093'
);

insert into students values
(
	'IEC2013094',
	'Niketan Santosh Rane',
	'IEC2013094'
);

insert into students values
(
	'IEC2013095',
	'Rishabh Malhorta',
	'IEC2013095'
);

insert into students values
(
	'IEC2013096',
	'Vartul Sharma',
	'IEC2013096'
);

insert into students values
(
	'IEC2013097',
	'Puja Kumari',
	'IEC2013097'
);

insert into students values
(
	'IEC2013098',
	'Agrima Gurnani',
	'IEC2013098'
);

insert into students values
(
	'IEC2013099',
	'Abhilash Gupta',
	'IEC2013099'
);

insert into students values
(
	'IEC2013100',
	'Gautham Anand',
	'IEC2013100'
);

insert into students values
(
	'IEC2013101',
	'Raghav Garg',
	'IEC2013101'
);

insert into students values
(
	'IEC2013102',
	'Pankaj Kumawat',
	'IEC2013102'
);

insert into students values
(
	'IEC2013103',
	'Manjari',
	'IEC2013103'
);

insert into students values
(
	'IEC2014011',
	'Gaurav',
	'IEC2014011'
);

insert into students values
(
	'IEC2014082',
	'Abhinay Reddy',
	'IEC2014082'
);

insert into students values
(
	'IEC2014047',
	'Sonkar',
	'IEC2014047'
);

insert into students values
(
	'IEC2014080',
	'Ankit Arora',
	'IEC2014080'
);

insert into students values
(
	'IEC2014001',
	'Singh',
	'IEC2014001'
);

insert into students values
(
	'IEC2014014',
	'Anand',
	'IEC2014014'
);

insert into students values
(
	'IEC2014065',
	'Singh',
	'IEC2014065'
);

insert into students values
(
	'IEC2014044',
	'Bairwa',
	'IEC2014044'
);

insert into students values
(
	'IEC2014039',
	'Bharti',
	'IEC2014039'
);

insert into students values
(
	'IEC2014075',
	'Bhavith',
	'IEC2014075'
);

insert into students values
(
	'IEC2014020',
	'Medozonuo Suohu',
	'IEC2014020'
);

insert into students values
(
	'IEC2014037',
	'Ganesh',
	'IEC2014037'
);

insert into students values
(
	'IEC2014021',
	'Kumar',
	'IEC2014021'
);

insert into students values
(
	'IEC2014078',
	'Dahiya',
	'IEC2014078'
);

insert into students values
(
	'IEC2014015',
	'Deepak Kumar',
	'IEC2014015'
);

insert into students values
(
	'IEC2014049',
	'Ram',
	'IEC2014049'
);

insert into students values
(
	'IEC2014030',
	'Hari Krishna',
	'IEC2014030'
);

insert into students values
(
	'IEC2014033',
	'Midhun Kumar',
	'IEC2014033'
);

insert into students values
(
	'IEC2014068',
	'Lal',
	'IEC2014068'
);

insert into students values
(
	'IEC2014051',
	'Anindya Mukherjee',
	'IEC2014051'
);

insert into students values
(
	'IEC2014055',
	'Avinash Reddy',
	'IEC2014055'
);

insert into students values
(
	'IEC2014056',
	'Raj',
	'IEC2014056'
);

insert into students values
(
	'IEC2014057',
	'Rohilla',
	'IEC2014057'
);

insert into students values
(
	'IEC2014025',
	'Sagar',
	'IEC2014025'
);

insert into students values
(
	'IEC2014067',
	'Jitendra Kumar',
	'IEC2014067'
);

insert into students values
(
	'IEC2014083',
	'Kumar',
	'IEC2014083'
);

insert into students values
(
	'IEC2014048',
	'Vamsi Krishna',
	'IEC2014048'
);

insert into students values
(
	'IEC2014002',
	'Sundar',
	'IEC2014002'
);

insert into students values
(
	'IEC2014004',
	'Harikrishnan',
	'IEC2014004'
);

insert into students values
(
	'IEC2014043',
	'Manikanth Reddy',
	'IEC2014043'
);

insert into students values
(
	'IEC2014024',
	'Kaur',
	'IEC2014024'
);

insert into students values
(
	'IEC2014071',
	'Mittal',
	'IEC2014071'
);

insert into students values
(
	'IEC2014081',
	'Shukla',
	'IEC2014081'
);

insert into students values
(
	'IEC2014074',
	'Maheshwari',
	'IEC2014074'
);

insert into students values
(
	'IEC2014084',
	'Venkatkalyan',
	'IEC2014084'
);

insert into students values
(
	'IEC2014005',
	'Mishra',
	'IEC2014005'
);

insert into students values
(
	'IEC2014050',
	'Sai Pradeep Mohan Krishna',
	'IEC2014050'
);

insert into students values
(
	'IEC2014045',
	'Meena',
	'IEC2014045'
);

insert into students values
(
	'IEC2014007',
	'Siddharth Sagar',
	'IEC2014007'
);

insert into students values
(
	'IEC2014052',
	'Satheesh Kumar',
	'IEC2014052'
);

insert into students values
(
	'IEC2014062',
	'Kashyap',
	'IEC2014062'
);

insert into students values
(
	'IEC2014010',
	'Gandla Amit Kumar',
	'IEC2014010'
);

insert into students values
(
	'IEC2014042',
	'Harsha Vardhan Reddy',
	'IEC2014042'
);

insert into students values
(
	'IEC2014016',
	'Singh',
	'IEC2014016'
);

insert into students values
(
	'IEC2014053',
	'Venkata Sarath Kumar',
	'IEC2014053'
);

insert into students values
(
	'IEC2014077',
	'Surya S',
	'IEC2014077'
);

insert into students values
(
	'IEC2014079',
	'Garg',
	'IEC2014079'
);

insert into students values
(
	'IEC2014031',
	'Pratap Singh',
	'IEC2014031'
);

insert into students values
(
	'IEC2014070',
	'Bhaskar',
	'IEC2014070'
);

insert into students values
(
	'IEC2014061',
	'Janaki Sree Rama Krishna',
	'IEC2014061'
);

insert into students values
(
	'IEC2014013',
	'Venkatesh',
	'IEC2014013'
);

insert into students values
(
	'IEC2014060',
	'Kumar Verma',
	'IEC2014060'
);

insert into students values
(
	'IEC2014059',
	'Kumar Meena',
	'IEC2014059'
);

insert into students values
(
	'IEC2014008',
	'Srivastava',
	'IEC2014008'
);

insert into students values
(
	'IEC2014003',
	'Aditya Maheshwari',
	'IEC2014003'
);

insert into students values
(
	'IEC2014009',
	'Trivedi',
	'IEC2014009'
);

insert into students values
(
	'IEC2014018',
	'Agarwal',
	'IEC2014018'
);

insert into students values
(
	'IEC2014032',
	'Arora',
	'IEC2014032'
);

insert into students values
(
	'IEC2014038',
	'Kumar',
	'IEC2014038'
);

insert into students values
(
	'IEC2014040',
	'Anish Reddy',
	'IEC2014040'
);

insert into students values
(
	'IEC2014046',
	'Meena',
	'IEC2014046'
);

insert into students values
(
	'IEC2014054',
	'Sai Nikith',
	'IEC2014054'
);

insert into students values
(
	'IEC2014058',
	'Meena',
	'IEC2014058'
);

insert into students values
(
	'IEC2014063',
	'Vineeth Kumar',
	'IEC2014063'
);

insert into students values
(
	'IEC2014064',
	'Singh Mundra',
	'IEC2014064'
);

insert into students values
(
	'IEC2014073',
	'Srivastava',
	'IEC2014073'
);

insert into students values
(
	'IEC2014076',
	'Verma',
	'IEC2014076'
);

insert into students values
(
	'IEC2014090',
	'Singh',
	'IEC2014090'
);

insert into students values
(
	'IEC2014085',
	'Ashish',
	'IEC2014085'
);

insert into students values
(
	'IEC2014086',
	'Mo. Safi Alam',
	'IEC2014086'
);

insert into students values
(
	'IEC2014087',
	'Ravi Shankar Mehta',
	'IEC2014087'
);

insert into students values
(
	'IEC2014088',
	'Parth Parakh',
	'IEC2014088'
);

insert into students values
(
	'IEC2014089',
	'Suraj Yadav',
	'IEC2014089'
);

insert into students values
(
	'IEC2014091',
	'Gupta',
	'IEC2014091'
);

insert into students values
(
	'IEC2014092',
	'Srivastava',
	'IEC2014092'
);

insert into students values
(
	'IEC2014093',
	'Laxmi',
	'IEC2014093'
);

insert into students values
(
	'IEC2014097',
	'Kshitij',
	'IEC2014097'
);

insert into students values
(
	'IEC2014096',
	'Mahendra Kumar',
	'IEC2014096'
);

insert into students values
(
	'IEC2014094',
	'Ram Narayan Mishra',
	'IEC2014094'
);

insert into students values
(
	'IEC2014098',
	'Kurnala Soundarya Abhinaya',
	'IEC2014098'
);

insert into students values
(
	'IEC2014501',
	'Namit Kumar Mishra',
	'IEC2014501'
);

insert into students values
(
	'IEC2014502',
	'Singh',
	'IEC2014502'
);

insert into students values
(
	'IEC2014503',
	'Ghosh',
	'IEC2014503'
);

insert into students values
(
	'IEC2015001',
	'Bikey Saha Rouniyar',
	'IEC2015001'
);

insert into students values
(
	'IEC2015002',
	'F Leander Paul',
	'IEC2015002'
);

insert into students values
(
	'IEC2015003',
	'Pranuj Barnawal',
	'IEC2015003'
);

insert into students values
(
	'IEC2015004',
	'Piyush Kumar Jayswal',
	'IEC2015004'
);

insert into students values
(
	'IEC2015005',
	'Navneet Kumar Patel',
	'IEC2015005'
);

insert into students values
(
	'IEC2015006',
	'Vinay Sahnan',
	'IEC2015006'
);

insert into students values
(
	'IEC2015007',
	'Aryan',
	'IEC2015007'
);

insert into students values
(
	'IEC2015008',
	'Shiv Pratap Singh',
	'IEC2015008'
);

insert into students values
(
	'IEC2015009',
	'Raghav Ranjan',
	'IEC2015009'
);

insert into students values
(
	'IEC2015010',
	'Rajkumar Gupta',
	'IEC2015010'
);

insert into students values
(
	'IEC2015011',
	'G.naga Nikhil',
	'IEC2015011'
);

insert into students values
(
	'IEC2015012',
	'K Mahender',
	'IEC2015012'
);

insert into students values
(
	'IEC2015013',
	'Dixit Rajeev Chintamani',
	'IEC2015013'
);

insert into students values
(
	'IEC2015014',
	'Vivek Arya',
	'IEC2015014'
);

insert into students values
(
	'IEC2015015',
	'Jainender Kumar',
	'IEC2015015'
);

insert into students values
(
	'IEC2015016',
	'Naveen Kewalramani',
	'IEC2015016'
);

insert into students values
(
	'IEC2015017',
	'Mohit Gupta',
	'IEC2015017'
);

insert into students values
(
	'IEC2015018',
	'Satyarth Agrahari',
	'IEC2015018'
);

insert into students values
(
	'IEC2015019',
	'Govind Singh',
	'IEC2015019'
);

insert into students values
(
	'IEC2015020',
	'Akash Tiwari',
	'IEC2015020'
);

insert into students values
(
	'IEC2015021',
	'Kiran Paswan',
	'IEC2015021'
);

insert into students values
(
	'IEC2015022',
	'Nippani Shanmukha Sudheendra',
	'IEC2015022'
);

insert into students values
(
	'IEC2015023',
	'Chittimoju Lakshmi Pavan Chandra Mouli',
	'IEC2015023'
);

insert into students values
(
	'IEC2015024',
	'Sushmita Gayen',
	'IEC2015024'
);

insert into students values
(
	'IEC2015025',
	'Ritwik Jain',
	'IEC2015025'
);

insert into students values
(
	'IEC2015026',
	'Somendra Agrawal',
	'IEC2015026'
);

insert into students values
(
	'IEC2015027',
	'Banoth Rajashaker',
	'IEC2015027'
);

insert into students values
(
	'IEC2015028',
	'Dudekula Naveen',
	'IEC2015028'
);

insert into students values
(
	'IEC2015029',
	'Sagar',
	'IEC2015029'
);

insert into students values
(
	'IEC2015030',
	'Shivanand Tripathi',
	'IEC2015030'
);

insert into students values
(
	'IEC2015031',
	'Abhishek Roy',
	'IEC2015031'
);

insert into students values
(
	'IEC2015032',
	'Bharti Saini',
	'IEC2015032'
);

insert into students values
(
	'IEC2015033',
	'Akhilesh Soni',
	'IEC2015033'
);

insert into students values
(
	'IEC2015034',
	'Asmit Gupta',
	'IEC2015034'
);

insert into students values
(
	'IEC2015035',
	'Lingampalli Roopesh Krishna',
	'IEC2015035'
);

insert into students values
(
	'IEC2015036',
	'Aayush Khatri',
	'IEC2015036'
);

insert into students values
(
	'IEC2015037',
	'Shubham Bagadi',
	'IEC2015037'
);

insert into students values
(
	'IEC2015038',
	'Ayushi Nirmal',
	'IEC2015038'
);

insert into students values
(
	'IEC2015039',
	'Patil Sairaj Sahebrao',
	'IEC2015039'
);

insert into students values
(
	'IEC2015040',
	'Vaishnavi Rani',
	'IEC2015040'
);

insert into students values
(
	'IEC2015041',
	'Kunal Mittal',
	'IEC2015041'
);

insert into students values
(
	'IEC2015042',
	'Sharad Kumar',
	'IEC2015042'
);

insert into students values
(
	'IEC2015043',
	'Akriti Gupta',
	'IEC2015043'
);

insert into students values
(
	'IEC2015044',
	'Varun Kumar Singh',
	'IEC2015044'
);

insert into students values
(
	'IEC2015045',
	'Shikhar Chitransh',
	'IEC2015045'
);

insert into students values
(
	'IEC2015046',
	'Dhiraj Kumar Dwivedi',
	'IEC2015046'
);

insert into students values
(
	'IEC2015047',
	'Vikas Shukla',
	'IEC2015047'
);

insert into students values
(
	'IEC2015048',
	'Neha Kandpal',
	'IEC2015048'
);

insert into students values
(
	'IEC2015049',
	'Kollalsi Rohith',
	'IEC2015049'
);

insert into students values
(
	'IEC2015050',
	'Sonal Gupta',
	'IEC2015050'
);

insert into students values
(
	'IEC2015051',
	'Sameer Namdeo',
	'IEC2015051'
);

insert into students values
(
	'IEC2015052',
	'Annam Phanindra',
	'IEC2015052'
);

insert into students values
(
	'IEC2015053',
	'Shubham Pal',
	'IEC2015053'
);

insert into students values
(
	'IEC2015054',
	'Sandeep Kumar',
	'IEC2015054'
);

insert into students values
(
	'IEC2015055',
	'Alladi Vineeth',
	'IEC2015055'
);

insert into students values
(
	'IEC2015056',
	'Shivam Garg',
	'IEC2015056'
);

insert into students values
(
	'IEC2015057',
	'Ravi Prakash',
	'IEC2015057'
);

insert into students values
(
	'IEC2015058',
	'Banoth Suresh',
	'IEC2015058'
);

insert into students values
(
	'IEC2015059',
	'Vivek Tiwari',
	'IEC2015059'
);

insert into students values
(
	'IEC2015060',
	'Mukuljeet Singh Mehrolia',
	'IEC2015060'
);

insert into students values
(
	'IEC2015061',
	'Anmol Chawla',
	'IEC2015061'
);

insert into students values
(
	'IEC2015062',
	'Nitish Verma',
	'IEC2015062'
);

insert into students values
(
	'IEC2015063',
	'Harmanpreet Sarangal',
	'IEC2015063'
);

insert into students values
(
	'IEC2015064',
	'Ragu Chaitanya',
	'IEC2015064'
);

insert into students values
(
	'IEC2015065',
	'Munaga Sesha Sai',
	'IEC2015065'
);

insert into students values
(
	'IEC2015066',
	'Kodigudla Naveen Manikanta',
	'IEC2015066'
);

insert into students values
(
	'IEC2015067',
	'Atul Kumar Maurya',
	'IEC2015067'
);

insert into students values
(
	'IEC2015068',
	'Bujala Bhanu Prakash Reddy',
	'IEC2015068'
);

insert into students values
(
	'IEC2015069',
	'Piyush Raj Meena',
	'IEC2015069'
);

insert into students values
(
	'IEC2015070',
	'Ashwin Siddharth Tagde',
	'IEC2015070'
);

insert into students values
(
	'IEC2015071',
	'Gaurav Pandey',
	'IEC2015071'
);

insert into students values
(
	'IEC2015072',
	'Ch Sowmya',
	'IEC2015072'
);

insert into students values
(
	'IEC2015073',
	'Papisetty Rohith',
	'IEC2015073'
);

insert into students values
(
	'IEC2015074',
	'Amarjeet',
	'IEC2015074'
);

insert into students values
(
	'IEC2015075',
	'Daivik Mishra',
	'IEC2015075'
);

insert into students values
(
	'IEC2015076',
	'Subham Choudhury',
	'IEC2015076'
);

insert into students values
(
	'IEC2015077',
	'Podili Sai Phani Krishna',
	'IEC2015077'
);

insert into students values
(
	'IEC2015078',
	'Shivam Singh',
	'IEC2015078'
);

insert into students values
(
	'IEC2015079',
	'Papasani Sunilkumar Reddy',
	'IEC2015079'
);

insert into students values
(
	'IEC2015080',
	'Akshay Kumar',
	'IEC2015080'
);

insert into students values
(
	'IEC2015081',
	'Rachit Parashar',
	'IEC2015081'
);

insert into students values
(
	'IEC2015082',
	'Shashikant Verma',
	'IEC2015082'
);

insert into students values
(
	'IEC2015083',
	'Dilip Kumar',
	'IEC2015083'
);

insert into students values
(
	'IEC2015084',
	'Arunav Bhatnagar',
	'IEC2015084'
);

insert into students values
(
	'IEC2015085',
	'Pawan Kumar',
	'IEC2015085'
);

insert into students values
(
	'IEC2015086',
	'Neha Oraon',
	'IEC2015086'
);

insert into students values
(
	'IEC2015087',
	'Varun Meka',
	'IEC2015087'
);

insert into students values
(
	'IEC2015088',
	'Noor U Din Baba',
	'IEC2015088'
);

insert into students values
(
	'IEC2015089',
	'Abhishek Singh',
	'IEC2015089'
);

insert into students values
(
	'IEC2011063',
	'Shailendra Sharma',
	'IEC2011063'
);

insert into students values
(
	'IEC2016001',
	'Hiral Agarwal',
	'IEC2016001'
);

insert into students values
(
	'IEC2016002',
	'Siddhant Shrivastava',
	'IEC2016002'
);

insert into students values
(
	'IEC2016003',
	'Mohammad Haris',
	'IEC2016003'
);

insert into students values
(
	'IEC2016004',
	'Niyas Ayyaril Abbas',
	'IEC2016004'
);

insert into students values
(
	'IEC2016005',
	'Komal Goenka',
	'IEC2016005'
);

insert into students values
(
	'IEC2016006',
	'Nakul Srivastava',
	'IEC2016006'
);

insert into students values
(
	'IEC2016007',
	'Rishi Jaishankar Shukla',
	'IEC2016007'
);

insert into students values
(
	'IEC2016008',
	'Himanshu Singh',
	'IEC2016008'
);

insert into students values
(
	'IEC2016009',
	'Pavan Kumar Ramadugu',
	'IEC2016009'
);

insert into students values
(
	'IEC2016010',
	'Prachi Shankar',
	'IEC2016010'
);

insert into students values
(
	'IEC2016011',
	'Shubham Varshney',
	'IEC2016011'
);

insert into students values
(
	'IEC2016012',
	'Nikhil Mundra',
	'IEC2016012'
);

insert into students values
(
	'IEC2016013',
	'Apoorv Mahajan',
	'IEC2016013'
);

insert into students values
(
	'IEC2016014',
	'Gauri Kesarwani',
	'IEC2016014'
);

insert into students values
(
	'IEC2016015',
	'Yalakuchi Sandeep Kumar',
	'IEC2016015'
);

insert into students values
(
	'IEC2016016',
	'Pavan Kumar Reddy Chavva',
	'IEC2016016'
);

insert into students values
(
	'IEC2016017',
	'Utkarsh Kumar Chaurasia',
	'IEC2016017'
);

insert into students values
(
	'IEC2016018',
	'Ankit Patel',
	'IEC2016018'
);

insert into students values
(
	'IEC2016019',
	'Neelesh Kumar',
	'IEC2016019'
);

insert into students values
(
	'IEC2016020',
	'Bhukya Santhosh',
	'IEC2016020'
);

insert into students values
(
	'IEC2016021',
	'Prafull Singh Patel',
	'IEC2016021'
);

insert into students values
(
	'IEC2016022',
	'Dharavath Shekar',
	'IEC2016022'
);

insert into students values
(
	'IEC2016023',
	'Bhuvanesh Gouda',
	'IEC2016023'
);

insert into students values
(
	'IEC2016024',
	'Anant Chaturvedi',
	'IEC2016024'
);

insert into students values
(
	'IEC2016025',
	'Shravya Pandey',
	'IEC2016025'
);

insert into students values
(
	'IEC2016026',
	'Agam Dwivedi',
	'IEC2016026'
);

insert into students values
(
	'IEC2016027',
	'Bhanu Bhandari',
	'IEC2016027'
);

insert into students values
(
	'IEC2016028',
	'Pratyush Raj',
	'IEC2016028'
);

insert into students values
(
	'IEC2016029',
	'Guranshi Nili',
	'IEC2016029'
);

insert into students values
(
	'IEC2016030',
	'Kamal Nayan Chaubey',
	'IEC2016030'
);

insert into students values
(
	'IEC2016031',
	'Shreyansh Dwivedi',
	'IEC2016031'
);

insert into students values
(
	'IEC2016032',
	'Sukhavasi Meghana',
	'IEC2016032'
);

insert into students values
(
	'IEC2016033',
	'Akshay Kumar',
	'IEC2016033'
);

insert into students values
(
	'IEC2016034',
	'Sumit Diwakar',
	'IEC2016034'
);

insert into students values
(
	'IEC2016035',
	'Vejendla Sunil Chowdary',
	'IEC2016035'
);

insert into students values
(
	'IEC2016036',
	'Vintha Naga Sai Krishna Reddy',
	'IEC2016036'
);

insert into students values
(
	'IEC2016037',
	'Suman Kumar',
	'IEC2016037'
);

insert into students values
(
	'IEC2016038',
	'Kuldeep Gautam',
	'IEC2016038'
);

insert into students values
(
	'IEC2016039',
	'Ayush Gupta',
	'IEC2016039'
);

insert into students values
(
	'IEC2016040',
	'Ajay Kumar Podishetty',
	'IEC2016040'
);

insert into students values
(
	'IEC2016041',
	'Gudimalla Sharan Kumar',
	'IEC2016041'
);

insert into students values
(
	'IEC2016042',
	'Shreyansh Mishra',
	'IEC2016042'
);

insert into students values
(
	'IEC2016043',
	'Rajendar Bhukya',
	'IEC2016043'
);

insert into students values
(
	'IEC2016044',
	'Niharika Shrivastava',
	'IEC2016044'
);

insert into students values
(
	'IEC2016045',
	'Navyasri Alapati',
	'IEC2016045'
);

insert into students values
(
	'IEC2016046',
	'Upasna Na',
	'IEC2016046'
);

insert into students values
(
	'IEC2016047',
	'Aman Saraf',
	'IEC2016047'
);

insert into students values
(
	'IEC2016048',
	'Sathyam Tripathi',
	'IEC2016048'
);

insert into students values
(
	'IEC2016049',
	'Avula Mourya Vamsinath',
	'IEC2016049'
);

insert into students values
(
	'IEC2016050',
	'Durgam Satyanarayana',
	'IEC2016050'
);

insert into students values
(
	'IEC2016051',
	'Narava Srinivas Dhanunjay',
	'IEC2016051'
);

insert into students values
(
	'IEC2016052',
	'Aanandita Dhawan',
	'IEC2016052'
);

insert into students values
(
	'IEC2016053',
	'Uma Maheswari',
	'IEC2016053'
);

insert into students values
(
	'IEC2016054',
	'Noonety Jayanth',
	'IEC2016054'
);

insert into students values
(
	'IEC2016055',
	'Lovish Goel',
	'IEC2016055'
);

insert into students values
(
	'IEC2016056',
	'Shubhi Khandelwal',
	'IEC2016056'
);

insert into students values
(
	'IEC2016057',
	'Aditya Anand',
	'IEC2016057'
);

insert into students values
(
	'IEC2016058',
	'Atul Kumar',
	'IEC2016058'
);

insert into students values
(
	'IEC2016059',
	'Saurabh Kumar',
	'IEC2016059'
);

insert into students values
(
	'IEC2016060',
	'Nairit Banerjee',
	'IEC2016060'
);

insert into students values
(
	'IEC2016061',
	'Sagar Singh Jadon',
	'IEC2016061'
);

insert into students values
(
	'IEC2016062',
	'Jaya Krishna Ganapavarapu',
	'IEC2016062'
);

insert into students values
(
	'IEC2016063',
	'Manvendra Dattatrey',
	'IEC2016063'
);

insert into students values
(
	'IEC2016064',
	'Anshu Kumari',
	'IEC2016064'
);

insert into students values
(
	'IEC2016065',
	'Harshit Srivastava',
	'IEC2016065'
);

insert into students values
(
	'IEC2016066',
	'Vinit Dilip Mankar',
	'IEC2016066'
);

insert into students values
(
	'IEC2016067',
	'Praveen Kumar Mudadla',
	'IEC2016067'
);

insert into students values
(
	'IEC2016068',
	'Suras Kumar Nayak',
	'IEC2016068'
);

insert into students values
(
	'IEC2016069',
	'Manideep Pendem',
	'IEC2016069'
);

insert into students values
(
	'IEC2016070',
	'Sanam Sanam',
	'IEC2016070'
);

insert into students values
(
	'IEC2016071',
	'A Akhil Reddy',
	'IEC2016071'
);

insert into students values
(
	'IEC2016072',
	'Ruchin Agrawal',
	'IEC2016072'
);

insert into students values
(
	'IEC2016073',
	'Prabhat Ranjan',
	'IEC2016073'
);

insert into students values
(
	'IEC2016074',
	'Mohammad Aquib',
	'IEC2016074'
);

insert into students values
(
	'IEC2016075',
	'Shailendra Kumar',
	'IEC2016075'
);

insert into students values
(
	'IEC2016076',
	'Siddhant Srivastav',
	'IEC2016076'
);

insert into students values
(
	'IEC2016077',
	'Vinit Roy',
	'IEC2016077'
);

insert into students values
(
	'IEC2016078',
	'Palle Suhas Reddy',
	'IEC2016078'
);

insert into students values
(
	'IEC2016079',
	'Kasna Jarupula',
	'IEC2016079'
);

insert into students values
(
	'IEC2016080',
	'Mahendra Pitta',
	'IEC2016080'
);

insert into students values
(
	'IEC2016081',
	'H N Arvind',
	'IEC2016081'
);

insert into students values
(
	'IEC2016082',
	'Rohit Kumar Meena',
	'IEC2016082'
);


insert into guides values
(
	guides_id_seq.nextval,	-- 1
	'Dr. Ayon Ganguly',
	'guide_1',
	'guide_1',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 2
	'Dr. Ashutosh Mishra',
	'guide_2',
	'guide_2',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 3
	'Dr. Amrita Chaturvedi',
	'guide_3',
	'guide_3',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 4
	'Dr. Anupam',
	'guide_4',
	'guide_4',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 5
	'Dr. Akhilesh Tiwari',
	'guide_5',
	'guide_5',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 6
	'Dr. Bibhas Ghoshal',
	'guide_6',
	'guide_6',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 7
	'Prof. G. C. Nandi',
	'guide_7',
	'guide_7',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 8
	'Dr. Jagpreet Singh',
	'guide_8',
	'guide_8',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 9
	'Prof. K. Misra',
	'guide_9',
	'guide_9',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 10
	'Dr. K. P. Singh',
	'guide_10',
	'guide_10',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 11
	'Dr. Madhavendra Misra',
	'guide_11',
	'guide_11',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 12
	'Dr. Manish Kumar',
	'guide_12',
	'guide_12',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 13
	'Dr. Neetesh Purohit',
	'guide_13',
	'guide_13',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 14
	'Prof. O. P. Vyas',
	'guide_14',
	'guide_14',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 15
	'Dr. Pavan Chakraborty',
	'guide_15',
	'guide_15',
	'N'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 16
	'Dr. Pragya Singh',
	'guide_16',
	'guide_16',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 17
	'Dr. Rekha Verma',
	'guide_17',
	'guide_17',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 18
	'Dr. Ranjana Vyas',
	'guide_18',
	'guide_18',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 19
	'Mr. Rishi Ranjan Singh',
	'guide_19',
	'guide_19',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 20
	'Dr. Rahul Kala',
	'guide_20',
	'guide_20',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 21
	'Dr. Ratna Sanyal',
	'guide_21',
	'guide_21',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 22
	'Dr. Sanjeev B. S.',
	'guide_22',
	'guide_22',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 23
	'Dr. Shailendra Kumar',
	'guide_23',
	'guide_23',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 24
	'Dr. Shirshu Varma',
	'guide_24',
	'guide_24',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 25
	'Dr. Sonali Agarwal',
	'guide_25',
	'guide_25',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 26
	'Prof. Sudip Sanyal',
	'guide_26',
	'guide_26',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 27
	'Dr. Sanjai Singh',
	'guide_27',
	'guide_27',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 28
	'Prof. U. S. Tiwary',
	'guide_28',
	'guide_28',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 29
	'Dr. Venkatesan S.',
	'guide_29',
	'guide_29',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 30
	'Dr. Vijay K. Chaurasiya',
	'guide_30',
	'guide_30',
	'Y'
);

insert into guides values
(
	guides_id_seq.nextval,	-- 31
	'Dr. Vrijendra Singh',
	'guide_31',
	'guide_31',
	'Y'
);


insert into projects values
(
	projects_id_seq.nextval,		-- 1
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Real Estate Search Based On Data Mining',
	'18',
	'This project helps the users to make good decisions regarding buying or selling of valuable property. Prior to this online system this process involved a lot of travelling costs and searching time. Due to this system the user now does not have to travel much and can look for the property it is searching for, online according to its requirements. This system includes property details like Address, space measurement(sq ft), number of BHKs, Floor, Property Seller name and its contact number plus email-id. The user can search property depending on the area that it wants in, number of wash rooms, bedrooms, halls and kitchen. The system contains an algorithm that calculates loan that the user can take plus 20%-30% cash that the user has to pay. This system allows the admin to enter details about any property that it is wishing for. The admin can even delete the property details. Thus this system eliminates cost to a great extent and also redu',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 2
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'TV Remote Controlled Home Automation PIC',
	'19',
	'TV remote controlled home appliances project is designed to operate electrical loads using TV remote. The remote transmits infrared coded data which is received by<br>the sensor interfaced in the control unit. The system operates the electrical loads on the command transmitted from the TV remote. RC5 based coded data is sent for<br> the TV remote is received by an IR receiver interfaces to the PIC microcontroller. The program on the microcontroller refers the RC5 code to generate respective<br>output based on the input data to operate a set of relays through a relay driver IC. The main aim of this system is to use it in existing domestic area for operating<br> the loads through the conventional switches or the TV remote. This system can be enhanced by using radio frequency technology where the operational range will be independent of line of sight distance with IR type of remote control.<br>This system resolves the problem by combining ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 3
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Collective Face Detection Project',
	'27',
	'This collective face detection project is capable of detecting faces by their names and identifying multiple faces in real time. The software system uses face detection algorithms to accurately identify and recognize a faces in real time. We use a pc webcam to record real time video data and the system automatically detects and identifies faces in real time application. The collective face detection application is designed using C# and works as follows:<p>Application captures video data in real time.</p><ul><li>The user may bring his face in front of the camera and the system allows the user to get a snapshot of his face and enter his/her name.</li><li>The system records this data and maintains it in its system.</li><li>Similarly multiple users may record their data in the system.</li><li>Now when the next time this system is activated it starts capturing real time video data again.</li><li>As a previously registered user appears in the',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 4
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Hand Motion Controlled Robotic Vehicle',
	'20',
	'This system is very beneficial for disabled people as it allows movement of a robotic vehicle on the basis of hand movements. The person just has to move his hand in order to move the vehicle in forward, backward, left or right direction. So the user does not have to press any buttons. The system includes a receiver circuit designed which will be mounted on a top of a glove which the user has to wear. The circuit on the vehicle includes RF receiver, 8051 microcontroller and Driver IC to operate the motors. The receiver circuit that is on the top of a glove includes atmega family microcontroller interfaced to the accelerometer. The commands that are detected by the IC on this circuit are sent to the RF transmitter which then forwards the commands to the RF receiver. The RF receiver then sends the commands to 8051 microcontroller which processes the commands so that the vehicle moves in the specified direction.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 5
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Smart Health Consulting Project',
	'17',
	'This system aims at maintaining patient health records and even getting appointments from various doctors for related treatments. The system user must register as a member of this system and keep updating his medical history. Patients can then select from a list of specialized doctors for respective treatments such as (skin specialist, ENT specialist cardiologist etc) at particular locations. Patients may also select suitable appointment timings for their meeting.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 6
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Student Examination Datacard',
	'15',
	'<strong>Project Description</strong>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 7
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Coin Based Water Dispenser System',
	'28',
	'Here we put forward a fully automated coin based water dispenser system using microcontroller and sensor. The system is capable of fully automated water/cola dispensing using motors and sensors. The system also senses if glass is placed at the counter to avoid water spoilage if there is no glass placed at the counter panel. The system uses IR sensors to detect presence of glass and then the sensors send a signal to the microcontroller. The microcontroller now processes the information sent by the sensors to determine if glass is present. The system also has a coin detector that is used to sense particular coins and send information to microcontroller about valid coins. On detecting a valid coin the system now sends a signal to the controller who checks if glass is present and then it starts the motor to pour water in glass using motor as long the glass is present. If glass is removed during the process, system stops the water supply unt',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 8
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Liquid Level Controller System Using Ultrasonic Sensor',
	'16',
	'Liquid Level Controller System Without Contact project mainly aims to detect the level of liquid using ultrasonic module. This ultrasonic sensor measure the level of liquid in centimeter by detecting the reflection coming ahead of it. The first pump automatically starts filling the container with water as soon as the level falls below a set point. If the water level goes below the set level the other motor starts pumping out the water from the container. Thus by switching between these motors, the system maintains the water level in the container. The system makes use of PIC microcontroller interfaced with this ultrasonic module. The Tx sensor sends the ultrasonic signal reflected from the level and is received by the ultrasonic Rx sensor. These signals are then sent to microcontroller that initiates the relay to switch the pumps on or off.  The user may check the current liquid level by setting system to normal mode. Then user may swit',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 9
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Machine Overheat Detection With Alert',
	'24',
	'This proposed system is used to detect temperature of devices that are overheated. This project is very beneficial especially in places like factories or industries consisting of big machines where it is very necessary to take some action in case the machine is overheated. The system uses a digital temperature sensor in order to detect temperature and pass on the data to the microcontroller. The 8051 microcontroller processes data and sends the temperature to be displayed on LCD screen. The display consists of 7 segment display unit to display up to 3 numbers. It consists of 4 push buttons for setting the high and low temperatures. Pressing set button allows user to increment and decrement the temperature of the system. The system uses 12V transformer to supply power to the system. We can set a limit to the temperature and in case if the system exceeds the temperature limit, an alarm rings to indicate that the system has exceeded the se',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 10
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Military Access Using Card Scanning With OTP',
	'16',
	'Military access is the most secure access provision and needs to be kept that way considering national security issues. Usual military authentication and authorization techniques consist of one way authentication techniques with just one form of authentication, namely password or smart card or biometric. Here we propose a two stage authentication/authorization technique for secured military access to authorized personnel. The first stage is a card scanning system, each authorized personnel must have a smart card. On card scanning the system also asks of an additional 4 digit code associated with it, on entering the right code the personnel goes to the next stage of authentication. On the next stage, system generates a one time password and sends to the mobile phone registered to that particular card scanned. The personnel now needs to entered the password sent on his mobile phone for the next stage of authentication. After he enters rig',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 11
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Android Local Train Ticketing Project',
	'18',
	'A local train ticketing system project for local trains that allows users to book local train tickets and get ticket receipt online. This local train project provides login rights for normal users and admin. A normal user may login and get a ticket online, print it and travel by train. The ticketing process consists of a ticket booking form. The form allows the user to choose his source and destination. The source is the station from where the user will be boarding the train. Destination is the station he needs to get down at. The project database is already filled with stations on Mumbai western central and harbor line. It can be modified for any other city as needed. The system also consists of an option to select weather ticket is a single journey or a return ticket and the journey will be commenced on first class or a second class. It also consists of an admin account. The admin may recharge user account balance and check for variou',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 12
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Anti Drowning System With Remote Alert',
	'17',
	'This system is very helpful for saving the life of a person drowning in the water. This is done by informing the heartbeat rate of any person in the water to the lifeguard. Our system will monitor the heart rate. It will then transmit using RF, its range would be around 5-6 meters, if under water around 2-4 meters. For this the system includes transmitting and receiver circuit. The receiver circuit is with the lifeguard to inform about the person’s heart beat rate, while the transmitting circuit is with the person in the water. The transmitter circuit uses AVR family microcontroller interfaced to LCD screen. This LCD screen is used to display the heart beat level to the lifeguard. This transmitter circuit is powered by 12V battery. Similarly the receiver circuit also includes AVR family microcontroller and RF receiver which are attached to 12V transformer. The system also includes heart beat rate sensor. This heart beat rate sensor can ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 13
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Web Server to Client communication for web usage data analysis',
	'18',
	'We usually come across fields where web data proves very important for business as well as security analysis. Ecommerce as well as website usage data is of prime importance these days. Our proposed project puts for ward a system that allows a web server to record web data analytics of web usage patterns of various web links. The system is configured to record web page clicks, seo score computed as per a search engine ranking algorithm as well as other parameters associated with the each web page. The server has an inbuilt configuration logic required to scan live web pages similar to crawlers and then record/store that data for later processing. Since the data may be large and huge computational strength is required to store process this data. This computation may lead to overburdening on the server thus hindering its further indexing performance. Thus we propose a client application that communicates with web server to receive this dat',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 14
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Android Based School Bus Tracking System',
	'16',
	'This system is a combination of web as well as android application where the driver will be using the android application whereas admin and parent will be using web application. This application is meant for drivers who is driving the school bus. System allows admin to add a new driver where driver id and password is generated and stored into the system. The driver will have the android application installed in his android phone, when the driver will login to the application, his GPS location will be sent and stored into database. As soon as driver logs in, GPS location of the driver will be tracked automatically by the application and stores the GPS co-ordinates into database after every 5 minutes. When driver logs out from the application, again GPS location will be stored. In order to keep track the attendance of the driver, this system plays a major role. The role of the admin is to register a new student by entering his personal de',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 15
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Bus Pass with webcam Scan',
	'24',
	'The project aims to provide an effective solution of maintaining bus pass information using a Qr code. The system has two logins one for user and other for admin. User can refill their account and extend the validity every time the pass expires. Admin can view all users'' details and balance through its login. Every user pass will be having a Qr code that contains user information and validity of pass. Thus while travelling users just have to get their pass scanned and conductor can view the pass validity.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 16
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Online Printed T-Shirt Designing',
	'29',
	'Online Printed T-Shirt Designing will have registration for new Users and login for Members. This software will have Admin Login which will check for new request and orders, Member Login in which they can create customize design using wide range of Colors and Design, and can even place bulk order for the same. The system first allows users to select tshirt design. After that user may choose desired color. The net step allows users to choose designs and text to be printed on the tshirt. After user finalizes the cost of design is calculated and user may pay online for it. This Ordered T-Shirt will be delivered to their door steps. The Admin Login will accept request to check design, approve Order, and create bill.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 17
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Automated College Timetable Generator',
	'25',
	'Most colleges have a number of different courses and each course has a number of subjects. Now there are limited faculties, each faculty teaching more than one subjects. So now the time table needed to schedule the faculty at provided time slots in such a way that their timings do not overlap and the time table schedule makes best use of all faculty subject demands. We use a genetic algorithm for this purpose. In our Timetable Generation algorithm we propose to utilize a timetable object. This object comprises of Classroom objects and the timetable for every them likewise a fitness score for the timetable. Fitness score relates to the quantity of crashes the timetable has regarding alternate calendars for different classes.<br>Classroom object comprises of week objects. Week objects comprise of Days. also Days comprises of Timeslots. Timeslot has an address in which a subject, student gathering going to the address and educator showing ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 18
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Dynamic Signal Light Timings On Traffic Density',
	'19',
	'The project aims to provide an effective solution for controlling traffic signals according to the density of traffic at junction. Higher density traffic requires longer green signal than the one with low density hence the system serves this purpose.<br>The project uses a microcontroller of PIC16F8 series that is interfaced with the IR sensors and photodiodes aligned in line of sight configuration across the load for detecting the density that changes the junction timings. The density is measured in three ways low, medium and high according to which the timings are allotted for signals<br>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 19
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'DC Motor Speed Control By Android',
	'19',
	'This system DC motor Controller by Android is developed to control the speed of the DC motor in both clockwise and anticlockwise direction. For this DC motor is interfaced to the 8051 microcontroller. A Bluetooth modem is used to receive direction commands and PWM commands. When an Android device sends commands, it is received by the Bluetooth modem which then sends the commands to the microcontroller. The microcontroller the controls the DC motor through motor driver. The entire system is powered by 12V transformer. LCD display is used to show the status and the speed of the DC motor. The android application is used to control the entire system. The start button is first clicked to start the motor and then the motor can run in both clockwise and anticlockwise direction. Simultaneously the status of the system is displayed on the LCD screen and also the speed of the DC motor is displayed on the screen. Thus the speed of the motor can be',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 20
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Android Graphical Image Password Project',
	'22',
	'Picture Patten Locking System allows the user to set a Custom Picture may be from the gallery or click it instantly and set it as a Password. The Picture is then Divided into 9 parts and represented as a 3X3 Patten of Cubes for Authentication in any order i.e. they are scrambled. The User has to select all the Nine Cubes as per the Original Picture Row Wise similar to solving a puzzle. The Pictures are Stored in the Phones Device Memory with the Folder Named User’s Full Name Underscore User Id (username_userid). In this app if the user credentials are correct a Custom Calculator is opened, while you can use any app.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 21
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Remote Controlled Pick and Place Robotic Vehicle',
	'22',
	'This system is very beneficial for places where there is a need to pick an object move it and place it to some other place safely. If the object is being picked by a human, there is a risk of damage to the object which is avoided by this system. The system provides a robotic arm that is controlled by RF remote. This system also includes a vehicle so that the robotic vehicle can be moved to pick and place object with the help of robotic arm. The system uses 8051 microcontroller that is interfaced to the RF receiver. This RF receiver receives commands that are sent by the RF remote. As soon as the user presses the push buttons, the commands are sent to the RF remote, which makes the arm move in the specified up or down direction or grip open or close. Thus this Remote Controlled Pick and Place Robotic Arm Vehicle project can be used to safely pick up an object, move it and place it anywhere you want. The receiver circuit uses the 4 motors',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 22
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Secure Electronic Fund Transfer Over Internet Using DES',
	'26',
	'Nowadays people often need to transfer cash from one account to another. In such cases they need to go to bank or search for PC connected to internet to get access to the services offered by internet banking for reliable fund transfer. This system proves to be really beneficial in such cases. As with the help of this system the user just needs to enter the account details. For security, DES algorithm is used along with instant verification and consistency check algorithm. All these are performed for secure electronic fund transfer. Thus a user just needs to visit any EFT center, in order to make the payment. The transfer is done instantly using a single portable card. In this way the user can make the payment securely as this system uses DES for security and the transfer is being done instantly. As soon as the user card is scanned, it receives a SMS message.  SMS consists of OTP which is unique. All the user needs to do is enter this OT',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 23
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Heart Disease Prediction Project',
	'22',
	'It might have happened so many times that you or someone yours need doctors help immediately, but they are not available due to some reason. The Heart Disease Prediction application is an end user support and online consultation project. Here, we propose a web application that allows users to get instant guidance on their heart disease through an intelligent system online. The application is fed with various details and the heart disease associated with those details. The application allows user to share their heart related issues. It then processes user specific details to check for various illness that could be associated with it. Here we use some intelligent data mining techniques to guess the most accurate illness that could be associated with patient’s details. Based on result, the can contact doctor accordingly for further treatment. The system allows user to view doctor’s details too. The system can be used for free heart disease',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 24
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Patient Health Check Using Wireless Health Monitor',
	'27',
	'The proposed project is a wireless communication system that keeps a track of remote patient’s body temperature and displays it to doctor by using RF communication.<br>Usually a doctor or an attendant has to regularly keep a check for the patient’s temperature thus, this task becomes tedious after sometime.<br>Hence, the system is used to read remote patients temperature using a digital temperature sensor and sends it to microcontroller.<br>The microcontroller encodes the readings thus received, displays it on LCD and sends it to receiver by RF over the air using an RF module.<br>The receiver decodes the data and sends it to another microcontroller that displays it on LCD screen.<br>Hence, the doctor can continuously keep a check on the patients reading displayed on the LCD through receiver wirelessly.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 25
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Student Attendance System By Qr Scan',
	'21',
	'A system that takes down students attendance using Qr code. Every student is provided with a card containing a unique Qr code. Students just have to scan their cards in front of webcam and the system notes down their attendance as per dates. Each Qr code contains a unique id for students. System then stores all the students'' attendance records and generates defaulter list. It also generates an overall report in excel sheet for admin.  Such type of application is very useful in school as well as in college for daily attendance.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 26
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Agricultural Robot Project',
	'27',
	'Well agriculture has always been the backbone of India for a long time. The project we put forth has been designed to automate the work of a farmer so that he can tirelessly perform his farming tasks. We intend to automate the most common and frequent tasks of the farmer.<br>Our project focuses on remote controlling and slight automating the tractor with sensors so as to get daily farming tasks done with ease. Here we try to automate some farming tasks such as remote controlled tractor and water spraying.<br>The farmer will be provided with a wireless remote control using which he may start or turn off tractor robot and control its movement. Moreover the robot is also embedded with obstacle sensors using which it can detect oncoming obstacles such as cattle, children, big trees, rocks etc. Also it is fitted with a sprayer and water tank so farmer does not need to manually spray water over fields. The robotic vehicle automatically sprays',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 27
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Workload and Resource Consumption Analysis For Online Travel and Booking Site',
	'20',
	'Online Travel and ticket booking is one of the fastest growing sales channels. It helps the consumers to book flights, hotels, holiday packages, insurance and other services online. There are number of online travel and ticket booking websites which are considered to be one of the top E-Commerce industries. As this type of E-Commerce websites present more services online such as booking flights, hotels, tickets, restaurants and other vocational packages. This type of websites are developed on a wide range of technologies to support them like Javascript , AJAX, XML, B2B Web services, Caching, Search Algorithms and Affiliation resulting in a very rich and heterogeneous workload. User visit travel sites depending on time, season, and promotions or during events. As number of users increase on any travel site this will increase traffic which will in turn increase load in server and will reduce response time so the website will fail to provi',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 28
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Graphical Password To Avoid Shoulder Surfing',
	'15',
	'Since conventional password schemes are vulnerable to shoulder surfing, many shoulder surfing resistant graphical password schemes have been proposed. However, as most users are more familiar with textual passwords than pure graphical passwords, text-based graphical password schemes have been proposed. Unfortunately, none of existing text-based shoulder surfing resistant graphical password schemes is both secure and efficient enough. In this paper, we propose an improved text-based shoulder surfing resistant graphical password scheme by using colours.<br>In the proposed scheme, the user can easily and efficiently login system. Next, we analyze the security and usability of the proposed scheme, and show the resistance of the proposed scheme to shoulder surfing and accidental login. The shoulder surfing attack in an attack that can be performed by the adversary to obtain the user’s password by watching over the user’s shoulder as he enter',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 29
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Wireless Patient Health Monitoring',
	'24',
	'The proposed project is a wireless communication system that keeps a track of remote patient’s body temperature and displays it to doctor by using RF communication.<br>Usually a doctor or an attendant has to regularly keep a check for the patient’s temperature thus, this task becomes tedious after sometime.<br>Hence, the system is used to read remote patients temperature using a digital temperature sensor and sends it to microcontroller.<br>The microcontroller encodes the readings thus received, displays it on LCD and sends it to receiver by RF over the air using an RF module.<br>The receiver decodes the data and sends it to another microcontroller that displays it on LCD screen.<br>Hence, the doctor can continuously keep a check on the patients reading displayed on the LCD through receiver wirelessly.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 30
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Geo Trends Classification Over Maps Android',
	'15',
	'The developed application is android based application from which multiple users can talk or comment about the latest trends. The application allows user to talk about ongoing latest trends from irrespective of user’s location. The application has the GPS (Global Positioning System) access to tag the GPS location of user while commenting or posting about the trend on an application. The system receives these GPS coordinates and allows the admin to check the coordinates of the user through a web application. The user may comment about various trends and can specify a special keyword using hash (#) tag. For ex. #Diwali. There is a web application developed for admin where admin will get to know about the latest trend going on around the world. The system allows admin to specify a keyword which is then stored into database. Admin can also search using specified/multiple keywords from which various results will be fetched. The result contai',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 31
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Fingerprint Based Bank Locker System',
	'22',
	'The fingerprint based bank locker system is an enhancement to the traditional bank locker system that uses keys.<br>Now keys can easily be copied and made by theif’s who know about it. Also the keys must be taken care of and can also be lost due to some negligence.<br>Well fingerprint based bank locker system is here to solve all these issues.<br>The fingerprinted authenticated bank locker system is safe as well as easy to use and maintain.<br>No key handling no need to worry about key getting lost. The system uses fingerprint sensing to read fingerprints and first store registered fingerprints against the bank locker record. Now next time a person scans finger the sensor reads it and compares it with past records.<br>Now if match is found with existing prints, it sends the match signal to the microcontroller and the controller displays this data on the LCD display.<br>Also the controller drives the driver motor to open the bank locker ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 32
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Joystick Controlled Steering Mechanism Vehicle',
	'15',
	'Here we propose a robotic vehicle with steering mechanism. The vehicle uses a smart and accurate steering system that allows it to steer with ease.<br> The mechanism makes smart use of motors to achieve vehicle movement in forward backward as well as turning left/right simultaneously.<br>The system uses a joystick to wirelessly control the vehicle movement using rf transmission. The receiver circuit consists of rf receiver<br>connected to atmega microcontroller circuit to read rf commands. The microcontroller processes these commands and then operates the motors<br>to achieve the desired vehicle movement. The servo arrangement is made to achieve steering control while the dc motors are used to achive motion movements.<br>Thus we put forth a steering mechanism vehicle that can be wirelessly operated using Rf joystick remote.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 33
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Vehicle Tracking Using Driver Mobile Gps Tracking',
	'22',
	'The Global Positioning System (GPS) is a space-based satellite navigation system that provides location information .This system uses GPS to track the location of the vehicle. This system will track location of the vehicle and will send details about the location to the admin.  This system helps admin to find out the location of the driver driving the vehicle. Admin will know which driver is in which location. This system can be implemented in call taxi to find out the location of the driver driving the vehicle and will help the admin to allocate taxi to the customer. User login to the system using his user id and password. System will track the user’s location with the help of GPS and will send this detail to admin. Admin will access the system using his admin ID and password and will view the location of the driver driving the vehicle based on these details he will perform various operations. This application helps the admin to find t',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 34
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Wireless Red Signal Alerting For Trains',
	'22',
	'Railway networks are the biggest transportation networks used worldwide. Handling and managing such a vast network is not an easy task. The rail network consists of a lot of junctions and vast amount of signals on set distances to manage the train flow. Well the train driver needs to constantly check for any red signals on every post and decide whether to stop or move forward. It is very difficult to constantly keep track of every visual signal for the driver. So here we propose an automatic alerting system that alerts the driver of any red signal ahead. Our system works on the basis of Rf technology. Whenever a signal turns red, it sets on an rf transmitter fitted in it. The transmitter constantly transmits rf signals informing about a red signal. Now every train needs an receiver circuit on it. The receiver circuit when comes within certain range of the rf transmitter, it receives the input and sends it to the microcontroller. The mic',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 35
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Android Controlled Remote AC Power Control',
	'15',
	'Our proposed project aims to have control over the Ac power applied to a load by controlling the firing angle of a thyristor. In comparison to various methods this method is quite effective to control such a power supply.<br>The android interface required for sending commands can be sent through any android based phone/tab or any device running on android OS. The system makes use of a waveform zero crossing point that is detected by a comparator and the output of this is fed to the comparator.<br>The microcontroller is programmed to delay triggering control my making use of an opto isolator interface to a pair of SCR’s. The power through the SCR’s is then applied to the load.<br>The project makes use of an 8051 microcontroller for the operation. The commands sent via android device are received by a Bluetooth receiver mounted on the circuit. The receiver then processes the commands and sends it to the microcontroller for further process',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 36
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Motion Activated Wildlife Recording Camera Using Raspberry Pi',
	'23',
	'Getting wildlife footage is a difficult task. Cameramen need to wait for hours or even days without moving to get desired footage. Here we propose an automated system with a motion activated recording camera that starts recording only when motion is detected. This has a lot of advantages. To get the right moments footage the camera needs to be kept in recording mode for entire days or nights. Well this system saves battery as well as storage as it only records footage when motion is detected. The system consists of motion sensor with camera and sd card circuitry interfaced to a raspberry pi. The pi is used to process the sensor input to detect any motion. The camera recording is kept off if no motion is detected. As soon as motion is detected the raspberry pi records footage of the motion and again stops recording when motion is not detected which is saved in the memory card for later viewing. Thus we get only desired footage from the c',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 37
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'IR Based Traffic Density Detection And Signal Adjustment',
	'25',
	'The project is a traffic signal controller system that reacts to the density of traffic. The time required on changing signals adjusts automatically depending on the density of traffic. Well traffic problems contribute a major problem in many cities and also increase fuel consumption as well as pollution.<br>Traffic signals operating on fixed signal timing delays do not adjust to the changing traffic density. When the traffic density increase more than a limit at one particular side, it needs a longer green light duration to ease traffic flow.<br>Our system uses a microcontroller of the 8051 family that is interfaced with IR sensors. These IR sensors are used for line of sight object detection using which the system gets an input of the traffic density. Traffic density is measured as “low, medium and high”.<br>Based on this density reading the system adjusts and varies the traffic signal duration for that particular way.<br>This system ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 38
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'file encryption using fibonacci series',
	'22',
	'<strong>Project Description:</strong><strong></strong>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 39
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Fingerprint Voting System Project',
	'25',
	'Fingerprint Based Voting Project is a application where the user is recognized by his finger pattern. Since the finger pattern of each human being is different, the voter can be easily authenticated. The system allow the voter to vote through his fingerprint. Finger print is used to uniquely identify the user. The finger print minutiae features are different for each human being. Finger print is used as a authentication of the voters. Voter can vote the candidate only once, the system will not allow the candidate to vote for the second time. The system will allow admin to add the candidate name and candidate photo who are nominated for the election. Admin only has the right to add candidate name and photo who are nominated. Admin will register the voters name by verifying voter. Admin will authenticate the user by verifying the user’s identity proof and then admin will register the voter. The number of candidate added to the system by t',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 40
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Advanced Footstep Power Generation System',
	'24',
	'Here we propose an advanced footstep power generator system that uses peizo sensors to generate power from human footsteps.<br>The system allows for a platform for placing footsteps. The peizo sensors are mounted below the platform to generate voltage from footsteps.<br> The sensors are placed in such an arrangement so as to generate maximum output voltage. This is then provided to our monitoring circuitry.<br>The circuit is a microcontroller based monitoring circuit that allows user to monitor the voltage and charges a connected battery by it.<br>It also displays the charge generated and displays on an LCD display. Also it consists of a USB mobile phone charging point where user may connect cables to charge mobile phone from the battery charge.<br>Thus we charge a battery using power from user footsteps, display it on lcd using microcontroller circuit and allow for mobile charging through the setup.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 41
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Secure ATM Using Card Scanning Plus OTP',
	'17',
	'Our project proposes a secured ATM (Any time Money) system using a card scanning system along with Otp password system on sms for improved security. Usual ATM ssystems do not contain the OTP feature for money withdrawal. If an attacker manages to get hold of ATM card and the pin number he may easily use it to withdraw money fraudently. So our proposed system supports the ATM card scanning system along with an OTP system. Ths user may scan his card and login to the system .But after user is through with this authentication he may view details but is asked to enter OTP as soon as he clicks money withdrawal option. At this stage the system generates and sends a One time password OTP to the registered mobile number to that particular user. The password is generated ad sent to the user mobile phone. He now needs to enter the OTP in the system in order to withdraw money. Thus our system provides a totally secure way to perform ATM transaction',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 42
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Web Mining For Suspicious Keyword Prominence',
	'23',
	'Web mining can be termed as an information mining method to naturally search, collect and organize data from indexed online records which might be in various organized, unstructured or semi-organized structure. We usually use web mining techniques in order to assess the viability of a specific web page/entity in order to figure out various factors related to it. This project consolidates the best researched mechanisms from the semantic web and synaptic web at low entropy in order to build structural engineering of Semantic-Synaptic web mining. Our proposed project aims at web mining for finding out density of selected keywords in order to check its keyword prominence on those web pages. This is an important factor in various fields in order to check the prominence of specific keywords and flag websites having over prominence of those keywords. For example this can also be used to detect websites inspiring terrorism. The system can be us',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 43
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Car Speed Checker With Led Display',
	'25',
	'The project is a speed checker system that can detect rash driving and any kind of speed violation on highways and alert the traffic authorities. The conventional system uses a handheld radar gun which is aimed at the vehicle to record its speed and if there is any speed violation, nearest police station is informed. This process involves a lot of time consumption. Hence the proposed system is used to check the speed by calculating the time taken to travel between two set points at certain distance.<br>An IR transmitter and a receiver are installed on the set points on either side of the road. A control unit calculates the time taken by the vehicle to travel from one set point to other and calculates the speed that is displayed on seven segment display. If the calculated speed limit exceeds the set speed, a buzzer is sound which alerts the road transport authority.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 44
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Hotel Reservation Android',
	'22',
	'There are many mobile applications available which makes people’s work quicker. Here we introduce new android application where user can book rooms via Smartphone. This application allows users to book hotel rooms through android phones. Using this system user can view and check for various rooms available and simultaneously book them by making online payment via credit card. The system also provides user with additional facilities like Jacuzzi, swimming, meals and additional bed addition along with their associated charges. The system calculates the total cost on booking the services. Once the user makes the payment, system will provide online receipt to the user. User can view the room booking in an effective graphical user interface. Since room bookings will be displayed in effective graphical user interface user will get to know which rooms are booked and how many rooms are available for booking. Using this application user can sele',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 45
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Improved Data Leakage Detection',
	'19',
	'Data leakage detection techniques are built for users to track if data has been leaked and the trace the sources of data leakage. Many times we come across cases where leaked data is found at unauthorized places. For example we may find sensitive data stored on an unauthorized laptop or website. At such a time it becomes important to trace the source of data leakage. For this purpose we propose an improved data leakage detection technique to trace back sources of unauthorized leakage by using a strategy of data allocation across various agents. The strategy allows user to transfer data to users by considering receivers as agents who are allocated data along with some id based undetectable alterations. These alterations allow our system to trace back the source of leaked data as soon as it is found on any unauthorized sources. In this system we propose to indentify data leakages by storing data as per agents. Our system is designed for d',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 46
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Smart Wireless Battery Charging With Charge Monitor Project',
	'18',
	'The project is a device to transfer power wirelessly instead of using conventional copper cables and current carrying wires and also measure battery charge. It also charges the battery using wireless power transfer concept till it reaches 100% capacity. The concept of wireless power transfer was introduced by Nikolas Tesla. This power is made to be transferred within a small range only for example charging rechargeable batteries etc. For demonstration purposes we have a battery that operates by using wireless power. This requires an electronic circuit for conversion of AC 230V 50Hz to AC 12V, high frequency and this is then fed to a primary coil of an air core transformer. The secondary coil of the transformer develops 12V high frequency. The system also measures the charge in the battery and charges it until it reaches a 00% capacity. For this purpose we use an Avr family microcontroller that constantly measures battery charges and cha',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 47
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Hybrid AES DES encryption algorithm(any combination of algorithms is available)',
	'28',
	'<strong>Project Description:</strong>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 48
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Dialled Telephone Number Display On 7 Segment',
	'15',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 49
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Motion Based Message Conveyer For Paralytic/Disabled People',
	'29',
	'We come across hospitals and NGO’s serving disabled people. Now these people are not capable of full body movement as compared to a normal person. In such a situation we propose a system that helps disabled person display a message by just simple motion of any part of his body. Our proposed system works by reading the tilt direction of the user part. This device needs to be mounted on user finger of hand. The user now just needs to tilt the device in a particular angle to convey a message. Tilting the device in different directions conveys a different message. Here we use accelerometer in order to measure the statistics of motion. It then passes on this data to the microcontroller. The microcontroller processes the data and displays the particular message as per input obtained. The microcontroller now displays the associated message on the LCD screen. It also sounds a buzzer along with message as soon as it receives motion signal from t',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 50
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'GPS Handcuffs With Geographic Prohibitions',
	'17',
	'<p>In case of house arrests or when a person is prohibited from moving out of a particular geographical system, it is very difficult to keep a constant watch on the person. Also it is difficult to track if any prisoner among the huge number of prisoners has escaped from prison by underground tunnel or by hiding in some opaque object. For such situations we propose a gps based handcuff system that automates this process. The system tracks user(convict) through his receiver system by checking if it is in range of facility. Now the user is only allowed to move within a particular geographical area. When the user moves within any geographical area the system on person is in range of the prison/house or facility system and does not track him. This is done by using rf wireless system. Now as soon as user goes out of the specified geographic area the system detects that the persons system is not receiving signals from the transmitter mounted i',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 51
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Graphical Password Strategy',
	'29',
	'<strong>Project Description:</strong>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 52
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Image Blurring and Deblurring With Noise Removal',
	'29',
	'Here we introduce a system where you can blur and deblur the images with different effects. Here we demonstrate using various blurring methods such as average, disk , motion, sobel, perwitt. By using these effects, you can manipulate the image according to user preference. User can add noise to the image. User can remove noise from the image for better view.  User must provide input for various type of blur  , it can be radius,alpha etc according to the type selected by the user. This type of application is very useful for editing the image. User can view the original image with different effects. User can view the image with noise and without noise. User can also save the image, Images with different effects. This application also restores the image to original image.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 53
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Web Data Mining To Detect Online Spread Of Terrorism',
	'19',
	'Terrorism has grown its roots quite deep in certain parts of the world. With increasing terrorist activities it has become important to curb terrorism and stop its spread before a certain time. So as identified internet is a major source of spreading terrorism through speeches and videos. Terrorist organizations use internet to brain wash individuals and also promote terrorist activities through provocative web pages that inspire helpless people to join terrorist organizations. So here we propose an efficient web data mining system to detect such web properties and flag them automatically for human review. Data mining is a technique used to mine out patterns of useful data from large data sets and make the most use of obtained results. Data mining as well as web mining are used together at times for efficient system development. Web mining also consists of text mining methodologies that allow us to scan and extract useful content from u',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 54
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Long Range Spy Robot With Night Vision',
	'28',
	'The proposed project Long Range Spy Bot allows operating a robot irrespective of the distance of the person operating it. In order to make the robot move, the system two mobile phones, one to control the robot that sends DTMF commands to another mobile phone mounted on the robot vehicle. A DTMF decoder interfaced with the microcontroller of 8051 family receives the commands and with the help of a motor driver operates the vehicle movement. Thus according to the commands sent from the phone two DC motors enables the vehicle movement through motor driver IC. A battery is used for power source. Thus with the help of DTMF technology, the users can now operate a robot from any distance via a phone call. When a phone call is made, the receiver phone just needs to receive the call and then wait for user commands sent through keypad. The system even includes a spy wireless camera which is used to capture the area wherever the robot goes. All th',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 55
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Android location Alarm',
	'17',
	'People may have different work at different places. They may forget to keep track of all the work which is associated at different places.    So we proposed a system where user will be reminded about his work at certain place where the work is associated with. This system tracks the user location with the help of GPS. System retrieves the user’s current geological coordinates, with the help of this system tracks user’s current location. To use this system, user must register by filling up the details required by the system. User must enter the user id and password in order to login to the system. User must enter the task by specifying the location name and work at particular place. System will provide task id to the user. User can enter multiple tasks. After entering the task details user will get the map in which the task location will be circled and he will get to know the distance between his current location and the task location. O',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 56
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Android Customer Relationship Management App',
	'21',
	'Customer relationship management (CRM) is a system for managing a company''s interactions with current and future customers. It often involves using technology to organize, automate, and synchronize sales.  Company employee must keep track of current and future customers to synchronize sales. Manually it is not possible for the employee to keep records of all the leads. Customer Relationship Management System helps to keep track of number of leads converted by the employee. This System helps to manage sales. This system is a combination of both .Net and android technology.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 57
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Alcohol Sensing Display With Alarm Project',
	'15',
	'We here propose an alcohol sensing system that measures alcohol intake, displays percentage of alcohol and also sounds an alarm if it is above a particular threshold. Here we use an alcohol sensor circuit along with lcd display and a buzzer alarm. Our system first uses the alcohol sensor in order to detect alcohol. The sensor provides analog output. This analog output is now provided to the microcontroller for further processing. Based on the input the microcontroller calculates the percentage of alcohol and displays the same on an LCD display. It also sounds an alarm if the amount of alcohol exceeds a particular amount. Our system thus allows to measure amount of alcohol and then display percentage of alcohol measured. Also a alarm is sounded that indicates that measured alcohol is above a particular percentage.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 58
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Artificial Intelligence Dietician',
	'19',
	'The online artificial dietician is a bot with artificial intelligence about human diets. It acts as a diet consultant similar to a real dietician. Dieticians are educated with nutrient value of foods. A dietician consults a person based on his schedule, body type, height and weight. The system too asks all this data from the user and processes it. It asks about how many hour the user works, his height, weight, age etc. The system stores and processes this data and then calculates the nutrient value needed to fill up users needs. The system then shows an appropriate diet to the users and asks if user is ok with it, else it shows other alternate diets to fill up users needs.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 59
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Prepaid Energy Meter With Theft Detection',
	'29',
	'The Prepaid Energy Meter with Theft Detection System mainly works for detecting internal as well as external energy theft.<br>Internal energy theft occurs after the energy reaches to energy meter while external energy theft occurs before the energy reaches to energy meter.<br>The system works for theft detection and also allows user to use prepaid energy meter functionality.<br>Using this functionality user will able to pay in advance and use the exact amount of energy.<br>The system starts with GSM modem Connection and first configures the user number and gives authority to that number.<br>When the external or internal theft occurs in system, the system immediately inform authority or user with  message also system will able to send message when the prepaid balance is low or Zero.<br>The system is made up of AVR Microcontroller, current sensors , GSM modem, LCD display ,energy meter  and loads.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 60
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Visitor Sensor Light With Seven Segment Display',
	'27',
	'<p>The system is designed for optimum energy usage by monitoring the number of people present in the room. The electric loads are switched on as soon as someone is present in the room and switches of on detecting no presence.<br>The system uses InfraRed Sensor pairs in order to fulfil this purpose and thus saves a large amount of energy. Each pair consists of 2 sensor pairs placed at a certain distance from one another in the opposite direction. The IR transmitter is used to transmit IR rays straight to the receiver which receives the input and feeds this to an 8051 Microcontroller.<br>As soon as a person enters into the room, it is detected by the IR sensor module and this info is fed to the microcontroller. The microcontroller process this input received and switches on the load. At this time the system also counts the number of people present and increments a counter on each arrival, this count is displayed on a 7 segment display. As',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 61
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Android Controlled Fire Fighter Robot',
	'20',
	'Our proposed project aims to develop an android controlled fire fighter robot that can be used to extinguish fires through remote handling. The vehicle consists of a water tank along with a pump which can throw water when needed. The system uses an 8051 microcontroller for this purpose.<br>The android device is used as a transmitter to send over controlling commands to the vehicle. The android device provides a good touch based gui for controlling the robotic vehicle.<br>The Bluetooth receiver on the vehicle is used to receive those commands sent by the android device. These are then fed to the motors responsible for controlling the vehicle movements in front, back, left and right directions.<br>The Bluetooth receiver is interfaced with an 8051 microcontroller for this purpose. The microcontroller after receiving input commands, operates the motors through a driver IC for vehicle movements.<br>The use of android has one more advantage i',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 62
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Wifi Library Book Locator Project',
	'28',
	'Well a library is a vast collection of books. This requires a proper arrangement and placement of books in an order that makes it easy for the user to find a particular book. But in very large libraries having a huge collection, locating a particular book becomes quite a task.<br>Even though all books are arranged in categories, the location of category must first be known so that the user gets to know where that particular category of books are placed. In such a condition there needs to be a way through user can precisely locate the location of any book by just typing its name.<br>Here we a propose a server based system using an android application to achieve this task using wifi technology. The library operator just needs to add the location of a book in the system such as “3rd row| Right side | History Section | Fourth Book” and a map of the book along with it’s status of weather it is currently available or issued to someone else. A',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 63
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'IOT Home Automation Using Raspberry Pi',
	'19',
	'Internet of things is a technology of the future that has already started to touch our homes. Here we propose an IOT based home automation system using raspberry pi that automates home appliances and allows user to control them easily through internet from anywhere over the world. Our proposed system consists of a microcontroller based circuit that has lights and fan connected to it along with LCD display and Wifi connector interfaced with raspberry pi. Our system interacts with out online IOT system that IOT Gecko free web interface for controlling our home appliances with ease. After linking with IOT Gecko, the user is allowed to send load switching commands over IOT to our circuit. The circuit receives the commands over IOT by connecting to internet using wifi connector and then the raspberry processor processes these commands. After this the processor now processes these instructions to get user commands. It then displays these on a',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 64
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'IOT Garbage Monitoring System',
	'24',
	'This project IOT Garbage Monitoring system is a very innovative system which will help to keep the cities clean. This system monitors the garbage bins and informs about the level of garbage collected in the garbage bins via a web page. For this the system uses ultrasonic sensors placed over the bins to detect the garbage level and compare it with the garbage bins depth. The system makes use of AVR family microcontroller, LCD screen, Wifi modem for sending data and a buzzer. The system is powered by a 12V transformer. The LCD screen is used to display the status of the level of garbage collected in the bins. Whereas a web page is built to show the status to the user monitoring it. The web page gives a graphical view of the garbage bins and highlights the garbage collected in color in order to show the level of garbage collected. The LCD screen shows the status of the garbage level. The system puts on the buzzer when the level of garbage ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 65
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Mobile Quiz Through WiFi Project',
	'19',
	'The Mobile Quizzing is an android application that provides a new technique of Playing Quiz using mobile phones. This application is especially developed for People who like to play challenging Quiz. The project provides an effective challenge to the player.<br>The system has an admin login that has overall control over Question and Answer in the Server. Admin feed the Question and Answer in to the System. These questions are randomly picked and sent on users android devices .User have to first create an account into the system for playing quiz. At the end of the Quiz the system checks all the answer and generates a brief report card<p><b>Modules:</b></p><ul><li><b>Admin Login:</b> Admin administers the system and feeds new Questions and Answers into the Server.</li><li><b>User Login:</b> User will have to register into the system for login and can play Quiz question.</li><li><b>Quiz System:</b> There will be options/answer space availa',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 66
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'RF Based Secure Door Opener System',
	'20',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 67
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Class Management System Project',
	'24',
	'This software project is a classes/ Tution management system. It consists of all the data management and storage facilities that are required for effectively managing a class or tution teaching multiple courses and subjects. It consists of multiple teachers and faculty accounts along with their payment status. The system helps in effectively managing and scheduling batches of students as per their courses and exam priorities. The class management system allows the administrator to view and edit data as required. Administrator is notified of various events such as faculty contract renewal, fees date, student or batch fees payment date and other useful events as and when needed.<br>All this functionality ensures no errors and effective management of Class.<br>Get this innovative class management project only on NevonProjects.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 68
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'TV Remote Controlled Home Appliances Project',
	'21',
	'<p>The project is designed to operate electrical loads using a TV remote. The remote transmits coded infrared data which is then received by a sensor interfaced to the control unit. The system operates electrical loads depending on the data transmitted from the TV remote. Operating conventional wall switches is difficult for elderly or physically handicapped people. This proposed system solves the problem by integrating house hold appliances to a control unit that can be operated by a TV remote.<br>RC5 based coded data sent from the TV remote is received by an IR receiver interfaced to the microcontroller of 8051 family. The program on the microcontroller refers to the RC5 code to generate respective output based on the input data to operate a set of relays through a relay driver IC. The loads are interfaced to the control unit through the relays. The system can be used in existing domestic area for either operating the loads through co',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 69
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Android Pc Controller Using Wifi',
	'23',
	'An Android based PC Controller using Wi-Fi is an android application that works like PC mouse. This application smartly controls pc keyboard functions and mouse operations through an android mobile phone. This android application is based on the concept of using an android phone as a mouse. The software application once installed on an android phone can allows users to play games or control other pc functionality through their android phone. The application is made using Eclipse and creates a QWERTY keypad buttons similar to the one used in PC. With the keypad, user can even use it for typing it on any word processor and can operate any application. The application when installed and run on an android based phone shows a mouse settings screen to control mouse sensitivity. The application requires a Wi-Fi connection between the computer and the android device. Thus, a user can remotely access the computer instead of sitting beside it. Th',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 70
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Android – PC Chatting and Image Sharing System',
	'23',
	'Chatting, image, audio and video sharing is possible between two or more people using mobile phones which is common now- a-days. This system enables user to send or receive messages and images with mobile phone and personal computer. This system involves two users where user can send messages, share images using their devices. Both the users must have this application to be installed in their devices in order to use the functionality of this system. For security purpose, system will encrypt and decrypt the images. So images are sent securely through network medium. This system enables the user to send messages from his mobile phone to the user using his personal computer. This system also enables the user to send and receive messages between two handheld devices i.e. mobile phones. This system requires good network connection. User can send or receive messages, images with their mobile phones as well as with their personal computers. Th',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 71
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Camera Motion Sensing Project',
	'19',
	'A motion sensor project that detects motion and sounds an alarm accordingly. This software system is designed in C# that constantly monitors an environment using a camera and sounds an alarm and even records images of the motion taking place as soon as it takes place.<p><b>The project works as follows:</b></p><ul><li>The user first needs to set a security code.</li><li>As soon as the user sets the code and activates the system, monitoring starts.</li><li>The motion detector algorithm now constantly monitors the environment to check for any movement.</li><li>As soon any movement takes place in front of the camera the alarm is activated.</li><li>Now the system sounds its alarm and even takes photos of the motion taking place.</li><li>The user now needs to deactivate the alarm by entering the security code again.</li></ul>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 72
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Fake Product Review Monitoring And Removal For Genuine Online Product Reviews Using Opinion Mining',
	'25',
	'As most of the people require review about a product before spending their money on the product. So people come across various reviews in the website but these reviews are genuine or fake is not identified by the user. In some review websites some good reviews are added by the product company people itself in order to make in order to produce false positive product reviews. They give good reviews for many different products manufactured by their own firm. User will not be able to find out whether the review is genuine or fake. To find out fake review in the website this “Fake Product Review Monitoring and Removal for Genuine Online Product Reviews Using Opinion Mining” system is introduced. This system will find out fake reviews made by posting fake comments about a product by identifying the IP address along with review posting patterns. User will login to the system using his user id and password and will view various products and wil',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 73
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Robot Controlled By Android Application',
	'23',
	'Our project proposes a robotic vehicle that can be handled remotely through an android based device. The control device is integrated with a Bluetooth device that allows capturing and reading the commands. The robotic vehicle may then be operated as desired as commanded through the android application. The vehicle is integrated with a microcontroller of 8051 family that is used to operate the vehicle as per android commands.<br>The controlling device may be any android based Smartphone/tab etc having an android OS. The android controlling system provides a good interactive GUI that makes it easy for the user to control the vehicle. The transmitter uses an android application required for transmitting the data.<br>The receiver end reads these commands and interprets them into controlling the robotic vehicle.<br>The android device sends commands to move the vehicle in forward, backward, right and left directions.<br>After receiving the co',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 74
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Android Controlled Robotic Arm',
	'16',
	'This system allows controlling a robotic arm by an android device. The android device is used to send Bluetooth commands. These commands are then sent to the Bluetooth receiver which is in the receiver circuit. This Bluetooth receiver is interfaced to the 8051 microcontroller which is processed by it. The 8051 microcontroller controls the motor to move the robotic arm as per the commands received. Thus this system uses an android application to move the robotic arm in upward or downward direction, or can send commands like grip open or close. Thus this Android controlled robotic arm project can be used to pick any object, move it, and place it anywhere as per the need. The receiver circuit instructs the motors to move the arm as per the commands received by the android application.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 75
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Rain Sensing Automatic Car Wiper',
	'26',
	'Today’s car wipers are manual systems that work on the principle of manual switching. So here we propose an automatic wiper system that automatically switches ON on detecting rain and stops when rain stops. Our project brings forward this system to automate the wiper system having no need for manual intervention. For this purpose we use rain sensor along with microcontroller and driver IC to drive the wiper motor. Our system uses rain sensor to detect rain, this signal is then processed by microcontroller to take the desired action. The rain sensor works on the principle of using water for completing its circuit, so when rain falls on it it’s circuit gets completed and sends out a signal to the microcontroller. The microcontroller now processes this data and drives the motor IC to perform required action. The motor driver IC now drives a servomotor to simulate as a car wiper.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 76
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Hovercraft Controlled By Android',
	'18',
	'A hovercraft is a non wheeled vehicle that can hover over land as well as water easily using high powered fans and aerodynamic design. We here propose an advanced hovercraft that uses high rpm motors interfaced with an avr family microntroller to achieve desired functionality. The motor below hovercraft rotates at a very high RPM that allows it to generate a force enough to make it hover on the surface thus reducing the friction below it to minimum. Then we use the motor propeller mounted behind it to push the hovercraft in forward direction. Now we also need to use a servo motor attached to the hovercraft rudder that helps the hovercraft to move in desired directions by bending the air at accurate angles. The system works collectively to hover while continuously managing servo as well as propeller motor to drive the hovercraft as desired. Now to control the hovercraft we here use an android application. The android application sends mo',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 77
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Liquid Level Controller System Without Contact',
	'20',
	'The project is designed to detect the level of liquid by using an ultrasonic module. The ultrasonic sensor measures the range of liquid level (in cm) by detecting the reflection coming ahead of it. If the measure of the level falls below a set point the first pump automatically starts adding water to the container. If it goes above set level , it starts the other motor that pumps out water of the container. This way it brings the water to desired level by switching between motors.<br>The project uses a microcontroller whose serial port is interfaced with this ultrasonic module. The Tx sensor sends the ultrasonic signal reflected from the level and is received by the ultrasonic Rx sensor. These signals are then sent to microcontroller that initiates the relay to switch the pumps on or off. The user may check the current liquid level by setting system to normal mode. Then user may switch to setting mode to set liquid level to desired leve',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 78
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'College Selector App',
	'23',
	'<strong>Description:</strong><br>It helps all to find out various college options from our phone and also helps to shortlist the best college for us.<br>The keys features of our App are:-',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 79
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Image Steganography With 3 Way Encryption',
	'26',
	'Steganography is the technique of hiding private or sensitive information within something that appears to be nothing be a usual image. Steganography involves hiding Text so it appears that to be a normal image or other file. If a person views that object which has hidden information inside, he or she will have no idea that there is any secret information. What steganography essentially does is exploit human perception, human senses are not trained to look for files that have information inside of them. What this system does is, it lets user to send text as secrete message inside an image file, user uploads the image and enters the text to send secretly, and gives a key or a pass word to lock the text, what this key does is it encrypts the text, so that even if it is hacked by hacker he will not be able to read the text. You will need the key to decrypt the hidden text. User then sends the image and key to the receiver and receiver firs',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 80
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'RPM Display For BLDC Motor With Speed Controller',
	'29',
	'This project is used to control and measure the BLDC motor speed by using an IR speed sensor mechanism. There is a need for controlling a DC motor speed in industries that uses drilling, spinning, lathes, elevators etc therefore this system provides an efficient mechanism for increasing or decreasing the speed.<br>The project comprises of three phases. The first one is input phase where desired speed is entered using switches. The second phase i.e. processing enables a RPM reference of motor by interfacing IR sensor mounted on shaft and microcontroller of 8051 family in the circuit. Microcontroller generates PWM pulses according to the input or switches to regulate the supply of DC power to motor. And the last phase i.e. output uses an opto-isolator and a MOSFET for driving BLDC motor. The IR sensor measures the speed and sends it to microcontroller that displays it on LCD.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 81
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Industry Automation Using Programmable Switching in Repetitive Nature Of Work',
	'27',
	'<p>The project operates the switching mechanism of industrial loads for repeated operations with the help of a user programmable logic control device. The project uses three switches and a microcontroller of 8051 family that operates the loads in three modes: set, auto and manual mode. In set mode, the load works according to the specified time and in auto mode it operates in default time. In the manual mode, user can manually switch the load. The status of the loads and mode are displayed on LCD. This project is useful in industries where the loads are operated in repetitive orders and in time intervals.</p>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 82
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Image Retrieval Using Feature Extraction',
	'16',
	'Here we proposed a system where similar images are fetched based on image features. As images are more suspected to noise we used many preprocessing steps to remove noise . Image features are extracted using feature extraction method and these features are stored into database.  Query image feature values are compared with other images in directory and similar image is extracted and displayed to user. Image is quantized in hsv color space into equal bins and the features extracted from hsv color. Filter is used to remove noise from image.  Image is given as an input to the application, system find its nearest neighbor from the training set and system fetches nearest image to the input test image. System sorts images according to smallest distance. User must select an image and system will extract image based on query image features and will display similar image to user.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 83
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Fingerprint Based ATM System',
	'22',
	'Fingerprint Based ATM is a desktop application where fingerprint of the user is used as a authentication. The finger print minutiae features are different for each human being so the user can be identified uniquely. Instead of using ATM card Fingerprint based ATM is safer and secure. There is no worry of losing ATM card and no need to carry ATM card in your wallet. You just have to use your fingerprint in order to do any banking transaction. The user has to login using his fingerprint and he has to enter the pin code in order to do further transaction. The user can withdraw money from his account. User can transfer money to various accounts by mentioning account number. In order to withdraw money user has to enter the amount he want to withdraw and has to mention from which account he want to withdraw (i.e. saving account, current account) .The user must have appropriate balance in his ATM account to do transaction. User can view the ba',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 84
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Robotic Vehicle With Metal Detection Project',
	'24',
	'<p>Our project proposes a Metal detection robotic vehicle operated using Rf remote control wirelessly. The project demonstrates real life robotic vehicles used to detect land mines or other metal based objects on its path.<br>The vehicle is fitted with a metal detection system that senses metals and then alarms the user about it through a buzzing sound of land mine possibility. The system works in conjunction with an 8051 series microcontroller to achieve this operation.<br>The push buttons are used to send commands to move the vehicle forward, backward, left and right. Two motors at receiving end operate the vehicle as per the commands received. As soon as a command is sent it gets transmitted through rf transmitter. At receiving end an rf receiver reads the command and passes it to an 8051 microcontroller for processing. The microcontroller then operates the motors to move the vehicle through a motor driver IC.<br>The metal detection ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 85
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Student Attendance with Fingerprint Reader',
	'17',
	'This project uses a biometric concept to facilitate the attendance system in educational institutes. It uses the most reliable way of uniquely identifying students through fingerprint reading. Such type of application is very useful in school as well as in college for daily attendance. Through this application we can keep a systematic track of student''s attendance. This project enables the easy way of maintaining class attendance with fewer efforts.<br>It can be later implemented for the teaching staff.<p><b>Description: </b></p><ul><li>The project requires a fingerprint reader for finger detection.</li><li>Every student can login to the system through finger detection.</li><li>The fingerprint of the student is compared with the one stored in database and if it matches then attendance is marked for that particular student.</li><li>The system also generates a brief report of attendance from the database according to subject-wise or',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 86
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Motion Based Door Opener With Metal Detector',
	'17',
	'Motion Based Automatic Door Opener mainly aims in opening the doors without any manual help. It is difficult to manually open the door always in places like hotels, malls, office, supermarkets etc.<br>We introduce this project which makes the door open automatically when the sensors sense the presence of a human being. This system works with the help of PIR (Passive InfraRed) sensors. A live body emits some energy, this energy is sensed by the PIR sensors and the door opens as the energy comes closer to the door and closes as the energy goes far away. This system is enabled of even detecting any metallic objects the human is carrying with him and notifies accordingly.<br>We can develop this system further by integrating counter mechanism so as to keep track of the number of people came inside the facility.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 87
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Landmine Detection Robotic Vehicle With GPS Positioning Using ARM',
	'19',
	'Nation’s security is most important thing today and therefore there is a need to consider safety of the soldiers and army who fight for the nation’s security. One of the major concerns is the mine that is laid by the enemy on the way. So it becomes very important to detect this mine and diffuse them to save the lives of soldiers and armies. This is now made possible with our Landmine Detection Robotic Vehicle with GPS Positioning Using ARM project. System can scan a rectangular area efficiently and scan it for landmines. For this, the system makes use of metal detector for detecting these mines. Once the system detects the mine, it stops the robotic vehicle at the location where the mine is being hidden. After which system makes use of GPS to track the position of the mine and then sends SMS message indicating the position of the mine that is hidden in the land. Here the arm controller is used to process data sent by the metal detection',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 88
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Factory Worker Alcohol Detector With Automatic Machine Shutdown',
	'20',
	'Factories are machine critical industries. Factories run on two major resources, machines and labor. Machines need to be operated carefully since one mistake may lead to injuries or loss of life and business. Large industrial machines that run on high power are even critical since a mistake in operating it may lead to huge losses. Here we propose an automated system to detect alcohol consumption of factory workers and machine shutdown with alerting system. Consumption of alcohol affects the mental state of person. A person operating heavy machines under the influence of alcohol is likely to hurt himself as well as the machine. So we use a microcontroller based circuit that consists of alcohol sensor interfaced with it. Also we have a GSM modem and LCD display. The entire system is powered by a 12V supply. The alcohol sensor is constantly running to check if worker is drunk. The alcohol sensor can sense the alcohol level and outputs a vo',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 89
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Android Patient Tracker',
	'15',
	'<p>We propose to develop an android application to aid in dispensary patient data management and viewing. The system is aimed to help doctors to enter as well as view patient history as well as other patient details. Our system is a standalone system that can be installed on doctor android phone to be used for further login. On installation the application allows a doctor to open application and enter the details of any patient that undertakes his service. The application allows doctor to insert various data fields regarding a patient including patient name, disease, medication provided, date of arrival, cost etc. The system saves this patient related data in the android phone. The doctor may now view this data as and when needed. The doctor may check the details whenever needed. The application allows doctor to search patients by name as well as date. </p>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 90
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'IOT Weather Sensing System',
	'15',
	'Here we propose a smart weather reporting system over the internet. Our proposed system allows for weather parameter reporting over the internet.  It allows the people to directly check the weather stats online without the need of a weather forecasting agency.<br>System uses temperature, humidity as well as rain sensor to monitor weather and provide live reporting of the weather statistics.<br>The system constantly monitors temperature using temperature sensor, humidity using humidity sensor and also for rain. The system constantly transmits this data to the microcontroller, which now processes this data and keeps on transmitting it to the online web server over a wifi connection. This data is live updated to be viewed on the online server system. Also system allows user to set alerts for particular instances, the system provides alerts to user if the weather parameters cross those values. Thus the IOT based weather reporting system pro',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 91
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Efficient Power Manager Project',
	'21',
	'<p>The system is designed for optimum energy usage by monitoring the number of people present in the room. The electric loads are switched on as soon as someone is present in the room and switches of on detecting no presence.<br>The system uses InfraRed Sensor pairs in order to fulfil this purpose and thus saves a large amount of energy. Each pair consists of 2 sensor pairs placed at a certain distance from one another in the opposite direction. The IR transmitter is used to transmit IR rays straight to the receiver which receives the input and feeds this to an 8051 Microcontroller.<br>As soon as a person enters into the room, it is detected by the IR sensor module and this info is fed to the microcontroller. The microcontroller process this input received and switches on the load. At this time the system also counts the number of people present and increments a counter on each arrival, this count is displayed on a 7 segment display. As',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 92
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Internet Border Patrol',
	'24',
	'<strong>Additional Benifits:</strong>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 93
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Car Parking Project Based on RFID',
	'18',
	'<p>The project is a car authorizing system where the system can only allow a car entry when a valid RFID card id swiped by the car owner with sufficient balance. The system also had paid parking facility where the amount of parking gets deducted automatically whenever the card is swiped and the available number of car parking are displayed on a seven segment display. The project consists of IR sensors and a microcontroller to monitor the entry and exits of cars.<br>The entry and exit is operated by an H-bridge arrangement. This arrangement operates the motors that enable exit and entry by opening and closing the door clockwise and anticlockwise. For demonstration purposes the system has used RFID cards to simulate real time user cards. Whenever the card is swiped a buzzer beeps. With every entry the available number of parking gets reduced by one and with every exit it gets reduced by one and is displayed on seven segment display. The s',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 94
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Industry Temperature Control System',
	'19',
	'Our project aims to monitor and control the temperature of devices as per it’s requirements in the industrial use. It is also used to show the current temperature on an LCD display. An 8051 microcontroller is used for this purpose.<br>We here use IC DS1621 to sense temperature. IC DS1621 is a Digital Thermometer as well as a Thermostat that is used to provide a 9 bit temperature reading that indicates the temperature control of device. An EEPROM is used as a non-volatile user desired temperature settings. This is done through an 8051 microcontroller.<br>A set of switches are used to get input temperatures from the user. The switch input is stored in EEPROM -24C02. Pressing set button allows user to adjust the minimum and maximum temperature settings thus allowing to set temperature range.<br>In the same way for a DEC button we connect a relay from a microcontroller through a transistor driver. The contact point of the relay, ie a lamp d',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 95
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Employee attendance System By Qr Scan',
	'17',
	'This project is designed to take down employees'' attendance using Qr code. Every employee will be having a card that contains a unique Qr code. Each Qr code represents a unique id for all employees. They just have to scan their cards in front of the webcam on arriving and the system notes down their attendance as per date and time. System then stores all the employees'' attendance records. It generates an overall report in excel sheet for admin and even allows him to search for particular employees attendance.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 96
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Web Server Log Analysis System',
	'25',
	'Web usage data is of prime importance these days. Web pages used on a day to day basis and various users logging on to a website are two major data categories of prime importance. Here we propose a web mining algorithm that proves better that most traditional web mining algorithms. We here track web data and use the E web miner algorithm for web log analysis and reporting. The algorithm works on Ecommerce data continuously scanning and going through the web log looking for patterns as suggested by user conditions. The algorithm is designed to look for various patterns that appear to be in any logical order. It is built to provide analytics data according to predefined algorithms built in for maximum performance and minimum processing time.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 97
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Android Controlled Wildlife Observation Robot',
	'25',
	'Wildlife observers need to get a close footage of wild animals by getting into their habitats. Well it is not always safe to get close to all wild animals. So for this purpose we put forward this wildlife observation robot with night vision capability. This robot can be operated wirelessly by users using just their android phones. The robot also has a wireless camera that sends footage stream wirelessly to the user PC. So wildlife observers can safely get close footage of wild animals by operating this robotic vehicle from a safe distance. This system consists of an 8051 family microcontroller unit used for processing user sent commands. These commands are received by the system through a Bluetooth modem. The microcontroller then processes this data and passes on signals to driver motors. The driver motors now in turn operate the motors by providing desired signal outputs to drive the vehicle movement motors. Also when the microcontroll',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 98
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Grocery Shopping Android',
	'22',
	'A grocery shopping is an android application where users can purchase and order groceries online. The system is developed with a user-friendly and attractive GUI. It delivers a wide range of groceries available online. Users have to first login into the system to view the groceries and add them into their cart. They can then order it by making a secure online payment via CREDIT CARD. The system functionality of products and orders is stored on server side in a web service. The android app is for client usage. It consists of client side scripting for placing orders by connecting to the server side webservice.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 99
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Android Crime Reporter and Missing Person Finder',
	'19',
	'We here propose an android crime reporter which tracks the investigation status of criminal cases with logs as well as it also track complaints logged by the user. The system is proposed to help agencies like CBI, CID and other such bureau’s to speed up their investigation process and track status of multiple cases at a time. In this system, society itself helps the authority to get the crime details quickly and to proceed with investigation. They will help the authorities to find out the crime ratio in the society. The system keeps logs of a case which includes case summary, people involved, disputes, past criminal history of those involved, Items recovered on scene and other details. The system realizes the type of case, allows admin to update the status of investigation, upload more images of crime and items found on scene etc. User can post their missing person’s details with a photograph. User may also check for the status updated ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 100
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'FingerPrint Voting System',
	'24',
	'One of the major factors to be taken care of in a voting process is authentication and authorization of voters. Many conditions need to be checked to ensure these factors. Major conditions include:<br>1. Check authenticity of voter<br>2. Authorize legitimate voters to vote<br>3. Avoid double vote casting by any individual<br>Checking if all these conditions manually is a very complicated and exhausting task with many chances of human error. To avoid this we here propose a fingerprint based voting system project. We use a fingerprint module interfaced with microcontroller and an LCD screen in this system. The fingerprint module is used to sense fingerprints and provide to microcontroller for further processing. The system has list of eligible voters in it, the voting system tallies the recognized finger print against the ones stored in database. If match is found that person is allowed to vote. Once a vote is casted by that person his id',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 101
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Rf Controlled Spy Robot With Night Vision Camera',
	'20',
	'This system uses RF remote controlled vehicle which has a camera that will be needed for spying purposes. The system proves to be very beneficial in places where humans cannot be sent for spying purposes such as military places as there can be some risk involved. The vehicle in this system has a night vision enabled camera. This vehicle can be operated wirelessly using RF remote. Here the camera send signals to the receiver used and the place that will be captured by the camera can be displayed remotely on a PC and can be recorded for further reference. In this system we use 8051 microcontroller in order to control the system which will be interfaced to the receiver. In this both the RF remote and the vehicle is battery powered. As the user sends commands through RF remote using the push buttons on the remote, these commands are then sent to the receiver. The receiver then sends these commands to microcontroller which processes these co',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 102
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Visual Product Identification for Blind',
	'21',
	'This project is developed to make the life of blind people easy. This is a camera based system to scan the barcode behind the image and read the description of the product with the help of Id stored in the barcode. This is very beneficial in case of finding out the description of packaged goods to the blind people and thus helping them in deciding to purchase a product or not especially which are packaged. This is because it becomes very difficult for the blind people to distinguish between the packaged goods. In order to use this system, all the user needs to do is capture the image on the product in the mobile phone which then resolves the barcode which means it scans the image to find out the Id stored. Thus this application really benefits blind and visually impaired people and thus making their work of identifying products easy. This is very easy to use and affordable as it requires a scanner to scan the barcode and a camera phone ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 103
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Android Bluetooth Chat',
	'15',
	'The project Bluetooth Messenger is a system developed on android that will enable the users to create profile and chat with server with the help of device''s Bluetooth. Using the system one can create profile, update their status message and even add a profiler picture. The system requires both the device to be connected via Bluetooth. Every user can chat with this profile and can even transfer text file from one node to another. The communication process that the system exhibits is one-to-many that means users can only chat with the server and not with other users. Another useful feature of the system is that it maintains all the chat history so one can view it whenever required.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 104
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Workplace Alcohol Detector With Instant Reporting',
	'25',
	'Combustible gases are a very common reason for blasts and fire accidents, causing large damage to life and property due to these fires. So here we propose an automated gas detection and alerting system that alert users wherever they are about the leakage of combustible gas and/or fire using SMS through GSM modem. So for this purpose we use a PIC microcontroller along with Combustible gas sensor, temperature sensor, LCD display, GSM modem for sending message and buzzer. The system is powered by a 12V power supply. The system constantly scans the gas sensor and the temperature sensor to detect leakages or high temperatures in its vicinity. As soon as gas is detected at the sensor, it produces an equivalent voltage and signals the microcontroller. The microcontroller on reading the signal checks the amount of gas detected, On detecting gas above certain level it then goes into alert mode. The system now displays the status of the event occ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 105
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Automatic Elevator With Overload Alert Using PIC',
	'24',
	'The main aim of this Automated Elevator With Overload Alert is to prevent the elevator from any damage. This system makes use of sensors for sensing when a person enters the elevator and automatically increements the counter. This count is displayed on the 7 segment display to indicate the number of people in the elevator at a particular time. The system makes use of infraRed sensors which is placed at a distance from the elevator in the opposte direction. as soon as a person enters the elevator, the sensors senses it and increements the counter and in the same way decreements the counter when a person exits the elevator. all this information is fed by the PIC microcontroller. This system also makes use of buzzer. this buzzer starts ringing as soon as the number of people in the elevator exceeds the limit. The buzzer only stops when the number of people exit the elevator so as to bring the counter number less than the limit.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 106
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Smart Android Graphical Password Strategy',
	'29',
	'Graphical Password application allows the user to set a pattern password for using the other applications. The pattern are some set of fruits which randomly changes its position every time you try to login. The user has to provide his details for registration and then has to draw a pattern as a password by drawing it twice. The user has to select an application while registration itself and can have multiple accounts for every single application. The pattern is a 4X4 Grid consisting of multiple fruits images, the user has to drag or draw at least over 4 fruits for the application to consider his pattern lock. The Application auto generates a Unique Id for every User who wants to register. After the user has successfully registered he is redirected to the Login page where he has to provide his Id and Pattern Password from which the selected application by the user during the registration opens up.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 107
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Android Civil Administration Reporting Project',
	'23',
	'We propose to build a unique system that connects local people to the high authority in Civil Administration Office. The system allows users to register and as soon as they register an account with unique id is created in the system. User can then register complain by upload Image with description and GPS Co-Ordinates using its android phone. He can select to which Authority this Complaint should be sent. And he will receive a unique complaint id from which he can keep track of that complaint.  We have an admin in this system who can add New Authorities and even he can edit their detail or delete them. Admin can view all the complaints but he cannot edit or update status of complain. He can only view the progress in complains.  Authorities will have their separate login where they can only view their own complaints. And update the progress status on that complaint.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 108
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'IOT Air and Sound Pollution Monitoring System',
	'23',
	'Air and sound pollution is a growing issue these days. It is necessary to monitor air quality and keep it under control for a better future and healthy living for all. Here we propose an air quality as well as sound pollution monitoring system that allows us to monitor and check live air quality as well as sound pollution in a particular areas through IOT. System uses air sensors to sense presence of harmful gases/compounds in the air and constantly transmit this data to microcontroller. Also system keeps measuring sound level and reports it to the online server over IOT. The sensors interact with microcontroller which processes this data and transmits it over internet. This allows authorities to monitor air pollution in different areas and take action against it. Also authorities can keep a watch on the noise pollution near schools, hospitals and no honking areas, and if system detects air quality and noise issues it alerts authorities',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 109
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Collision Detection Robotic Vehicle Using ARM',
	'18',
	'Today most of the industries use robotic vehicle to carry out their most of the task in order to automate processes and thereby save a lot of time and avoid many expenses. So in order to make the robotic vehicle free from collision, here we propose a collision detector robotic vehicle that is not only capable to detect obstacles but also to avoid collisions. The vehicle uses an ultrasonic sensor with arm controller to achieve this purpose. The ultrasonic sensor enables the robot to virtually see and recognize object, avoid obstacles, measure distance. The vehicle can be controlled by user using an android phone. The arm controller decodes users commands sent through an android phone. System receives these commands through a Bluetooth modem and then processes this data. It then operates the robotic vehicle to achieve desired movement. If an obstacle is encountered, the system stops vehicle immediately. The system also makes use of a buzz',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 110
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Automated Paralysis Patient Healthcare System Project',
	'26',
	'We come across hospitals and NGO’s serving paralytic patients who have their whole or partial body disabled by the Paralysis attack. These people in most cases are not able to convey their needs as they are neither able to speak properly nor do they convey through sign language due to loss in motor control by their brain. In such a situation we propose a system that helps disabled person in displaying a message over the LCD by just simple motion of any part of his body which has motion abilities. This system also takes care of the situation wherein no one is present to attend the patient and thus sending a message through GSM  of what he wants to convey in SMS. Our proposed system works by reading the tilt direction of the user part. The working of the device here is shown by holding in the fingers of the mobile hand. The user now just needs to tilt the device in a particular angle to convey a message. Tilting the device in different di',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 111
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Banking Bot Project',
	'16',
	'A banking bot project is built using artificial algorithms that analyzes user’s queries and understand user’s message. The system is designed for banks use where users can ask any bank related questions like loan, account, policy etc. This application is developed for android devices. The system recognizes user’s query and understands what he wants to convey and simultaneously answers them appropriately. The questions asked by the users can be in any format. There is no specific format for users to ask questions. The built in artificial intelligence system realizes users requirements and provides suitable answers to the user. It also uses a graphical representation of a person speaking while giving answers as a real person would do.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 112
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Active Chat Monitoring and Suspicious Chat Detection over Internet',
	'20',
	'A lot of terrorist activities and groups communicate over apps and chat programs over the internet. They also use these chat application over the internet for getting their message to young generation and making new terrorists. Well we here propose a internet chat application that actively monitors various chats going on and also alerts the admin about any suspicious chat process taking place. The system is built to process all chats taking place over and saving them with history. The chat process is handled by server. As data passes through server it continuously scans it for any suspicious keywords. The admin may however keep a watch at any chat he desires. A special alert is provided to the admin regarding any suspicious chat that is processed at the server. The admin may now watch that particular chat. The system also provides the I P address of both the chatting parties for further location tracking of those involved. This chat mon',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 113
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Obstacle Avoider Robotic Vehicle',
	'27',
	'Our proposed project puts forward an obstacle avoider robotic vehicle that uses ultrasonic sensors for this purpose. The system uses an 8051 family microprocessor to achieve this functionality.<br>The robotic vehicle is designed to first track and avoid any kind of obstacles that comes it’s way. The vehicle achieves this smart functionality with the help of ultrasonic sensors coupled with an 8051 microprocessor and motors. The entire system combined gives the vehicle an intelligent object detection and obstacle avoidance scheme.<br>This system allows the vehicle to guide itself in case it encounters any obstacle. The obstacle detection is done using the ultrasonic sensor. This is detected and a signal is passed on to the 8051 microcontroller.<br>On receiving the signal it guides the vehicle in another direction by actuating the motors through the motor driver IC.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 114
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Sentiment Analysis for Product Rating',
	'19',
	'Here we propose an advanced Sentiment Analysis for Product Rating system that detects hidden sentiments in comments and rates the product accordingly. The system uses sentiment analysis methodology in order to achieve desired functionality. This project is an E-Commerce web application where the registered user will view the product and product features and will comment about the product. System will analyze the comments of various users and will rank product. We use a database of sentiment based keywords along with positivity or negativity weight in database and then based on these sentiment keywords mined in user comment is ranked. Comment will be analyzed by comparing the comment with the keywords stored in database. The System takes comments of various users, based on the comment, system will specify whether the product is good, bad, or worst. Once user login the system he can view the product and product features. After viewing pro',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 115
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Android Based Parking Booking System',
	'27',
	'The proposed project is a smart parking booking system that provides customers an easy way of reserving a parking space online. It overcomes the problem of finding a parking space in commercial areas that unnecessary consumes time. Hence this project offers a web based reservation system where users can view various parking areas and select the space to view whether space is available or not. If the booking space is available then he can book it for specific time slot. The booked space will be marked yellow and will not be available for anyone else for the specified time. For demonstration we will be using 4 parking spaces and each parking space will have 20 time slots. This system provides an additional feature of cancelling the bookings. User can cancel their books space anytime. Users can even make payment online via credit card. After making payment users are notified about the booking via email along with unique parking number. The',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 116
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Web Agent For Learning Content Updating',
	'16',
	'Today’s we usually require systems for auto content updating as per updates on a remote server. Our system allows implementing this mechanism by using an enhanced system. The system is a part of the N2SW(Network to Software) algorithm that allows for effective communication between a network server and remote client using an active internet connection. The algorithm is built for secure and effective communication between client and server machines. The system acts as a web agent between the online server and client machines. The client machine consists of teaching content database. This content is constantly scanned and compared with online version for any updates/variations. Any updates on server are constantly being monitored. An update on server must be instantly reflected on client system. This our server instantly updates for any changes by pinging it and the client thus allows server to transfer the updated set of data to on it. T',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 117
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'IOT Based Office Automation',
	'24',
	'It is quite difficult for individual office owners to operate one or more that one offices and keep track of each office appliances individually. At such time we need an online solution for physical office appliances control. Her we propose use of iot technology for office appliance automation. This allows owner co control his/her office appliances through the internet using an easy to use GUI. For this system demonstration our system uses an AVR family microcontroller for the purpose. A wifi modem is used for receiving commands over the internet. We use 3 loads and a fan to demonstrate as office loads. A wifi modem is used to receive commands over the internet. The wifi module receives user commands over the internet. This information is then passed on n to the microcontroller. The microcontroller now processes this data and switches the loads through relays. Also it switches the fan as per users commands. Also it displays the status o',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 118
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Android Vehicle Tracking Application',
	'27',
	'The system tracks vehicles on an online map . The system allows the app user to track and check vehicle fuel entries , servicing data and even repair/ maintenance status. This system allows users to keep track of their vehicles provided on rent or lease to someone else. Also for tourist vehicle owners to keep track of multiple vehicles. The individual features of this application have been listed below<ul><li>It provides a fuel entry form for each vehicle in that keeps track of its fuel entries for every month.</li><li>A servicing Entry form is used to maintain the servicing data for each vehicle in per month.</li><li>Repair and maintenance Entry form for each Vehicle in allows us to track its monthly repair/maintenance status.</li><li>The vehicle tracking system Uses the drivers GPS Enabled Mobile to track the vehicle on a google maps.</li></ul><p>The report consists of following data to check vehicle performance on a bar graph:</p>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 119
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Android Based Electronic Appliance Comparison Project',
	'22',
	'Electronics shopping App allows users to check for various electronic items available and can purchase them. The project consists of list of Electronic products displayed in various models and designs. The user may browse through these products as per categories. If the user likes a product he may add it to his shopping cart. The User can view the items based on their names and Price in increasing or decreasing order.<br>This App has an Innovative Floating Cart that is available on each page, which pops up showing the Items that are currently in the cart with minimum details. The User must first register into the system and then is eligible to check out the products. The User has 3 kinds of payment method namely; Debit, Credit card or Cash on Delivery. The Front End of the App is done using Android Studio and SQL serves as a backend to store electronics lists and inventory data. The products are added by the Admin, The Admin Part use',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 120
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'IOT Liquid Level Monitoring System',
	'24',
	'This project IOT Liquid Level Monitoring system is a very innovative system which will inform the users about the level of liquid and will prevent it from overflowing. To demonstrate this the system makes use of 4 containers. For this the system uses ultrasonic sensors placed over the containers to detect the liquid level and compare it with the container’s depth. The system makes use of AVR family microcontroller, LCD screen, Wifi modem for sending data and a buzzer. The system is powered by a 12V transformer. The LCD screen is used to display the status of the level of liquid in the containers. Whereas a web page is built to show the status to the user monitoring it. The web page gives a graphical view of the containers and highlights the liquid level in color in order to show the level of liquid. The LCD screen shows the status of the liquid level. The system puts on the buzzer when the level of liquid collected crosses the set limit',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 121
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'IOT Theft Detection Using Raspberry Pi',
	'16',
	'Here we propose IOT based theft detection project using Raspberry Pi where we use image processing on live video to detect theft using motion and also highlight the area where motion occurred. This system secures offices/homes from theft by instantly detecting theft as well as allowing user to view the theft details thereby highlighting the theft details and saving the video in a usb drive.  In this system we use a camera along with raspberry pi along with a circuit with LCD display IR for night vision and USB drive for storage. The system is powered y a 12V power supply. As soon as camera motion is detected in camera footage the system uses image processing to detect exact area of motion occurrence and highlights it accordingly. The system now transmits the images of the occurance over IOT to be viewed by user online. We here use IOT Gecko to develop the online system. Also it stores the footage in a USB drive for further reference. Th',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 122
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Vehicle Number Plate Extraction Using OCR',
	'23',
	'Here we come up with an innovative system where characters are extracted from input number plate image.  We used many image preprocessing steps in order to extract only text from number plate image. Since images are more susceptible to noise and with many other unwanted objects. Noise is removed from image using effective noise removal method. Before image preprocessing steps, RGB image is converted to gray scale image and image is resized keeping aspect ratio same. Morphological processing is used   which helps to detect text more accurately.  Image is converted to double. Edge detection method is used to detect edges and image intensity level is increased.  Objects which have gaps are filled. After Edge detection , image might contain many horizontal and vertical lines. These lines should be removed from image which helps to extract only text from image. After applying these image preprocessing steps , image is left with few smaller u',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 123
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Android Joystick Application',
	'24',
	'An android based joystick application project to control pc keyboard functions through an android mobile phone.<br>This android based system is based on the concept of using an android based phone as a joystick. The software application is installed on an android phone and allows users to play games or control other pc functionality through their cell phone.<br>The application is made using Eclipse and creates a joystick with motion buttons and 4 more buttons similar to a PlayStation joystick. The application when installed and run on an android based phone shows a joystick settings screen.<br>The screen allows the user to select a keyboard key and assign its functionality to one of the buttons on the android joystick.<br>So when the user presses the joystick key, it it performs the assigned key function on the computer.<br>This app can be used to remotely control a computer or play games on it using a bluetooth connection.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 124
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Fingerprint Vehicle Starter Project',
	'18',
	'Vehicle security is an important issue these days due to the rising number of vehicle thefts. Also one more issue with vehicles is handling its keys. Keys need to be carried and misplacing keys or loosing them will cause a serious issue. Here we propose a solution to this problem by using a fingerprint authenticated vehicle starter system. The system provides a secure and hassle free way to start/stop vehicle engine.<br>User just needs to scan finger to start the car, no need to carry any key. The system only allows authorized users to start the vehicle. Users can first register into the system by scanning fingerprints. The system allows multiple users to register as authorized users. When into monitoring mode, the system checks for users to scan. On scanning, the system checks if user is authorized user and starts vehicle for authorized users only. Here we use an atmega 32 microcontroller. The fingerprint sensor is connected to the mic',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 125
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'PC Based Home Automation',
	'20',
	'Our proposed system allows user to automate his/her home appliances through simple mouse clicks. We bring the entire home automation functionality on users PC. User may operate all lights fans easily while working on his/her PC bys simply clicking on a user friendly computer application. Here we use serial communication to communicate between the PC and microcontroller based circuit. The microcontroller is used to receive and decode load switching commands sent theough PC serially and then operate loads accordingly. Our system also allows user to get status of loads current status. In this case the pc sends a status request to the microcontroller circuit and the microcontroller then retrieves the load status and sends this data serially to the PC. The PC appilcation now receives the data and displays the results to the user. Thus this system demonstrates the use of microcontroller<br>based PC home automation system.<br>Note: This projec',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 126
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Software Piracy Protection Project',
	'28',
	'This project is intended to maintain software piracy protection and assures that it is being accessed only by the authenticated users. Piracy has become so prevalent over the Internet that poses a major threat to software product companies. With the help of malicious codes and programs, hackers or an intruder can gain access to the system and steal the information. Hence there arises a need to protect the information and products from being plagiarized. This project is developed for the same purpose to protect the software’s ownership of copyright and make transactions securely.<p>The features of the project are as follows:</p><ul><li><b>Online registration: </b>Users have to first register themselves into the system.</li><li><b>Payment for buying software:</b> They have to first buy the software for accessing it via online secure payment facility available in the system.</li><li><b>Download:</b> After making payment user can now downlo',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 127
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Display Object Counter On 7 Segment Display',
	'26',
	'<p>The project is designed to monitor the counting operations in industries. For example, products moving on a conveyor belt are counted by IR interruption concept and displayed on a seven segment display.<br>There are two pair sensors, each kept at certain distance from the other. One pair of sensor consists of a transmitter and a receiver, kept exactly opposite to each other. The transmitting part emits modulated IR light which is received at the receiver end and fed to a microcontroller of 8051 family. When an object passes through the sensors then microcontroller gets interrupt signal (from IR sensors) and increments the count to displays it on 7 segments displays. Count down is also achieved if the object moves in reverse direction. This project can also be used in any public transport/trains to count the number of passengers for monitoring purpose.<br>Further the project can be enhanced by interfacing it with a warning system so t',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 128
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Attendance System Based On RFID Project',
	'26',
	'Our project consists of an RFID based attendance system that allows for automatic attendance marking by using RFID tags. Every student is provided with a unique authorization tag/card that is used to record his/her attendance.<br>A lot of time is wasted in schools and colleges for manual attendance procedures, in such cases our system provides an instant and automated attendance marking system. Every authorized student is provided with a unique RFID tag/card with his/her details fed in it. The tag consists of a built in integrated circuit that stores this data through modulating and demodulating transmitted radio frequency signals.<br>The data thus stored in this card is the unique identification of that person. As soon as the card is placed in front of the RFID reader, the data in it is read and attendance for that student is registered. This is done with the help of an 8051 microcontroller interfaced with the reader.<br>If it is a reg',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 129
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Cursor Movement By Hand Gesture Project',
	'28',
	'We all wonder it would have been so comfortable if we could control cursor through the use of hand gestures. Well our proposed project puts forward a hand gesture based system that allows user to control the pc mouse movements through the use of hand movements. Our system uses pc webcam in order to detect hand gesture movements. The system continuously scans the camera input for five finger hand like patterns. Once a hand is detected, the system then locks it as an objects. A flag is set on the object in order to mark it as an object. After the object has been flagged and detected, our system then constantly records its movements in terms of X y direction movement based coordinates. These coordinates are then mapped real time onto the mouse cursor to move it according to hand movements.<p><b><br>Our algorithm works as follows:</b></p><ul><li>Webcam video is captures using c# video capture libraries</li><li>It is broken up into continuou',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 130
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Android Graphical Information System',
	'19',
	'The purpose of developing this android application is to search the places by inputting a keyword which smartly searches for the desired location and place. This application also enables users to add the missing places on the map by just providing the details. GIS for Tourist is an Android application which enables user to manually input data of new places with their attributes such as name of the place, area, location, phone no. (If Applicable) and image of that place. If some of the user is at such a location or place which doesn’t exist on a map then user can simply add the missing place on a map and also can capture and input image file while filling up the details. After filling up all the details, the application smartly searches for the place based on details entered by user. The application is capable enough to search the place automatically. If application doesn’t retrieves any place, then application allows user to input a ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 131
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'PC Configuration Retrieval System on Online Server',
	'21',
	'Various software/gaming applications require exact PC configurations to run on them. Many of the PC users are non technical people who are unaware of their exact PC configuration. So for companies dealing in bulk software it becomes inefficient to manually interact with every customer and thus suggest then pc configurations and suggest the changes then need to do in order to run a particular application in their PC. Well here we propose a solution to this issue by aiming at a pc configuration retriever and configuration suggestion project. The system must first be instructed with various software /gaming applications minimum configuration suggestions. So now whenever a user wants to know whether a software/game will run properly in his PC he does not need to manually check it. The company website will consist of this application which can be downloaded and automatically executes without installation. It now asks the user about the softw',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 132
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Customer Behaviour Prediction Using Web Usage Mining',
	'15',
	'Web usage mining involves first recording behavior and flow of customers on a website and then mining through this data for behavioural patterns. It is an important part of ecommerce world that allows websites to go through previously recorded web traffic data. Ecommerce sites analyse this data in order to provide better performance and also suggest better products and services to customers by identifying them next time. The system is tuned to record web shopping/buying patterns and track various analytics data that tend to provide future prediction statistics. The system scans for user budget tracking, tallying to previous years, user bounce rates- number of users returning from payment page and other site usage factors. Factors like returning users allow site owners to make appropriate changes and give the customer exactly what is needed. This allows for more customer acquisition and thus more profitability. Ecommerce sites need to su',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 133
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Employee Performance Evaluation For Top Performers and Recruitment',
	'18',
	'The productivity and profitability increase of a company depends on the performance of the employees. Performance of the employee depends on ability of the employee. In existing system, employee’s behaviors are monitored by the superior so that employees can perform well in their work. This will increase the effort of the superior. Our proposed system mentions that the performance of the employee is based on personality traits of the employees. Our system will investigate personality traits from top ten best performers of the company and will use these personality traits of the employee for new hiring criteria for future hiring program to improve the employee’s performance which in return increase company’s productivity and profitability.  Our project is for the IT sector employees. Performances of the employees are evaluated for some period. From that, 10 best Performers are selected and their personality traits are evaluated and the v',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 134
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'BLDC Motor Speed Control Using Fuzzy Logic',
	'28',
	'This system accurately controls BLDC motor speed using fuzzy logic. The system uses an 8051 family microcontroller to achieve this purpose.<br>We here constantly monitor the motor speed using an IR sensor. The sensor is used to keep track of the fan motor rotation and measure its RPM.<br>The sensor is interfaced with the microcontroller and provides input to the microcontroller. The microcontroller then calculates motor speeds based on signals provided by the sensor.<br>The microcontroller is also interfaced with an LCD display to display the status of the system along with motor speed. The project uses fuzzy logic to increase and decrease PWM supply based on the fan speed monitored to keep it spinning very close to the desired speed.<br>Thus microcontroller constantly supplies PWM pulses to keep the motor running around the desired speed as per the fuzzy logic.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 135
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'An Adaptive Social Media Recommendation System',
	'20',
	'People now-a-days read news online which has become very popular as the web provides access to news articles from millions of sources around the world. News Recommendation is to select relevant news by their themes. Identifying news based on the topic is critical in this task. News is proposed solely based on the author’s point of view. In this system we immensely enhance the performance of recommendation. This can be achieved if the user interaction is better utilized. It overcomes the bias of traditional news proposal by suggesting relevant information with a balanced perspective of authors and readers. This is achieved by identifying and using the topic patterns of the original news posting and its comments, one of the most useful records of user behaviors in social media. In particular, to capture the dynamic concerns of users, hidden topic patterns are extracted by utilizing both textual and structural information of comments. Cert',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 136
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'IOT Patient Health Monitoring Project',
	'19',
	'Monitoring your beloved ones becomes a difficult task in the modern day life. Keeping track of the health status of the your patient at home is a difficult task. Specially old age patients should be periodically monitored and their loved ones need to be informed about their health status from time to time while at work. So we propose an innovative system that automated this task with ease. Our system puts forward a smart patient health tracking system that uses Sensors to track patient health and uses internet to inform their loved ones in case of any issues. Our system uses temperature as well as heartbeat sensing to keep track of patient health. The sensors are connected to a microcontroller to track the status which is in turn interfaced to an lcd display as well as wifi connection in order to transmit alerts. If system detects any abrupt changes in patient heartbeat or body temperature, the system automatically alerts the user about',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 137
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Facial Expression Recognition',
	'19',
	'Using facial expression project we can detect a persons facial expression and display weather the person is smiling, sad or shocked.<br>This software system is designed to first detect and read a persons face. The system then computes o various facial parameters of the persons face.<br>Upon  detecting and registering these parameters, the system compares these parameters with default expressions for human sadness, smile and human expressions. Based on these statistic the system concludes the persons emotional state.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 138
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Heart Attack Detection By Heart Beat Sensing',
	'24',
	'This system Heart Attack Detection by Heart Rate Monitoring Project helps to inform if a person is about to have a heart attack. This system does this by detecting the heart beat level and informs as soon as the heart beat level does not fall within the permissible limit. Thus this system can be used to save life of many people as this system alerts the doctor about the patient’s heart beat level. For this the system uses two circuits. One is the transmitting circuit which is with the patient and the other is the receiver circuit which is being supervised by the doctor or nurse. The system makes use of heart beat sensor to find out the current heart beat level and display it on the LCD screen. The transmitting circuit includes AVR family microcontroller interfaced to LCD screen and this transmitting circuit is powered by 12V transformer. Similarly, the receiving circuit includes AVR family microcontroller and RF receiver and also has a ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 139
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Mobile Attendance System Project',
	'29',
	'The mobile attendance system has been built to eliminate the time and effort wasted in taking attendances in schools and colleges. It also greatly reduces the amount of paper resources needed in attendance data management. The system is divided into following modules:',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 140
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Android Controlled Railway Level Gate Control',
	'24',
	'<p>Our project aims at a railway level crossing gate opening/closing system operated through an android application. The opening/closing of railway gate is traditionally operated through manual lever pulling method. This method leads to a lot of accidents due to the rational technique and lever jamming.<br>The system allows user to easily perform this operation through the use of a simple android based application. It operates by providing the opening and closing functionality of a railway gate by sending commands through an android application.<br>The remote controlling application is provided through an android application. This application just any android OS based device to run on. A Bluetooth device attached to the railway gate is used to receive the Bluetooth commands. These commands are then passed on to an 8051 microcontroller which then performs the required action. On receiving opening command, it drives the motors to open the',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 141
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Look Based Media Player',
	'22',
	'Usually when you are watching a video and someone calls you, you have to look somewhere else or go away from pc for some time so you miss some part of the video. Later you need to drag back the video from where you saw it. Well here is a solution to this problem. A look based media player that pauses itself when user is not looking at it. The player starts running again as soon as the user looks at it again. This is done using the camera or webcam on top of the computer. As long as the camera detects the users face looking at it, the media is played. The player pauses as soon as users face is not completely seen. The look based media player does not allow user to miss a single part of the media user is watching. The system user camera to sense if user is looking at it, the system pauses the media being played as soon as it detects user is not looking at it.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 142
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'College automation project',
	'20',
	'<strong>1. Introduction</strong><br>This section introduces Unity College website project. It also contains definitions, acronyms and abbreviations used through out the document. It will allow college to address potential students by showcasing their course and facilities and its current students and faculty by providing access to the various facilities provided by the college in an easy and interactive manner as well as it will help people in college and outside of it to know about news and events happening in college.<br><strong>1.1 Purpose</strong><br>This document specifies all functional requirements for the Unity College website project. This document will form the basis for further design and development activities on the project. The purpose of the college website is to let people know about this college, their achievements as well as to interact with potential students as well as their alumni.<br><strong>1.2 Audience</strong><b',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 143
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Vehicle Movement Street Light With Light Sensing Atmega',
	'29',
	'The main purpose Vehicle Movement Based Street Lights With External Light Sensing Using ATMEGA project is that it saves energy by putting on the lights of the system only when the system detects movement of vehicle. The system switches on the street light ahead of the vehicle and switches off the trailing lights simultaneously.<br>The movement of vehicle gets detected by sensors. The system automatically puts on the lights that are ahead of the vehicle detected and as soon as the vehicle moves ahead, the trailing lights are switched off.<br>This system is more efficient for saving a lot of energy than existing system where the street lights are kept on always unlike this system where the street lights are put on only when movement of vehicle is detected.<br>During day time these lights are dim as this system has the capability to sense external lights.<br>Thus this system senses the external light and then accordingly switches ON or OFF',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 144
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Fingerprint Based Exam Hall Authentication',
	'19',
	'Here we propose a fingerprint based examination hall authentication system. The system is designed to pass only users verified by their fingerprint scan and block non verified users. Our system consists of a fingerprint scanner connected to a microcontroller circuit. In registration mode the system allows to register upto 20 users and save their identity with respective id numbers in the system memory. After storage the person needs to first scan his finger on the scanner. The microcontroller now checks the persons fingerprint validity. If the fingerprint is authorized the microcontroller now sends a signal to a motor driver. The motor driver now operates a motor to open a gate. This ensures only authorized users are allowed to enter the examination section and un authorized users are not allowed to enter without any human intervention.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 145
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Online Mobile Recharge Portal Project',
	'27',
	'Online Mobile Recharge is a web-based application developed in ASP.NET to recharge mobile phones. The project focuses at providing an easy and reliable platform to recharge mobile of any telecommunication company through online without buying recharge card. The registered users of the system can recharge their prepaid mobile phones from anywhere at any time.The proposed project for recharging mobiles developed to automate the mobile recharging process. It roots out the manual card system of recharge and introduces a new and genuine online recharge process.The online mobile recharge system is beneficial to both the admins and users. Using the online application, the admin can add new operators, tariff plans, offers and update or modify the existing tariff plans. It helps the users in creating their account, and then recharging the mobiles phones at any time.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 146
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Student Faculty Document Sharing Android Project',
	'19',
	'This project is an online portal between students and faculty. This innovative system allows college faculty to share important data as well as notifications with engineering students. It consists of a faculty login along with student login. Since college faculty operates through pc and document uploading is simpler through a pc, the faculty login is to be performed through a computer. Faculty may upload documents of subject syllabus, timetable document, notifications, e notes etc through their provided login. The documents are uploaded by faculty to different corresponding departments. We propose to build this system on an online server that allows faculty to upload data and students may view search and download required documents through their android device. Here students only see and download data of their particular semester. Rest data is hidden. Faculty may access and upload/edit documents to any semester or add any notice as desi',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 147
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Self Balancing Robot Project',
	'26',
	'Robotics has been advancing in the recent years with the development of systems bearing more and more complicated designs and handling complicated tasks. Self Balancing Robot is one such step which promotes that a robot should be able to have locomotion using the balancing capabilities just as the humans also possess. This opens for the robots a plethora of task types which they can perform in the way humans do. The Self Balancing Robot Project consists of an Atmega328 microcontroller controlled system which with the help of its sensors mounted on the robot is able to balance the robot in upright posture. If the robot is given a jerk in forward direction to tilt it in forward direction then it will oppose that force and try to be in the balanced position as it was. Similar is the thing for force from any direction on the robot, it will always try to remain balanced. The robot also has excellent direction sense which helps it avoid any d',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 148
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Opinion Mining For Social Networking Site',
	'21',
	'This system uses opinion mining methodology in order to achieve desired functionality. Opinion Mining for Social Networking Site is a web application.  Here the user will post his views related to some subject other users will view this post and will comment on this post. The System takes comments of various users, based on the opinion, system will specify whether the posted topic is good, bad, or worst. User can change his own profile picture and can update his status. These changes can be viewed by various users. We use a database of sentiment based keywords along with positivity or negativity weight in database and then based on these sentiment keywords mined in user comment is ranked. Once the user logins to the system, user can view his own status as well as he can view the topics posted by other users. When the user clicks on a particular topic user can give his own comment about the topic. System will use database and will match ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 149
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Topic Detection Using Keyword Clustering',
	'24',
	'To find prominent topic in a collection of documents. We here propose a system to detect topic from a collection of document. We use an efficient method to discover topic in a collection of documents known as topic model. A topic model is a type of statistical model for discovering topics from collection of documents. One would expect particular words to appear in the document more or less frequently: "dog" and "bone" will appear more often in documents about dogs, "cat" and "meow" will appear in documents about cats, and "the" and "is" will appear equally in both. A document typically concerns multiple topics in different proportions; thus, in a document that is 10% about cats and 90% about dogs, there would probably be about 9 times more dog words than cat words. Our proposed system captures this intuition in a mathematical framework and will examine topic of part',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 150
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Android Controlled Notice Board Project',
	'17',
	'The project is an electronic notice board that is controlled by an android device and displays message on it. Traditionally, there were notice boards where any information or notice had to be stick daily. This becomes tedious and requires daily maintenance.<br>The project overcomes this problem by introducing an electronic display notice board interfaced to an android device through Bluetooth connectivity. The Bluetooth receives the message from the android device that is sent to a microcontroller of 8051 family. The microcontroller displays the message on a LCD screen. This project can be used in colleges, offices, railway stations or airports for displaying any information.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 151
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Advanced Mobile Store',
	'24',
	'This is an advanced mobile store that adjusts according to user choice and ensures most profitability using artificial intelligence. It provides user with an easy and beautiful GUI and shows him a list of products, once the user sees a product and goes through it, the system learns about users choices. Once the user selects a phone, the system remembers the choice for that particular user. Next time the user logs in, the system shows appropriate recommendations for that user along with other products. Once the user wants to buy a mobile phone the system also shows him some mobile covers and mobile accessories for that particular mobile so that he can add it to cart as well. The system bills the user. Billing using credit card system. After billing an email is also sent to the users registered email id. The system also has an admin account that shows when visitors visited the site, which products they saw, their bill amount and when the ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 152
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Advanced Reliable Real Estate Portal',
	'26',
	'We propose to build a real estate portal that allows users to post property for sale as well as search sort property and contact its dealers online. It also consists of an innovative feature that allows users to post reviews of the dealing process with a buyer after their deal. This allows the buyers to verify a sellers profile and view his past deal experiences from other user reviews on his profile. Every user on the portal has a profile that can be viewed by to check his past deals status.<p>A user may post bad reviews about another user he has dealt with if any payment issues are encountered during the deal. So users may now verify that particular user before dealing with him. The system consists of a user login, users may look for property as per area, Bhk, Location as well as other amenities like lift, furnished, semi-furnished etc. The system sorts property and displays results list as desired by user. Users may also post a prope',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 153
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Android Controlled Automobile',
	'21',
	'An Android controlled automobile project that allows user to control a battery powered automobile wirelessly through an android application. The system uses a bluetooth modem as a medium to transmit signals between the android based phone and automobile. The android application provides a gui to the user. The commands sent through gui are sent in the form of string variables by the android application through an active bluetooth connection. These string variables are then received by bluetooth modem and then forwarded to the Microcontroller. The microcontroller now processes the data sent by bluetooth modem and checks for user commands. On recognizing direction commands sent by user(Forward|Backward|Left|Right), the microcontroller sends signals to appropriate driver IC''s. The driver IC''s now operate motors to achieve the desired movement of the automobile as sent by microcontroller. This process is continuously repeated by ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 154
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Fully Automated Solar Grass Cutter Robot',
	'23',
	'<p>The fully automated solar grass cutter is a fully automated grass cutting robotic vehicle powered by solar energy that also avoids obstacles and is capable of fully automated grass cutting without the need of any human interaction. The system uses 6V batteries to power the vehicle movement motors as well as the grass cutter motor. We also use a solar panel to charge the battery so that there is no need of charging it externally. The grass cutter and vehicle motors are interfaced to an 8051 family microcontroller that controls the working of all the motors. It is also interfaced to an ultrasonic sensor for object detection. The microcontroller moves the vehicle motors in forward direction in case no obstacle is detected. On obstacle detection the ultrasonic sensor monitors it and the microcontroller thus stops the grass cuter motor to avoid any damage to the object/human/animal whatever it is. Microcontroller then turns the robotic as',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 155
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Remote Controlled Robotic Arm Using Rf',
	'29',
	'This system provides a robotic arm that is controlled by RF remote. The system uses 8051 microcontroller that is interfaced to the RF receiver. This RF receiver receives commands that are sent by the RF remote. Commands like up, down, open and close are sent by the RF remote which are processed. As soon as the user presses the push buttons, the commands are sent to the RF remote, which makes the arm move in the specified up or down direction or grip open or close. Thus this RF controlled robotic arm project can be used to pick any object, move it, and place it anywhere as per the need. The receiver circuit instructs the motors to move the arm as per the commands received by the RF remote.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 156
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Automatic Unauthorized Parking Detector With SMS Notification To Owner',
	'27',
	'<p>A large number of personnel are deployed to check for unauthorized parking and fine those owners. But owners evade the fine by various illegal means like bribing the personnel, threatening them etc. Towing vans need to manually search for illegally parked vehicles. This system requires large overhead costs in manpower payment, fuel and other physical surveillance. Here we propose a system that allows for automatic illegal parking detection and alerting. The system consists of integrating an RFID transmitter in every vehicle. RFID receiver circuit is mounted on every area where parking is not prohibited. If a vehicle is parked in an area where parking is not prohibited the rfid transmitter comes in rang of the receiver circuit. Once this happens the rfid reader reads the transmitter id and can instantly alert authority with area code so that authorities can directly arrive at the spot and sends an sms to the car owner about the fine i',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 157
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Opinion Mining For Comment Sentiment Analysis',
	'28',
	'Here we propose an advanced Comment Sentiment Analysis system that detects hidden sentiments in comments and rates the post accordingly. The system uses opinion mining methodology in order to achieve desired functionality. Opinion Mining for Comment Sentiment Analysis is a web application which gives review of the topic that is posted by the user. The System takes comments of various users, based on the opinion, system will specify whether the posted topic is good, bad, or worst. We use a database of sentiment based keywords along with positivity or negativity weight in database and then based on these sentiment keywords mined in user comment is ranked. Once the user logins to the system, user can view his own status as well as he can view the topics posted by the admin. When the user clicks on a particular topic user can give his own comment about the topic. System will use database and will match the comment with the keywords in datab',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 158
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Prepaid Electricity Billing Meter',
	'25',
	'Most of the energy meters are designed to bill as per the units of energy consumed. These meters need to be manually read by people in order to provide monthly/quarterly bills. We here propose a prepaid energy billing meter. The system is designed to allow amount of energy to be used as long as the account has balance pending. It also allows the operator to recharge the user account using GSM. The system first accepts account recharge and allows to use only limited units of energy as per recharge and then cuts off the supply. The prepaid electricity billing meter could be widely used to provide a new more customized electricity billing system, where users may recharge when they intend to use that facility. It also consists of a GSM modem that allows the operator to recharge the meter remotely using am SMS message. This puts forward an innovative electricity billing and “use as needed” electricity usage scheme. It also eliminates the nee',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 159
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Home Appliance Control Using Android Application Project',
	'23',
	'<p>Our project controls electrical loads by making use of an android application. The proposed system is used to control electrical loads based on the Bluetooth input signal received from the android device. It becomes difficult to keep operating electrical switches manually each time by elderly and handicapped people.<br>This system solves the issue by interfacing a unit with home appliances that switches these loads based on the input received from android device.<br>The android device may be any android based phone or tab having an android OS. The app also provided an effective GUI for providing this functionality.<br>An 8051 microcontroller is used in this system. The Bluetooth receiver is interfaced with microcontroller in order to accept the commands and then react accordingly. It operates the loads through a set of relays using a relay driver IC. Relays are used between loads and the control unit.<br>This system is to be used in ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 160
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Android Phone Theft Security With GPS Tracking',
	'21',
	'Anti Theft Mobile Security is an application which will notify you when you trigger it. This application has registration module where user can register them self using their name, phone no, email id, and password. And you will get access to web application as well as app access. If one fine day your phone gets lost then you will have to login into web application and trigger the lost phone button. And then app will take a picture first and then will send the GPS co-ordinated to the web application using which user can track the phone. And when user changes sim card the application will automatically run itself and its phone no and it is not available then sim no and send it via sms to the registered no and alt number. And this using web application user can track down the thief.  Web application will contain login form using which user can trigger the application. And it also allows user to view the location and image of the thief.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 161
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Motion Based Automatic Door Opener',
	'18',
	'Our system puts forward an automatic and precise door opening system based on human movement sensing near the door. Well opening a door in places like hotels, Shopping complexes, and offices can be a tedious task and sometimes requires hiring a person just for the sake of opening door whenever a person arrives.<br>Well this project proposes a system that allows for automatic door opening solution by sensing human presence near it. Our system achieves this functionality with the help of PIR sensors. PIR stands for passive infrared sensors. Every live body emits some infrared energy. This energy is sensed by a PIR sensor from a good distance. This signal is then processed and door is opened and closed based on this data.<br>When a living being arrives within the sensor range, it detects its presence and sends out a command that opens the door. The door then automatically closes after a specific time delay if there is no further motion nea',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 162
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Android Home Automation Using PIC',
	'17',
	'Home Automation Using Android project mainly aims at controlling electrical loads with the help of android application. The electrical loads are controlled based on Bluetooth input signal. The android device sends the input signal. It becomes too tiring to every time manually turn the switches ON/OFF. This proves to be a big problem in case of disabled or handicapped people. This system makes use of an android device which is responsible for sending input signal. The android device may be any android based phone or tab having an android OS. The app also provides an effective GUI for providing this functionality.<br>PIC microcontroller is used in this system. The Bluetooth receiver is interfaced with microcontroller in order to accept the commands and then react accordingly. It operates the loads through a set of relays using a relay driver IC. Relays are used between loads and the control unit. This system is very beneficial in case of ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 163
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Stock Market Analysis and Prediction',
	'29',
	'Our aim is to create software that analyzes previous stock data of certain companies, with help of certain parameters that affect stock value. We are going to implement these values in data mining algorithms. This will also help us to determine the values that particular stock will have in near future. We will determine the Month’s High and Low with help of data mining algorithms.<h3>Scope of the project</h3><p><b>3.1 Application of Analysis of stocks:</b></p><p><b>Stock Market </b><br> Analysis of stocks using data mining will be useful for new investors to invest in stock market based on the various factors considered by the software.<br> Stock market includes daily activities like sensex calculation, exchange of shares. The exchange provides an efficient and transparent market for trading in equity, debt instruments and derivatives.<br> Our software will be analyzing sensex based on company’s stock value. The stock values of company ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 164
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Hand Motion Controlled Robotic Arm',
	'28',
	'This system allows controlling a robotic arm by hand movements. This system uses RF receiver which is interfaced to the 8051 microcontroller which controls the driver IC which is responsible to control the movement of the arm. The transmitter circuit consists of an accelerometer sensor which is interfaced to the atmega microcontroller. The transmitter circuit sends commands to the receiver circuit. This commands indicates whether to move the robotic arm in upward or downward direction or whether the commands indicates to grip an object or release it.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 165
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Mobile Charging On Coin Insertion',
	'16',
	'This is the smart coin based mobile charging system that charges your mobile for particular amount of time on inserting a coin. The system is to be used by shop owners, public places like railway stations to provide mobile charging facility. So the system consists of a coin recognition module that recognizes valid coins and then signals the microcontroller for further action. If a valid coin is found it signals the microcontroller and microcontroller then starts the mobile charging mechanism providing a 5V supply through a power supply section to the mobile phone, now system also needs to monitor the amount of charging to be provided. So the microcontroller starts a reverse countdown timer to display the charging time for that mobile phone. Now if the user inserts another coin in that time, the microcontroller adds the time to currently remaining charging time and starts the reverse countdown. So the system can be used for smart mobile ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 166
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Audio Frequency Generator and Response Analyzer',
	'28',
	'Audio amplifiers have been widely used nowadays to amplify the power output in audio playback devices. A good amplifier will amplify the original sound to a certain greater level and still maintain the quality of the sound that comes out of the speaker. However, a not so good amplifier would interfere with the quality of the sound and thus the output of the speaker will be distorted. The aim of this project is to test the Audio Amplifiers in the audible range of frequencies and test its output response through a Matlab interface which also plots its Amplitude vs Frequency graph (Bode plot). Depending upon the visual analysis of the graph then the user can decide if the amplifier is good to use or not.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 167
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Data Mining For Improved Customer Relationship Management',
	'18',
	'In this project, system will find customer interest on products and based on this result system will provide customer’s best or nearest interest products to marketing or sales department. So that they can create offers and schemes as per customer interest. Enterprise resource planning (ERP) contains many modules among which customer relationship management deals with marketing and attracting customers. In Existing ERP System, generally sales representatives contacts their customers and pleases them with best offers to increase sales, but contacting customers on random will result in more efforts with no guaranteed revenue. Our proposed work is focused on this scenario. Proposed algorithm calculates interest rate of customers on given product based on orders they had placed in past. Proposed algorithm does analysis of products customers has purchased before and based on that generates result containing percentage rate of customer interes',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 168
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'3d Space Wireless Power Transferring Project',
	'22',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 169
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Webpage Ranking Search Engine With Seo Suggester',
	'15',
	'A search engine is an information retrieval system that has various website data stored in it. It shows user appropriate results on search. It also consists of website data. The search engine records no of times the url was clicked on, its goes to te web url to fetch its meta data and gives points according to page errors. An seo suggester used with it allows user to enter a live url. Our system goes and scans the webpages extracts its meta features and provides seo suggestions. The search engine is first fed with URLs of various website and stores this data in its database. After that the search engine allows user to search for particular data. The user can enter the data or text lines (query) to be searched. The system then uses this text and matches it with the content provided in the URLs fed in the database. The user query is matched with these contents and finally it generates a list of related URLs. The user can them click on the',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 170
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'A neuro-fuzzy agent based group decision HR system for candidate ranking',
	'25',
	'Human Resource or HR includes people who select expert workforce of an organization or business sector. Human Resources have to play number of roles in order to select expert candidate for particular designation. The first role of the human resource is to shortlist the resume of various candidates who had applied for particular job position. To select applicant and ranking each applicant for particular job roles within human resource (HR) systems involve high levels of uncertainty. This is due to the varying opinions and preferences of the different occupation domain experts in the decision making process. Hence, this system will enable HR departments to determine the most important requirement criteria (experience, skills etc) for a given job, based on the preferences of different domain experts, while ensuring that the expert’s decisions are unbiased and correctly weighted according to their knowledge and experience. This will enable ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 171
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'E Commerce Product Rating Based On Customer Review Mining',
	'16',
	'There are many users who purchase products through E-commerce websites. Through online shopping many E-commerce enterprises were unable to know whether the customers are satisfied by the services provided by the firm. This boosts us to develop a system where various customers give reviews about the product and online shopping services, which in turn help the E-commerce enterprises and manufacturers to get customer opinion to improve service and merchandise through mining customer reviews. An algorithm could be used   to track and manage customer reviews, through mining topics and sentiment orientation from online customer reviews.  In this system user will view various products and can purchase products online. Customer gives review about the merchandise and online shopping services. Certain keywords mentioned in the customer review will be mined and will be matched with the keywords which are already exist in the database based on the ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 172
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Online Election System Project',
	'15',
	'Online Election System would have Candidate registration, document verification, auto-generated User ID and pass for candidate and Voters. Admin Login which will be handled by Election Commission .Candidate Login which will be handled By Candidate, Voters will get Unique ID and Password, Using which they can vote for a Candidate only once per Election. The project is beneficial for Election Commission, Voters as the can get to know the candidate background and choose wisely, and even for Candidate. The software system allows the Candidate to login in to their profiles and upload all their details including their previous milestone onto the system. The admin can check each Candidate details and verify the documents, only after verifying Candidate’s ID and Password will be generated, and can remove faulty accounts. The software system allows Voters to view a list of Candidates in their area. The admin has overall rights over the system an',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 173
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'Three Level Password Authentication System',
	'17',
	'The project is an authentication system that validates user for accessing the system only when they have input correct password. The project involves three levels of user authentication. There are varieties of password systems available, many of which have failed due to bot attacks while few have sustained it but to a limit. In short, almost all the passwords available today can be broken to a limit. Hence this project is aimed to achieve the highest security in authenticating users.<br>It contains three logins having three different kinds of password system. The password difficulty increases with each level. Users have to input correct password for successful login. Users would be given privilege to set passwords according to their wish. The project comprises of text password i.e. pass phrase, image based segmentation password and graphical password for the three levels respectively. This way there would be negligible chances of bot or',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 174
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'TV Remote Controlled Robotic Vehicle Project',
	'15',
	'The project proposes a robotic vehicle whose movement is controlled through a TV remote. An IR receiver fitted on the robotic vehicle is used to sense the transmitted IR signals from TV remote. The data is then passed on to the robotic system to perform required actions.<br>The transmitter is the TV remote used to transmit IR rays. At the receiving end an IR receiver fitted on the robotic vehicle captures the signals. The commands received by the receiver are used to move the vehicle left right back and forward.<br>The data sent through IR remote is nothing but RC5 coded signal data. The IR receiver interfaced to microcontroller receives this data is fed to the microcontroller which reads the RC5 code in order to generate required output.<br>The microcontroller is connected to motors through a driver IC. So that the microcontroller, on receiving IR input instructs the driver IC to drive motors accordingly. The system can later be enhanc',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 175
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Fingerprint Authenticated Device Switcher',
	'21',
	'User Based Device control using fingerprint sensing. We come across areas where we need to switch no device for a particular user as soon as he enters. The device could be his Pc, fan, lights etc. For this purpose we suggest a fingerprint based device switcher project. The system switches on device for a particular user automatically on sensing him through his fingerprint scan. For this we use a fingerprint scanner interfaced to a microcontroller based circuit. As soon as a person enters he/she is allowed to scan his/her finger on the scanner. On scanning the data is sent to the microcontroller, based on this data the scanned copy is now verified for authentication. If the user is verified the microcontroller switches on a device (light) to indicate as the users verification.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 176
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Fingerprint Based Security System',
	'28',
	'Here we demonstrate fingerprint based security system to authenticate users from entering particular premises.<br>The system is useful for secure sites to provide access only to authorized users automatically. This ensures safety and security at secure sites/premises like military, navy, government as well as corporate premises.<br>For this purpose we here use a Atmega 32 microcontroller circuit. The circuit consists of atmega microcontroller that is interfaced to fingerprint sensor, LCD display and motors to operate a door.<br>Users are allowed to register into the system first. After registration/enrollment the system allows to start monitoring.<br>In monitoring mode, the system monitors for fingerprints. Now if a fingerprint is detected, the system scans the fingerprint against stored ones.<br>If a match is found, the system operates the motors to open the door for those users, else the system does not open the door.<br>Thus we ensur',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 177
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Voice Based Notice Board Using Android',
	'29',
	'We come across situations where we need to urgently need to display notices on a screen. For areas like railway stations and other such busy facilities the station master/announcer need not have to type in every announcement message manually on the screen. So here we propose an innovative android based notice display system that allows the user to display notices without typing them in manually. Here the announcer/administrator may speak out the message through his/her android phone, the message is then transferred wirelessly and displayed on the screen. To demonstrate this concept we here use an an LCD screen to display messages. The LCD is interfaced with an 8051 family microcontroller. We also use a Bluetooth receiver to get the android transmitted messages, decode them and send them to the microcontroller for further processing. The microcontroller then displays the message on the LCD screen. The entire circuit is powered by a 12 V ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 178
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Video Surveillance Project',
	'16',
	'This is an innovative approach to video surveillance software project. We normally find video camera''s in banks and other organization that continuously record and save the recorded video footage for days or months. This utilizes a lot of battery life and storage capacity to store these large video footage. Well this video surveillance software is an enhanced version of organization security that continuously monitors but only records unusual changes in the organization. These unusual changes may include theft detection or fire detection in offices. It may also include rodent detection in bakeries or restaurants after closing. As soon as the system catches any unusual activity it takes steps and informs the user by:<br>1. Sending an sms to the user about an unusual activity.<br>2. Sending an image of the activity to the users Email so that he may check the problem seriousness and react accordingly.<br>The main advantage of the sys',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 179
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'Vehicle Theft Alert and Engine Lock System Using PIC',
	'19',
	'Vehicle Theft Detection/Notification With Remote Engine Locking mainly aims to reduce vehicle theft  to a great extent. Today vehicles are being stolen on a large number and this is the reason why this system is being introduced. To prevent the theif from stealing vehicle, this system detects if the vehicle is in theft mode and if the status is in theft mode, this system sends SMS to the user. After which the user is supposed to send back the message. This message gives command to the vehicle to lock the engine. Whenever a person tries to steal a vehicle, the PIC microcontroller is being interrupted. After which the GSM modem is responsible to send SMS to the user indicating that his vehicle is being stolen. The next step is that the user is then required to send back a message indicating to lock the engine of the vehicle so as to stop it from being stolen. The microcontroller uses a mechanism to stop the engine. In order to indicate ve',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 180
	TO_DATE('14-10-16', 'DD-MM-YY'),
	'Energy Meter Monitoring Over IOT',
	'19',
	'Monitoring and keeping tracking of your electricity consumption for verification is a tedious task today since you need to go to meter reading room and take down readings. Well it is important to know if you are charged accordingly so the need is quite certain.<br>Well we automate the system by allowing users to monitor energy meter readings over the internet. Our proposed system uses energy meter with microcontroller system to monitor energy usage using a meter.<br>The meter is used to monitor units consumed and transmit the units as well as cost charged over the internet using wifi connection.<br>This allows user to easily check the energy usage along with the cost charged online using a simple web application. Thus the energy meter monitoring system allows user to effectively monitor electricity meter readings and check the billing online with ease.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 181
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Medical Search Engine Project',
	'26',
	'Version 1: J2ME Mobile app<br>Version 2: HTML5, JqueryMobile based Mobile web app (Works On Android phones, iOS devices, Windows and also for Blackberry phones)',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 182
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'SMS Controlled Railway Level Gate Control With Programmable Numbers',
	'28',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 183
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'RFID Attendance System With SMS Notification',
	'20',
	'Here we have an automated RFID based attendance system with SMS notification to parents. This system automates the attendance system by checking attendance using rfid cards as well as informs parents when student enters and leaves the academic premises. In this system we use RID tagging cards to demonstrate as user I cards. We use a microcontroller based circuit with RFID reader, LCD display, buzzer and GSM modem. The system is powered by a 12V power supply. When user scans a card on the rfid reader, the system recognizes the student and check is it is a valid student card. If the student is valid, system marks attendance and also sends an SMS notification to the parents of the students about student. Thus the parents are alerted when student enters or exits the premises. The rfid reader is interfaced to the microcontroller. The microcontroller constantly checks the reader for any id scanned. Whenever a card is scanned, the system provi',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 184
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Bus Pass Android Project',
	'27',
	'A bus pass project is an android application system that helps passengers to get their bus pass related information in an android phone. Using the system users can apply for bus pass renewal option or cancellation option and make payment online. This excludes the need for going to bus station for utilizing pass services. Also the app provides a brief description of all the routes along with bus numbers. It also shows appropriate schemes for various routes for quarterly, monthly and yearly passes. Admin can view user’s details and all the transactions being made online. Thus the system is user-friendly and flexible to be used.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 185
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Automated Attendance System',
	'27',
	'An automated attendance system that consists of a web system for entire organization to record attendance. Each Class room or department has its own login. On login the class faculty can see a list of students or members registered under it. The faculty may take the attendance and mark the present students using checkbox provided in front of every student name. This attendance sheet is stored and sent to the central administrator of the organization and stored there. The system has an admin login. The admin may check all attendance data, press a button to see defaulter list, search for particular student attendance by name, search class attendance and generate excel reports.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 186
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Remote Java 2 Dotnet Communication Application',
	'29',
	'Java and dot net are two different but very useful technology when it comes to information technology. Both of them have different development platforms. Well for a study and integration of two major technologies together we propose a client server based communication application made by integrating JAVA with dotnet technology. Here we propose a dedicated client server based architecture that allows for chat as well as authoritative commands by the server over client application. We integrate the two technology and have a working communication between these two technologies. We here propose to build the server application using JAVA and the client side application using Dotnet(C#) technology. Our system consists of the server as an authorities admin and client as a client application in Dotnet. The server has the right to start chat, enable disable client application as well as record the client pc screen as and when needed. Thus we int',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 187
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'CNG/LPG Gas Accident Prevention With Gsm Alert',
	'26',
	'<p>Gas leakage tragedies and accidents have lead to heavy losses over the years. So it is very important to detect any gas leakage and prevent any accidents. So we here propose a system to detect LPG/CNG gas leakage scenarios and provide a security alert to intended users. We here propose to build the system using a MQ6 gas detection sensor and interface it with Avr family microcontroller along with gsm modem for alerting through buzzer. Our system uses the gas sensor to detect any gas leakages. The gas sensor sends out a signal to microcontroller as soon as it encounters a gas leakage. The microcontroller processes this signal and sends out a signal buzzer and LCD with required message details. </p>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 188
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Android Controlled Spy Robot With Night Vision Camera',
	'26',
	'Our project aims to provide a robotic vehicle equipped with a wireless camera having night vision capability for remote monitoring/spying purposes. The night vision camera allows for transmitting real time night vision video even in dark environments. Whatever is recorded by the camera can be viewed in PC for reference.<br>This system is to be useful in war, terrorism and sensitive areas. It can also be used to operate in jungles and other environments humans cannot possibly enter during the night.<br>The vehicle can be controlled remotely by an android device for easy operation. It uses android application commands to move in front, back and left right directions. The vehicle consists of receivers interfaced to an 8051 microcontroller. On receiving command from the receiver. The 8051 microcontroller now operates the movement motor through a driver IC.<br>The robotic vehicle can be easily operated from any android device. It provides a ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 189
	TO_DATE('18-10-16', 'DD-MM-YY'),
	'Social Network Privacy Using Two Tales Of Privacy Algorithm',
	'29',
	'Privacy is very important in online social networks as a lot of critical information is being exchanged over the network. So there is a need for security in such applications. Thus this application adds a level of security by using encryption technique (AES-Advanced Encryption Standard) to ensure that the data is not readable over the network and this application also includes privacy settings to specify what should be accessed by whom. The system takes the password while the user registers and encrypts it using AES algorithm and stores in the database. When the user tries to log in into the system, the system fetches the password of the user Id specified and decrypts it using AES and if the password matches, the system allows access to the application. Privacy setting is also provided by the system which specifies which part of the profile should be accessed by who.<p><b><u>Modules</u></b></p><ul><li><b>Privacy Setting-</b> In this use',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 190
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'IOT Based Industry Automation',
	'24',
	'IOT or internet of things is a technology that deals with bringing control of physical devices over the internet. Here we propose efficient industry automation system that allows user to efficiently control industry appliances/machines over the internet. For demonstration of this system we use 3 loads as industrial appliances or machines and a motor to demonstrate as an industrial motor. Our system uses an Avr family microcontroller for processing all user commands. A wifi modem is used to connect to the internet and receive user commands. On sending commands through the internet they are first received by our wifi modem. The modem decodes information and passes it to the microcontroller for further processing. The microcontroller then switches loads and operates the motors as per receivers commands. Also it displays the system state on an LCD display. Thus we automate entire industry using online GUI for easy industry automation.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 191
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Vehicle Sensing Street Lights Project',
	'21',
	'<p>The project aims at saving energy by detecting the vehicle movement on highways and switching on the block of street light ahead of it and simultaneously switching off the trailing lights. The project requires sensors to detect the vehicle movements and switches on the lights ahead of it. As soon as the vehicle moves ahead the trailing lights automatically switches off. This can be used to save a lot of energy instead of using conventional system where the street lights are remained ON. Another mode of operation can be used where the lights are remained ON with 10% intensity and when the vehicle passes by the lights ahead of it are switched on with 100% intensity and the trailing lights revert back to 10% intensity. PWM is used for intensity control through microcontroller. The sensors sense the vehicle movements and send it to a 8051 microcontroller that initiates commands for switching the lights ON/OFF.</p>',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 192
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Gsm Based Weather Reporting (Temperature/Light/Humidity)',
	'18',
	'Here we propose a Gsm based weather sensing and reporting project. The system senses temperature, as well as light and humidity and conveys this to the user wirelessly. Our system uses temperature sensor to detect and record current temperature. It uses a light sensor in order to detect current lighting conditions. Also a humidity sensor is used to detect current humidity conditions. All this data from sensors is conveyed to the microcontroller. The microcontroller now processes this data and passes is on to a gsm modem interfaced to it. The gsm modem now encodes this data as sms message and sends this message to programmed user. Thus this puts forward a wireless gsm based weather monitoring system where the person does not need to be near the equipment to constantly monitor weather reports. The data is automatically sent to the user via a sms.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 193
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Matrimonial Portal Project',
	'22',
	'This online matrimonial site is mainly developed to let individual find their potential matches for marriage according to their priorities set. This project allows the phrase ‘Marriages are made in heaven’ to be rephrased as ‘Marriages are now made online’. This application allows to browse profiles of those who have registered themselves on this site. This allows individual to give their information such as Name, Gender, Religion, Caste, Marital status, Current salary, Occupation etc.This application also allows to upload photo of the individual registering and also allows to upload kundali picture of the individual. The person looking for marriage can register and search for a profile that matches their requirement. This application allows individual to search by gender, age, religion, caste, marital status and also allows individual to view kundali which today is at highest priority in many caste.When an individual selects a profile ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 194
	TO_DATE('13-10-16', 'DD-MM-YY'),
	'Automated Door Opener With Lighting Control Using Raspberry Pi',
	'21',
	'We here propose a system that uses raspberry pi along with passive IR sensors, motors and lights to demonstrate an automated door opening and lighting control system. Proposed system allows for automated door opening using human detection with lighting control using raspberry pi. System detects human presence and then opens door automatically depending on the human sensing input detected. Also the system keeps track of lighting conditions in the room and depending on the lighting needed system switches lights to get desired illumination. Also system tries to detect number of humans present in room and then operates the lighting accordingly. All sensor data including pir as well as light illumination data is constantly transferred to the pi processor for processing which takes necessary actions as and when needed.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 195
	TO_DATE('16-10-16', 'DD-MM-YY'),
	'Movie Success Prediction Using Data Mining',
	'29',
	'In this system we have developed a mathematical model for predicting the success class such as flop, hit, super hit of the movies. For doing this we have to develop a methodology in which the historical data of each component such as actor, actress, director, music that influences the success or failure of a movie is given is due to weight age and then based on multiple thresholds calculated on the basis of descriptive statistics of dataset of each component it is given class flop, hit, super hit label. Admin will add the film crew data. Admin will add movies data of a particular film crew. Admin will add new movie data along with film crew details as well as release date of the new movie. Based on the weight age of historical data of each film crew the movie will be labeled as super hit, hit or flop. This system helps to find out whether the movie is super hit, hit, flop on the basis of historical data of  actor, actress, music directo',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 196
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Face Recognition Attendance System',
	'26',
	'The system is developed for deploying an easy and a secure way of taking down attendance. The software first captures an image of all the authorized persons and stores the information into database. The system then stores the image by mapping it into a face coordinate structure. Next time whenever the registered person enters the premises the system recognizes the person and marks his attendance along with the time. It the person arrives late than his reporting time, the system speaks a warning “you are xx minutes late! Do not repeat this.” <b>Note: </b> This system has around 40%-60% accuracy in scanning and recognizing faces.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 197
	TO_DATE('15-10-16', 'DD-MM-YY'),
	'On Demand Remote PC Monitoring system Through Internet',
	'15',
	'We usually come across areas where an admin or department / company head needs to monitor user work. This monitoring helps the authority know about any mal activity or any activity not supposed to be done in office premises is done by the employee. Remote pc monitoring needs a working internet connection that too having a high bandwidth. Well such system when monitoring on a large number of PC’s proves to have a quite reasonable load on the network. Since the system works by sending constant image snapshots of computer screen to intended authority these constant image transfers from a number of computers proves to be quite an unethical practice. So we propose an On Demand Remote PC monitoring system that monitors a PC on authority demand. The system is designed to get a snapshot of a PC’s as and when requested by admin. Moreover since online image transfers are quite heavy on the particular network we use an email server to transfer ima',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 198
	TO_DATE('17-10-16', 'DD-MM-YY'),
	'Web Content Trust Rating Prediction Using Evidence Theory',
	'24',
	'You can find number of information on web. Some information on the web can be trusted some may not. In order to find out whether particular information displayed on the web can be trusted or not, we proposed a system where web information is predicted as trustable based on the rating of various users. Here in this system user will read the information displayed on the web and will rate the information. The rating score is used as evidence, based on the ratings of various users system will predict whether the information provided on the web can be trusted or not.  This system uses user ratings to infer trust relationships between users. The rating score of the user is used as evidence to find out whether the information displayed on the web is trustable or not. Mining web user trust relationship is important in web information credibility analysis. Motivated by the imprecise nature of trustiness, we propose a novel web user trust predict',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 199
	TO_DATE('20-10-16', 'DD-MM-YY'),
	'RF Controlled Robotic Vehicle With Metal Detection Project',
	'17',
	'<p>Our project proposes a Metal detection robotic vehicle operated using Rf remote control wirelessly. The project demonstrates real life robotic vehicles used to detect land mines or other metal based objects on its path.<br>The vehicle is fitted with a metal detection system that senses metals and then alarms the user about it through a buzzing sound of land mine possibility. The system works in conjunction with an 8051 series microcontroller to achieve this operation.<br>The push buttons are used to send commands to move the vehicle forward, backward, left and right. Two motors at receiving end operate the vehicle as per the commands received. As soon as a command is sent it gets transmitted through rf transmitter. At receiving end an rf receiver reads the command and passes it to an 8051 microcontroller for processing. The microcontroller then operates the motors to move the vehicle through a motor driver IC.<br>The metal detection ',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 200
	TO_DATE('19-10-16', 'DD-MM-YY'),
	'Extended AES with Custom Configurable Encryption',
	'25',
	'Today’s world is moving fast towards virtualization and cloud, hence it becomes very important for the organizations to encrypt the critical data. This application provides this facility by enhancing the AES algorithm by adding custom encryption settings in the algorithm. Since AES has been cracked by attackers in the past. Any known algorithm has a probability of being cracked. So hence we here propose a configurable algorithm that allows user to modify the algorithm each time he encrypts text. The algorithm uses AES and adds some custom configurable steps in the system where user may modify the encryption process as needed. In this application more steps of encryption are added in order to make the data impossible to decipher by attackers.',
	'N'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 201
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Seo optimizer and suggester',
	'19',
	'The seo optimization and suggestion consists of an entire search engine for analyzing and ranking websites and also suggesting seo tips. The search engine analyzes websites and ranks them accordingly. A website grading algorithm allows the search engine to appropriately read and access the website content. It analyzes and stores analytic data for various websites. This data is used to rank the website accordingly.<p>The seo suggestion page is used to provide seo tips for a website. The suggester consists of a website box to enter the website url. Once entered, the system crawls the website analyzes its data and provides appropriate solutions for optimizing it for better seo performance.</p><p>The software project points out various drawbacks in the website and provides tips solutions for the same.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 202
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Android Expense Tracker',
	'23',
	'This application allows users to maintain a digital automated diary. Each user will be required to register on the system at registration time, the user will be provided id, which will be used to maintain the record of each unique user. Expense Tracker application which will keep a track of Income-Expense of a user on a day to day basis. This application takes Income from user and divides in daily expense allowed. If u exceed that days expense it will cut if from your income and give new daily expense allowed amount, and if that days expense is less it will add it in savings. Expense tracking application will generate report at the end of month to show Income-Expense via multiple graphs. It will let you add the savings amount which you had saved for some particular Festivals or day like Birthday or Anniversary.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 203
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Dam Operation Based On Water Level',
	'20',
	'We here propose an automatic dam water level monitor and controller system. Our proposed project uses sensors to sense the water level and then opens the dam gate (motor used to demonstrate as dam gate) according to the water level. Our system uses multiple water level sensors (float sensors) for this purposes. The sensors are mounted at three different levels in order to check water level and provide signals accordingly. When water reaches first sensor it is sensed by it and displayed. When water reaches second sensor it provides a signal to the microcontroller and it opens the dam gate partially. As soon as the water level reaches the third sensor, it signals the microcontroller and the microcontroller then signals the motor to run, which is demonstrated as opening the dam gate fully. Thus our proposed system allows for automatic dam gate opening based on water level sensing.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 204
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Automating Homes Using RF',
	'21',
	'The project RF based home automation system is developed to automate the use of conventional lighting mechanism (wall switches) in house by using RF controlled remote. The project requires a RF remote that is interfaced to microcontroller (of 8051 family) on transmitter side which sends ON/OFF signals to the receiver. Receivers are connected with loads that can be turned ON/OFF by operating remote switches on transmitter wirelessly. Here the loads are interfaced to microcontroller by utilizing opto-isolators and triacs. Thus the system serves a convenient way of lighting up the house without any physical movements.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 205
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Fully Automated Solar Grass Cutter',
	'29',
	'<p>The fully automated solar grass cutter is a fully automated grass cutting robotic vehicle powered by solar energy that also avoids obstacles and is capable of fully automated grass cutting without the need of any human interaction. The system uses 6V batteries to power the vehicle movement motors as well as the grass cutter motor. We also use a solar panel to charge the battery so that there is no need of charging it externally. The grass cutter and vehicle motors are interfaced to an 8051 family microcontroller that controls the working of all the motors. It is also interfaced to an ultrasonic sensor for object detection. The microcontroller moves the vehicle motors in forward direction in case no obstacle is detected. On obstacle detection the ultrasonic sensor monitors it and the microcontroller thus stops the grass cuter motor to avoid any damage to the object/human/animal whatever it is. Microcontroller then turns the robotic as',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 206
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Android Based Universal Ticketing Project',
	'29',
	'We need ticket in order to travel by train or bus. Either to get ticket or to make pass for particular period we have to wait in long queues. This will increase our time of journey. This will also lead to miss those buses and trains which we decided to travel. This system will increase paper work. There are more chances of losing the ticket which will end up with hectic situation. To overcome these  issues we proposed a system where user can book bus or train ticket via android phones.  User can even book passes for bus and train. There is another module which is included in this system where ticket collector or user can check the validity of ticket. By entering the user’s id and ticket id. Ticket collector can check the validity of the ticket. After ticket booking user will get unique id through which ticket collector can check the ticket. User have to register by filling up the details. After registration he will get unique id which i',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 207
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Voice Controlled Robotic Vehicle',
	'26',
	'This project Voice Controlled Robotic Vehicle helps to control robot through voice commands received via android application. The integration of control unit with Bluetooth device is done to capture and read the voice commands. The robotic vehicle then operates as per the command received via android application. For this 8051 microcontroller is integrated in the system which makes it possible to operate the vehicle via android application.<br>The controlling device may be any android based Smartphone/tab etc having an android OS. The android controlling system provides a good interactive GUI that makes it easy for the user to control the vehicle. The transmitter uses an android application required for transmitting the data.<br>The receiver end reads these commands and interprets them into controlling the robotic vehicle.<br>The android device sends commands to move the vehicle in forward, backward, right and left directions.<br>After ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 208
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Secure Fingerprint Bank Locker With Image Capture',
	'23',
	'As today fingerprint based system provides high accuracy in terms of security. Also there is a high demand for integration of fingerprint matching techniques for making secure authentication systems. Therefore we have introduced this bank locker system which integrates fingerprint reader in it so as to provide a good level of security. The main goal of fingerprint bank locker with image capture project is to provide security with no manual security flaws. It is easy to use and requires no special training or equipment. This system needs fingerprint authentication while operating the bank locker as well as captures the images of person who is handling the locker and saves it in memory card which can be later viewed with card reader to the bank authorized person. The functionality of system is that it will scan the fingerprint and if it matches with registered fingerprint the bank locker opens and also captures the image of user. The syst',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 209
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Object Tracker Based on Color',
	'28',
	'Here we come up with Color Based Object Tracking system where object is tracked based on RGB colors.  Here we track objects in real time and we apply some preprocessing steps on each video frame in order to track RGB colored objects. To detect colored object we subtract RGB color components from the grayscale image and remove undesirable noise from image. To remove noise from image we had used filter. To detect objects accurately system removes all unwanted objects. Than we convert the grayscale image to binary image. We used blob analysis methodology to detect the RGB colored objects. Finally,  System will display RGB colored Object in rectangular box using bounding box methodology. This system tracks all red, blue, and green colored objects and draws a bounding box around them. This system can be used for tracking various colored objects.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 210
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'IR Based Obstacle Detection For Load Switching Project',
	'20',
	'The system attempts to actuate a load based system as soon as Infrared Rays collide with an object. In industries this system is used to take up an action as soon as an object is encountered on the conveyor belt.<br>The system uses an IR receiver that receives an Infrared signal that is generated using an IR diode. These IR sensors are interfaced to a microcontroller of the 8051 family. The IR transmitter constantly transfers rays to the IR receiver which in turn constantly sends output to the microcontroller.<br>The microcontroller is then used to read the signal as soon as an object is encountered and then actuate the load. Here a simple lamp is used to demonstrate as a load. The lamp is actuated by microcontroller through a relay. As soon as the microcontroller receives the IR receiver signal, it switches on the relay which then turns on the lamp.<br>This system can be improved further where we may add object counting facility on som',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 211
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'System To Measure Solar Power',
	'22',
	'The designed project measures different solar cell parameters like light intensity, voltage, current and temperature by using multiple sensor data acquisition. The project uses a solar panel to monitor sunlight and a 8051 family microcontroller. The project requires an LDR sensor for measuring light intensity, a voltage divider to measure voltage and a temperature sensor to measure the temperature. These measurements are then displayed by the microcontroller to a LCD screen. Thus this system allows user to effectively monitor solar parameters using this system.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 212
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Speech Detector Robotic Vehicle Control',
	'18',
	'Our proposed project aims at a robotic vehicle operated by human speech commands. The system operates with the use of a android device which transmits voice commands to an 8051 microcontroller to achieve this functionality.<br>The transmitter consists of the android phone bluetooth device. The voice commands recognized by the module are transmitted by through the Bluetooth transmitter.  These commands are detected by the robotic vehicle in order to move it in left, right, backwards and front directions.<br>The bluetooth receiver mounted on top of the vehicle is used to recognize the transmitted commands and decode them. After decoding these commands are passed on to the 8051 microcontroller.<br>The microcontroller then drives the vehicle motors to move it accordingly. This is done with the use of a driver IC used to control the motor movements.<br>The Bluetooth technology used to transmit and receive data allows for remotely operating t',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 213
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'Android Merchant Application Using Qr',
	'28',
	'1) Consumer visit merchant flash his qr code which is generated in consumer app, merchant can scan qr code to validate with database,if consumer is registered then it shows consumer balance,if not den shows error message of insufficient balance or consumer is not registered with these merchant or no such consumer in other cases.<br>2) If user is registered then the dashboard is filled with consumer balance,and 1 input text field appears to input amount if consumer want to recharge in account through those coupon or if he wants to do transaction. After transaction consumer get details about his transaction on registered email id.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 214
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Student College Smart Card',
	'23',
	'This project is developed to ease the work of students. The project involves a card which contains a barcode which is nothing but a unique card that is assigned to the student. This card can be refilled as and when required by the student with the help of admin. This card is useful for the student in places like library, canteen and stationary shops. When the card is inserted the unique id stored is scanned and accordingly cash is deducted from the student’s account. This card can be used to submit important documents that will be needed by the student for any of its work. This is done by scanning the unique id stored in the card which is the sent to the server where the student’s document is stored and is directly sent from the server wherever needed. Thus the user doesn’t have to carry its documents always. The student can use this card in library to pay fine and the amount of fine will be calculated depending on the information store',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 215
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Wall Crack Detection Using Matlab',
	'21',
	'Here we introduce a system which detects crack on wall by using image processing. As image is susceptible to noise we used some image preprocessing steps to detect crack more accurately. System works on most  image formats. System mostly focuses on intensity value. This is done for sake of accuracy. System removes all undesirable noise. To detect crack,  image is binarized and holes are filled so that image is more clearer to detect cracks. All small insignificant blobs are removed. Using blob analysis methodology,  we detect number of connected objects. Based on the connected components system detects whether image contains crack or not. System is able to detect deeper as well as minor cracks. System uses many image processing steps to detect the cracks. Once the crack is detected by the system, System applies bounding box technology to display the crack to user. Thus , this is an innovative approach to detect crack on wall. We used im',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 216
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Vehicle Movement Based Street Lights With External Light Sensing',
	'22',
	'The main aim of this project is that it saves energy by putting on the lights of the system only when the system detects movement of vehicle. The system switches on the street light ahead of the vehicle and switches off the trailing lights simultaneously. In order to detect movement of vehicles, sensors are used. The system automatically puts on the lights that are ahead of the vehicle detected and as soon as the vehicle moves ahead, the trailing lights are switched off. This is better than the existing system where the street lights are kept on always unlike this system where the street lights are put on only when movement of vehicle is detected which helps in saving lot of energy. During day time these lights are dim as this system has the capability to sense external lights. Thus this system senses the external light and then accordingly switches ON or OFF the street lights. It uses PWM to control the intensity through microcontrolle',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 217
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Smart Health Prediction Using Data Mining',
	'29',
	'It might have happened so many times that you or someone yours need doctors help immediately, but they are not available due to some reason. The Health Prediction system is an end user support and online consultation project. Here we propose a system that allows users to get instant guidance on their health issues through an intelligent health care system online. The system is fed with various symptoms and the disease/illness associated with those systems. The system allows user to share their symptoms and issues. It then processes users symptoms to check for various illness that could be associated with it. Here we use some intelligent data mining techniques to guess the most accurate illness that could be associated with patient’s symptoms. If the system is not able to provide suitable results, it informs the user about the type of disease or disorder it feels user’s symptoms are associated with. If users symptoms do not exactly match',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 218
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Android Based Vehicle Tracking Project',
	'21',
	'A vehicle servicing repairing and maintenance data on an android app. The system allows the app user to track and check vehicle fuel entry , servicing data and even repair/ maintenance status on his android phone.<br> The individual features of this application have been listed below<ul><li>It provides a fuel entry form for each vehicle in that keeps track of its fuel entries for every month.</li><li>A servicing Entry form is used to maintain the servicing data for each vehicle in per month.</li><li>Repair and maintenance Entry form for each Vehicle in allows us to track its monthly repair/maintenance status.</li><li>The vehicle tracking system Uses GPS Enabled Mobile to track the vehicle on a google map.</li></ul><p>The report consists of following data to check vehicle performance on a bar graph:</p><ul><li>Fuel report data.</li><li>Servicing report data.</li><li>Repair and maintenance report.</li></ul>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 219
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Auto Light Intensity Controller By External Light Sense Using PIC',
	'15',
	'Automatic Light Intensity Controller By External Light Sensing project mainly aims at saving energy. The system does this by introducing LED lights with changeable intensity option. Thus the system avoids the use of expensive highway lights which consumes a lot of energy. Thus to save energy, this system allows users to change the intensity of the LED’s (Light Emitting Diodes) as per the need. The programmable instructions to control the intensity by producing pulse width modulated signals which drives a MOSFET to switch LEDs to achieve required results are fed into the PIC microcontroller. This system also has the capability to sense external lights and accordingly adjust the intensity of the LED''s using PWM. Thus when the external light is low, the system automatically increases the intensity of the LED lights and if the external light is high, the ststem automaticall decreases the intensity of the LED lights. Thus by adjusting ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 220
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Closed Loop DC Motor Control To Run It At Exact Speed',
	'27',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 221
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Advanced Military Spying and Bomb Disposal Robot',
	'28',
	'This system is very beneficial in areas where there is high risk for humans to enter. This system makes use of robotic arm as well as robotic vehicle which helps not only to enter an area involving high risk but also to pick whatever object it wants to. The system also includes night vision camera which will not only allow viewing whatever will be recorded in day time but also during night. The whole system is controlled via RF remote. The system sends commands to the receiving circuit mounted on the vehicle through push buttons. The receiving circuit involves 8051 microcontroller and a receiver which receives commands sent by the transmitting circuit. At first the system is set to control the movement of vehicle. In order to set the system in a mode that operates the arm. At first the user needs to press the push buttons for moving the vehicle in whichever direction it wants i.e. forward, backward, right or left direction. In order to ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 222
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Photo Viewer Android Project',
	'16',
	'Photo viewer is an android application that provides users with a facility for viewing a photo from different perspective. It allows users to examine images from many viewpoints. Users can zoom in or zoom out the photos accordingly by using an android device. Zoom in gets users a close look at the photos for selected details and zoom out used to bring photo in its original size.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 223
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'RF Controlled Robotic Vehicle',
	'17',
	'The main purpose of the project is to control a robotic vehicle. This can be achieved by using RF technology for remote operation. It uses 8051 series of microcontroller to achieve its desired operation. This system uses push buttons at the transmitting end. With the help of these push buttons, the receiver is able to receive commands. These commands that are sent are used to control the movement of the robot which gives instructions for either to move the robot forward, backward, left or right etc. The movement of the vehicle is done with the help of two motors that are interfaced to the microcontroller. The RF transmitter acts as a RF remote control. This RF remote control has the advantage of adequate range that is up to 200 meters if provided with proper antenna. The receiver is responsible for decoding and feeding it to some other microcontroller to drive DC motors via Motor driver IC to perform the necessary work.<br>Further enhan',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 224
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'IR Traffic Detection and Signal Manager Using PIC',
	'27',
	'IR Based Traffic Density Detection And Signal Adjustment project mainly aims to reduce traffic problems which is the main issue today in most of the parts of the world. Traffic problems is major in cities and also leads to pllution and a lot of fuel consumption. Today the traffic signals are based on timing mechanism which does not solves the issue of traffic much. So as to reduce this problem to greater extent, this system adjust the traffic signals based on the intensity of the traffic. Thus by adjusting the traffic signals based on the traffic density, this sytem hels to avoid fuel and time wastage. This system makes use of PIC microcontroller and an IR sensors. These IR sensors are used for line of sight object detection via which the system gets to know about the traffic density. The density is measured in three ways low, medium and high according to which the timings are allotted for signals. The timing overridden is done using Bl',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 225
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'DTMF Cell Phone Based Door Opener',
	'17',
	'<p>The main objective of this project is to unlock a garage door by a mobile phone using a unique password entered through the keypad of the phone. Opening and closing of garage doors involves human labor. In this proposed system, the opening and closing of a garage door is achieved by using a mobile phone. The owner can call to a mobile phone interfaced to the system which in turn is connected to the garage door that can open/close the door by entering the password. This method is very convenient as one doesn’t have to get down of his car to open/close the door physically.<br>This project is based on the concept of DTMF (dual tone multi - frequency). Every numeric button on the keypad of a mobile phone generates a unique frequency when pressed. These frequencies are decoded by the DTMF decoder IC at the receiving end which is fed to the microcontroller. If this decoded values (password entered by the user) matches with the passwo',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 226
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Accident Identification and alerting project',
	'15',
	'When an individual riding his/her bike, meets with an accident, there is a chance that the individual may suffer from a serious injury or expire instantaneously and there is no one around to help him. Well this system is a solution to the problem. The system acts as an accident identification system that gathers and sends this vehicle information that met with an accident, and conveys it to the nearest control room.<br>For this the user vehicle is fixed with an RF transmitter circuit that has a vibration sensor along with microcontroller, RF encoder and also fitted with an RF transmitter. Each and every control room must have an RF receiver fitted to receive the transmission. Whenever a user vehicle meets with any accident, the vibration sensor detects and gives its output. This output is then detected by the microcontroller. Now the microcontroller sends this change detection signal to an RF transmitter. The RF transmitter now intern b',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 227
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Opinion Mining For Restaurant Reviews',
	'21',
	'Here we propose an advanced Restaurant Review system that detects hidden sentiments in feedback of the customer and rates the restaurant accordingly. The system uses opinion mining methodology in order to achieve desired functionality. Opinion Mining for Restaurant Reviews is a web application which gives review of the feedback that is posted. The System takes feedback of various users, based on the opinion, system will specify whether the posted restaurant is good, bad, or worst. We use a database of sentiment based keywords along with positivity or negativity weight in database and then based on these sentiment keywords mined in user feedback is ranked. Once the user login to the system he views the restaurant and gives feedback about the restaurant. System will use database and will match the feedback with the keywords in database and will rank the feedback. The role of the admin is to post new restaurant and adds keywords in databas',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 228
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'PC Based Home Automation Using PIC',
	'23',
	'PC Based Home Automation mainly aims to automate your many of the every day task automated. The users can now control their home through PC. This system is especially very beneficial in case if the user has very important work on PC and can operate his lights/fan from PC without reaching the swithes for it. Here we use serial communication to communicate between the PC and PIC microcontroller based circuit. The  load switching commands are received and decoded by the PIC microcontroller sent theough PC serially and then operate loads accordingly. Our system also allows user to get status of loads current status. In this case the pc sends a status request to the PIC microcontroller circuit and the microcontroller then retrieves the load status . This data is then sent to the PC . Now the PC application receives the data and displays the result to the user. Thus with the help of this system, the users can now operate their light/fan switc',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 229
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'High Performance Hovercraft With Power Turning',
	'22',
	'The most common problem of most of the hovercraft projects today is that it is not that efficient in taking turns with full power. So this problem no longer exists now as we have introduced our High Performance Hovercraft with power turning project. Hovercraft is a vehicle with no wheels but still capable of moving. This is made possible with the help of air balloon which makes it possible to hover as the amount of air in the balloon determines how long the hovercraft hovers. The hovercraft can hover on both land as well as water using high powered fans and aerodynamic design. This project now makes it possible for the hovercraft to take turns with full power which was the biggest drawback in the previous hovercraft project. This project makes use of 2 motors and a propeller for floating and hovering, moving the hovercraft in different directions. In order to reduce the friction below, it makes use motors which rotate at a very high RPM',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 230
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'GPS + GSM Based Advanced Vehicle Tracking System Project',
	'27',
	'<p>The project proposes a GPS + Gsm based vehicle tracking system that tracks the vehicle and sends the data over through a sms.<br>The system includes a GPS modem that continuously tracks the vehicle location in the form of latitude and longitude. The data is then sent over to a microcontroller interfaced to a Gsm modem.<br>The microntroller acts as the controlling head of the system. It receives the data from GPS modem and constantly sends over the longitude and latitude data to user via sms through the GSM modem from time to time as per the interval limit set by user.<br>This system will help transport and travel companies keep track of their vehicles. Also receive regular status of vehicles. The system can be further improved by adding a gui for tracking as well as allowing driver to remotely stop the vehicle engine.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 231
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Image Mining Project',
	'22',
	'This software project concentrates on improved search for images. Usually we find systems that efficiently provide data mining functionality. This includes searching by comparing with text data. This text data is easy to mine since we just compare the words (alphabet combinations) to the words in our database. Well when it comes to images , most of the systems use data mining to search images based on image alt attribute or title that is the text associated to the image. Well this system searches images based on the image patterns and graphical methods, comparing images graphically to find a match between image color values. This efficient image mining system utilizes graphical pattern matching techniques and an algorithm for fast and approximate image retrieval using C#.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 232
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Exam Cell Automation System',
	'15',
	'Currently Exam cell activity mostly includes a lot of manual calculations and is mostly paper based. The project aims to bring in a centralized system that will ensure the activities in the context of an examination that can be effectively managed. This system allows students to enroll themselves into the system by registering their names or by sharing details to admin. This is done by providing their personal and all the necessary details like Name, email, examination, semester, etc. The provided details are then entered by admin into the system to create their hall tickets and also creates login id and password for them. After creating the hall ticket, the system mails the link of soft copy to every student who have registered. Students containing link in the mail can view and print the hall ticket and also can login into the system using login id and password to modify or update their details like Phone number, email-id, etc. Admin i',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 233
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'MC Based Line Follower Robot',
	'28',
	'The project consists of a robotic vehicle designed to follow a desired path. This project uses a microcontroller of the 8051 family along with an IR transmitter coupled with photo sensing pair to keep track of the path.<br>The line follower robot is used in various workshops, factories .etc where unmanned vehicles are used to follow a specific path without using tracks. Our system is used to design this line following robotic vehicle. It contains a photo sensor pair consisting of a photo diode and IR transmitter in each one. It helps the vehicle in finding its path along the line by signalling its microcontroller.<br>2 DC motors are used which are interfaced with the microcontroller through a motor driver IC.<br>The signal from sensors is fed to the microcontroller which then processes it and then drives the dc motors as programmed based on its input.<br>The system can be further improved by interfacing with ultrasonic sensors that will',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 234
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Raspberry Pi Vehicle Number Plate Recognition',
	'25',
	'Recognizing vehicle number plates is a difficult but much needed system. This is very useful for automating toll booths, automated signal breakers identification and finding out traffic rule breakers.<br>Here we propose a Raspberry Pi based vehicle number plate recognition system that automatically recognizes vehicle number plates using image processing. The system uses a camera along with LCD  display circuit interfaced to a Raspberry pi. The system constantly processes incoming camera footage to detect any trace of number plates. On sensing a number plate in front of the camera, it processes the camera input, extracts the number plate part from the image. Processes the extracted image using OCR and extracts the number plate number from it. The system then displays the extracted number on an LCD display. Thus we put forward a fully functional vehicle number plate recognition system using Raspberry Pi.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 235
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Load Control System Using DTMF',
	'17',
	'<p>The project aims at controlling various loads spread over a large area remotely by using DTMF concept. The DTMF command tone thus received from the phone causes electrical load switching. The project is useful for managing industrial, domestic or agricultural loads that extend over a large area.<br>The project requires a DTMF decoder interfaced to audio output socket of the cell phone. Whenever a button on the keypad is pressed the frequency thus generated from it is received by the decoder and it converts the frequency into its equivalent digital code. A microcontroller of 8051 family is used which is interfaced to relays through relay driver IC. The digital code is then provided to microcontroller that identifies the phone commands and initiates the relays to actuate the respective loads by turning them on and off.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 236
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Graphical Password By Image Segmentation',
	'27',
	'The project allows user to input an image as its password and only user knows what the image looks like as a whole. On receiving the image the system segments the image into an array of images and stores them accordingly. The next time user logs on to the system the segmented image is received by the system in a jumbled order. Now if user chooses the parts of image in an order so as to make the original image he sent then user is considered authentic. Else the user is not granted access. The system uses image segmentation based on coordinates. The coordinates of the segmented image allow the system to fragment the image and store it in different parts. Actually system segments the image into a grid and stores each part accordingly in order. But while logging in the image is shown as broken and in a jumbled order. At this time only the user who provided the image knows what the actual image looks like and he must the parts in horizontal ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 237
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'Intelligent PC Location Tracking System',
	'27',
	'We usually come across conditions where we need to track the location of a particular PC/Laptop. This conditions arises from security issues as well as companies need to track pc/laptop locations to check the geological location of their online customers. This data is obtained through ip address tracking. The ip addresses issued by internet providers is location dependent. Our systems need to reverse engineer  this data in order to get the city of that particular terminal.<br>We here use a live windows based application as demo ip recorder to capture the ip addresses of terminals. Then we make a reverse lookup to map those ip address into city coordinates. This helps a company to record and track it target customers by plotting them on a map. It help companies take better marketing decisions by checking the geographic spread of their software/product in various cities.<br> We here propose a system that helps get the ip address of a pc a',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 238
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'IOT Based Toll Booth Manager System',
	'19',
	'Managing multiple toll booths is a very complicated task. We here propose a smart card based toll booth system that is monitored over IOT. The Internet server maintains all the data of user accounts and also their balance. All vehicle owners would possess an rfid based card that stores their account number. Our system at toll booths will monitor the cards scanned when a car arrives at the toll booth. The system now connects to the online server to check if the card is valid and if valid what is the balance. If user balance is sufficient, the user balance is deducted online and web system sends signal back to the card scanner system that the user has been billed. On receiving this signal the system operates a motor to open the toll gate for that car. The system is controlled by a microcontroller to achieve this purpose. The microcontroller uses wifi connection to connect to the internet through which system interacts with web server to p',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 239
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Mobile(location based) Advertisement System',
	'16',
	'<strong>Additional Benifits:</strong>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 240
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Advanced Wireless Power Transfer System',
	'16',
	'<p>The project is a device to transfer power wirelessly instead of using conventional copper cables and current carrying wires. The concept of wireless power transfer was introduced by Nikolas Tesla. This power is made to be transferred within a small range only for example charging rechargeable batteries etc. For demonstration purposes we have used a fan instead of battery that operates by using wireless power. This requires an electronic circuit for conversion of AC 230V 50Hz to AC 12V, high frequency and this is then fed to a primary coil of an air core transformer. The secondary coil of the transformer develops 12V high frequency. Therefore by this way the power gets transferred through primary coil to secondary coil that are separated by certain distance around 3cm. Here the primary coil acts as transmitter and secondary coil receives the power to run a load. This project can be used to charge batteries of a pace maker and similar ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 241
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Network Based Stock Price System',
	'29',
	'We usually come across systems that require a web server to constantly track price updates. Many applications such as stock market client applications need to interact continuously with their server in order to update those prices from time to time. The system not just needs to update the price, it has to perform this task with accuracy and speed. Since stock prices keep changing every moment, it becomes to have a good communication between server and client applications. We here propose an http based class for client server communication for stock price updation. The system tends to provide a robust stock price updation system. The client system uses constant refresh functions to update the stock price every second.<p><b>The system works as follows:</b></p><ul><li>Server allows user to update stock price as and when needed or random simulator may be used.</li><li>Next the client application now needs to constantly connect to server for',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 242
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Android Tourist Guide Project',
	'24',
	'This project android tourist guide provides the tourist with city map depending on its current location entered by the android phone user. This information helps the tourists to find the desired locations to visit. Well it consists of entire details of those locations or how to reach the location as well as other emergency amenities like hospitals, institutes, bus stops etc but it provides the basic information to decide the places to visit. This project is mainly beneficial for the tourist’s having no idea about the places they want to visit. By providing a geographic based information system the tourists and people shifting to new cities can get a better guidance of the places they want to visit .This proposed application does not require any internet access and thus eliminates the disadvantage of single point failure. By making the application GIS based, it includes many advantages as the user can view the required location in map an',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 243
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Automatic Railway Train Safety System',
	'15',
	'Automatic Railway Safety System can sense the presence of fire and smoke and generate a series of alarm driven events after it. When the fire is detected it turns on a motor which is depicted in the project as breaking system or chain pulling mechanism. Thus by this the train can be stopped and the passengers and other payloads can be safeguarded thereafter. Along with breaking, the system sounds a buzzer that would alert nearby people around it so that they can be cautious about the presence of fire in the Train. Also, an SMS is sent to the Railway Authorities which will help them to take quick decisions to take control of the fire and in evacuating the Train. Hence this project offers a very robust mechanism for safety in the  Railways which works automatically with the help of microcontrollers and sensors.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 244
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Remote Controlled Automobile Using Rf',
	'24',
	'This system is mainly designed to control a robotic vehicle. For this RF technology is used in order to perform remote operation. The system makes use of 8051 microcontroller to achieve the desired operation. The transmitting circuit consists of push buttons which are used to send commands to the receiver. The commands are used to make the robot move in forward, backward, left or right direction. The system makes use of two motors that are interfaced to the 8051 microcontroller. These motors are used to control the movement of the vehicle. Here RF transmitter performs the role of RF remote control. The range of this RF remote is up to 200 meters provided the antenna is proper. It is the responsibility of the receiver to decode and feed it to some other microcontroller to drive DC motors via Motor driver IC to perform the necessary work. Further enhancement to this system can be done by integrating DTMF technology which makes it possible',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 245
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Wireless PC Communication System',
	'18',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 246
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Railway Track Fault Detection Project',
	'27',
	'Here we propose an innovative approach to detect railway track crack as this system detects crack based on image processing. Many image preprocessing steps is used to detect railway track crack. As image is prone to noise. System converts image to grayscale image and uses filtering to remove noise from image. Noise removal helps to detect crack more accurately. Image luminous level is increased and image is converted to binary image. This helps system to detect only crack and helps to remove other unwanted objects. Image once converted to binary image, holes are filled by using image processing method this helps to reject all smaller objects which are not required for crack detection.  Intensity value is used for accuracy  purpose. Blob analysis method is used to detect large blobs. System detects crack based on number of connected components. System detects crack based on number of blobs involved and mentions whether crack exist or not',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 247
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Canteen Automation System',
	'23',
	'In today’s age of fast food and take-out, many canteen have chosen to focus on quick preparation and speedy delivery of orders rather than offering a rich dining experience. Until very recently, all of these delivery orders were placed to the waiters or over the phone, but there are many disadvantages to this system, including the inconvenience of the customer needing to have a physical copy of the menu, lack of a visual confirmation that the order was placed correctly, and the necessity for the canteen to have an employee answering the phone and taking orders. What,we propose is a Canteen Automation System, which is a technique of ordering foods online applicable in any food delivery industry. The main advantage of this system is that it greatly simplifies the ordering process for both the customer and the canteen. When the customer visits the ordering webpage, they are presented with an interactive and up-to-date menu,complete with al',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 248
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Automated Payroll With GPS Tracking And Image Capture',
	'21',
	'This system is a combination of web as well as android application where the user will be using the android application and admin as well as HR will work with web application. This application is meant for field work users. The user will have this application in his android phone, when the user will login to the system his image will be captured and his GPS location will be send to the admin where admin will view image and GPS location in web application. After Login, GPS location of the employee will be tracked automatically by the system  and send to the admin after every 5 minutes .When user logout the system again the image will be captured as well as GPS location will be send to the admin. In order to keep track of the attendance as well as payroll of the field work people, this system plays a major role. The role of the admin is to add new employee by entering his personal details and admin will provide the employee with identity ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 249
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Industrial Load Switcher Based On Touch Screen',
	'24',
	'The project provides an industrial load controlling system with a touch screen input facility. Various traditional systems generate sparks, that are potentially harmful for industries having inflammable gases.<br>Such situations require us for going for  a control system that requires touch screen based switches. Users like touch screen based systems. Touch screen based system proves very convenient for controlling<br>The touch screen device is connected to a microcontroller of 8051 family. When user touches a particular part of the screen, the user touch is recognized and processed, based on this data it switches the required load On/Off. This system is convenient, comfortable and allows efficient load controlling operation.<br>The system can be later enhanced by embedding with RF technology.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 250
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'SMS Voting System Project',
	'17',
	'<p>We come across areas where we need to gather votes from a wide range of people through an SMS. This system is widely used in large scale dance, singing as well as other type of public voting competitions. Here we propose a system to handle this voting process using a microcontroller. Our system is designed to get casted votes using a gsm modem and transfer the data to a microcontroller for further processing. User casted votes are first received by the gsm modem. This data along with votes is sent to the microcontroller. The microcontroller now decodes the voting data. It considers only one vote from every unique phone number. Multiple voting is not allowed. The microcontroller counts every unique vote and displays the results of voting process on an LCD display.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 251
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'The Cibil System Project',
	'19',
	'A cibil system to keep tracks of peoples credit scores and dues. The system is similar to the real cibil system with an enhancement(Here the defaulter can view his status and can apply for improvement by good behavior). Our software system consists of admin login ,Cibil associates login and individual login. Here cibil associates are banks or companies who want to report faulty members. They may send faulty member data and this is passed on to the cibil admin. The cibil admin can view the data and approve it to be added after inspection. The system also consists of member login for which a member first needs to register. He can then check if he is listed in the black list and for what. The member may then apply for the removal along with the receipt of fine paid or other documents of proved good behavior. Thus the cibil system is a fully functional user friendly project',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 252
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Accurate Speed Control Of Electric Car Using ARM',
	'26',
	'Electric cars have already hit the roads and have marked the beginning of electric vehicle era.<br>Here we design an improved electric vehicle that is made to tackle urban traffic problems and also provide accurate speed control without gearing system. Also it is a zero emission, earth friendly vehicle. Our proposed vehicle has been designed on an android interface and demonstrates accurate speed controlling as well as easy turning functionality for electrical vehicles using four motor drive system. Here we use an android device interface to control the vehicle. The device allows the user to send commands through an android device via Bluetooth connection. The circuit system consists of a Bluetooth receiver connected to ARM cortex. The ARM is also interfaced to four motors, and uses a battery to supply 12V power supply. On receiving the commands the ARM processor processes user sent instructions. If turning instructions are found the sy',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 253
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Online Visiting Card Creation Project',
	'16',
	'Online Visiting Card Creation Project will have registration for new Users and login for Members. This software will have Admin Login which will check for new request and orders, Member Login in which they can create visiting cards from selected templates. Users may even create their own customize card design and place for order. User is allowed to choose a card design first and even the user name, company contact no and other fields to print on the card. After user finalizes the order he may proceed to payments page. This Ordered Cards will be delivered to their door steps. The Admin Login will accept request to check design, approve cards request, and create bill.<h3><b>Modules:</b></h3><p><u><br><h4>Admin</h4><p></p></u></p><ul><li>View New Order</li><li>View All Orders</li></ul><p><u><br><h4>Member </h4><p></p></u></p><ul><li>Register</li><li>Fill Information required to create card</li><li>Create Card by choosing Design (or by Uplo',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 254
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Ultrasonic Blind Walking Stick',
	'27',
	'<p>Blind stick is an innovative stick designed for visually disabled people for improved navigation. We here propose an advanced blind stick that allows visually challenged people to navigate with ease using advanced technology. The blind stick is integrated with ultrasonic sensor along with light and water sensing. Our proposed project first uses ultrasonic sensors to detect obstacles ahead using ultrasonic waves. On sensing obstacles the sensor passes this data to the microcontroller. The microcontroller then processes this data and calculates if the obstacle is close enough. If the obstacle is not that close the circuit does nothing. If the obstacle is close the microcontroller sends a signal to sound a buzzer. It also detects and sounds a different buzzer if it detects water and alerts the blind. One more feature is that it allows the blind to detect if there is light or darkness in the room. The system has one more advanced feature',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 255
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Android Sentence Framer Application',
	'29',
	'English is one of the easier languages to learn, compared to other complex languages. Learning English is useful for many reasons, but achieving true fluency takes extra dedication and determination. While you may speak excellent English, you''re not considered "fluent" until you achieve a certain fluidity in speaking and feel comfortable using expressions and idioms. To master in English sentence and fluency, we here developed a software project named Sentence Framer. The application displays various categories like food, games, breakfast, etc…from which the user can select any one of the category to display the contents of it. After selection of any one category, the application allows user to select multiple images of his choice from which the application frames a sentence and displays to the user. User can access the system directly without any login. This is how user could easily construct English sentences and als',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 256
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'Home And Industrial Safety Using Fire And Gas Detection System',
	'28',
	'<p>Gas leakages and fire outbreaks in industries as well as houses have lead to wide destruction and losses in the past. Gas leakages and fire outbreaks both spread widely and lead to even greater loss of life and property if proper action is not taken on time. So here we propose a system that detects gas as well as fire outbreaks and alert us accordingly so that proper action may be taken to control it. For this we system we use a gas sensor along with a temperature sensor interfaced to the microcontroller. The microcontroller is also in turn connected to an LCD screen and a buzzer to show the alerting part. As soon as a fire starts the rise in temperature is recorded by out temperature sensor. When temperature rises beyond a certain limit it sends a signal to the microcontroller the microcontroller processes the signal and displays the fire alert status on LCD screen and also sounds the buzzer. Now the gas monitor too constantly monit',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 257
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Internet Based Live Courier Tracking And Delivery System',
	'16',
	'Courier service providers usually have a very large network across countries. A courier goes through several places including distribution center, aeroplane, ship, road transport etc. At this time even customer is conscious about where has his package reached. The customer can track his courier through a login where he may enter this courier number and track the location status of his package. Here we propose a dedicated courier tracking system where customer may check the status and location of his courier. Here every distribution channel including centre, airport terminal, rail, road terminal has a system operated by authorized people of that particular point of distribution. Each point of distribution has its login access. On login the person needs to make an entry of a package that reaches it. This data is directly uploaded the main system that now keeps track of latest location/status of the package through an active internet conne',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 258
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Android Tour and Travel Agency Project',
	'23',
	'Our proposed project is an online tour and travel system that provides an effective solution for users to plan, manage and schedule their tour according to their requirements and demands. Often people get confused while planning for a tour. First of all they hardly know places where they can spend a good time. Further there comes money constraint. This system solves all problems of the client by providing them different packages and facility to personalize their tour.<p>The most important part of the online travel agency project is its tour packages and customization. The database consists of a list of tours and their packages. The system promises to build 3 different areas for demonstrating its functionality appropriately. Our proposed system will consist of a user registration and login module for new users to register and login to the system. The user may then view various tours available. Each tour consists of three kinds of package',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 259
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Web Filtering Software',
	'21',
	'<strong> Additional Benifits:</strong>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 260
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Image Encryption For Secure Internet Transfer',
	'26',
	'Encryption is commonly used for encryption of text as well as images. Various encryption algorithms exist for this purpose. Here we propose to build a secured image encryption algorithm that can be used to encrypt as well as send images remotely to the intended receiver. Our system can link to remote client to our software installed on remote system and connect to it for image transfer. Our system uses RSA algorithm for this purpose. User may submit his image for encryption. Our system now gets the image and converts it into hex format before being encrypted. Then we use RSA algorithm to encrypt the image for sending through the internet. User may now select the intended user from among the list of users having our software installed. Our system now send the image in an encrypted format through an active internet connection. Even if an attacker gets the file he first has to Decrypt it using proper keys which are not available to him. He',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 261
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Document checker and Corrector Project',
	'27',
	'CHECKS YOUR .DOC OR .DOCX FILES<br>IN THIS YOU CAN ATTACH FOLDER OF WORD DOCS<br>AND THEN THE BELOW CONDITIONS CAN BE CHECKED IN THOSE DOC FILES AND ERROR REPORTS CAN BE GENERATED:<br>• All the pages must be seprate files, i.e 800 pages will be 800 files.<br>• All formatting should be in inches (”).<br>• FILE : Page set up : Top-Bottom-Left-Right 0.25”and Gutter: 0.5”<br>Paper size A4, Layout: header/footer 0.7”<br>• Heading first – Heading Style 1 – Arial – 16 – Bold<br>• Heading second – Heading Style 2 – Arial – 14 – Bold and Italic.<br>• Heading third – Heading Style 3 – Arial – 13 – Bold and Italic. Use only in Header and Footer<br>• Heading position be maintain as per the image/pdf file and not justify.<br>• Heading Style Scale should be 90%.<br>• When you are using the heading style then format-font-kerning should be remove and paragraph-indention 0.1”, 0.1” and spacing should0.5”,0.5”. Line spacing should be exactly.<br>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 262
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Geo Location Guide Using RF',
	'19',
	'<p>Theme parks/ national parks as well as other huge tourist attractions need directional guides to inform user about his location I the area. To solve this issue we here propose a park guidance system using rf technology that works wirelessly to guide user about his current location. This proves as a very handy and convenient medium for guiding tourists through the park. This system proposes to replace the you are here boards mounted through such parks. Our system uses an Rf receiver circuit in order to track user. The user may carry the circuit with him. It then consists of RF transmitters placed at various locations across the park. These transmitters constantly emit rf signals. When the rf receiver circuit carried by user comes in range on an rf receiver it detects that the user is in range of that particular rf transmitter. This signals it to display the location of the user. Each location area is identified uniquely by an rf trans',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 263
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Drink and Drive Detection With Ignition Lock Project',
	'17',
	'Drink and drive is a leading cause of road accidents. Detecting drunk driving requires stopping vehicles and manually scanning drivers by using breath analyzers. Well here we propose a system that allows to detect drunk driving in the vehicle itself. Our system uses alcohol sensor with raspberry pi along with a GSM modem for sms notification and LCD display and also a motor to demonstrate as vehicle motor. Now our system constantly checks for driver alcohol content. The system first allows the user to configure admin numbers into the system.  And if the system detects driver is drunk above permissible limit, the sensor inputs trigger the processor about the issue by providing respective voltage. Now the system sends sms  notifications to both the registered users/authorities to inform about the issue. Also the system stops the motor to demonstrate as engine locking of the vehicle. Thus the system detects and prevents drunk driving in',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 264
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Detecting Data Leaks',
	'22',
	'This project addresses various data leakage problems: Consider a data sender who transfers some confidential data to some of his counterparts (third party). Some of this sensitive data gets leaked accidentally or purposely by an attacker and is downloaded on his terminal. The distributor must find the possibilities that the compromised data was from one or more of his counterparts, as opposed to having gathered by other means. So our project allows for data allocation tactics (through the counterparts) that improves the chances of identifying data leakages. These methods do not depend on various alterations of the transferred data like parity. In some of the cases, we can also insert “realistic but fake” data records into the data stream to further improve our chances of identifying unknown data leakages and also the party responsible for it.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 265
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Bone Fracture Detection System',
	'27',
	'Here we proposed an automated techniques and methods to detect fracture. X-ray images are examined manually but it is time consuming and prone to errors. As X-ray images are more suspected to noise we used many preprocessing steps to remove noise and blur from image. Thus, system is able to detect fracture more accurately. System detects fracture based on the type of fracture. Noise is removed from the image and image is transformed to clearer image so that system can easily detect fracture. We used image processing methodology to track bone. All unwanted as well as smaller objects are removed by the system. Finally based on the connected component, system detects fracture. System displays bounding box around the fracture. This system involves image preprocessing steps and fracture detection based on type of fracture. The proposed system is able to detect bone dislocation with 80% success rate and bone major fracture 60-70% accuracy and',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 266
	TO_DATE('17-02-16', 'DD-MM-YY'),
	'Accurate Room Temperature Controller Project',
	'29',
	'The main purpose of this Digital Temperature Controller is to control the temperature of any device like AC or any other electronic devices whose temperature keeps fluctuating and thus requires a constant watch on the device. The use of this system eliminates constant watching on the device by self controlling the temperature of the system.<br>Our proposed project consists of digital temperature sensors for more accurate temperature control in various industries. Our system overcomes the disadvantages of thermostat/analog systems in terms of accuracy. This system can be used in any firm or organization where it is very important to maintain precise temperatures.<br>LCD display is used to display the temperature and when the temperature exceeds the set limit, the lamp is switched off in order to control the temperature. The heater is demonstrated with the help of a lamp. After the heater is switched off, the AC is switched ON. Here AC is',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 267
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Intelligent Chat Bot',
	'28',
	'This system helps to grant artificial intelligence to your computer so computer will use its own intelligence to answer your queries. It’s different from normal data mining processes in the way that here the system continuously learns and if a query ,for which no answer is present in the system, is fired the the system handles it in a robust manner. Provides a huge set of functionality. It uses an artificial intelligence technology that allows it to act as an actual human assistant.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 268
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Bus Pass with Barcode Card scan',
	'19',
	'The project is designed to provide an effective solution of maintaining bus pass information using a barcode. The system has two logins one for user and other for admin. User can refill their account and extend the validity every time the pass expires. Admin can view all users'' details and balance through its login. Every user pass will be having a barcode that contains user information and validity of pass. Thus while travelling users just have to get their pass scanned using a scanner and conductor can view the pass validity.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 269
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Student Attendance System by Barcode Scan',
	'28',
	'The project is a system that takes down students’ attendance using barcode. Every student is provided with a card containing a unique barcode. Each barcode represents a unique id of students. Students just have to scan their cards using barcode scanner and the system notes down their attendance as per dates. System then stores all the students’ attendance records and generates defaulter list. It also generates an overall report in excel sheet for admin. Such kind of application is very useful in school as well as in college for daily attendance.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 270
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Android Based Furniture Shopping',
	'26',
	'The furniture shopping system is an android application that allows users to check out for various furniture available in the store and can even purchase them online. The system provides a categorized list of furniture products of different styles and models. Users have to login into the system for browsing each product and can then add them into their cart. After selecting the products users can make secure online payment via credit card. Thus the online furniture shopping project brings an entire furniture shop online and makes it easy for both buyer and seller to make furniture deals.Sql serves as a backend to store furniture lists and inventory data. Thus the online furniture shopping project brings an entire furniture shop online and makes it easy for both buyer and seller to make furniture deals.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 271
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Long Range Spy Robot With Obstacle Detection',
	'20',
	'This system Long Range Spy Robot with Obstacle Detection allows not only to control the robot’s movements but also to stop the robot as soon as the robot encounters an obstacle. The user of this system doesn’t have to worry about the distance in order to operate the robot. The system does this with the help of DTMF technology which allows sending data commands via a call. The user wishing to operate the robot will just have to call on the mobile phone connected to this system. This system consists of 8051 family microcontroller which is interfaced to the ultrasonic obstacle detector, spy camera and the system also uses battery. The ultrasonic obstacle detector helps to detect any obstacle that comes in the way of the robot. The robot automatically stops once it detects any obstacle and then waits for the user commands. In order to operate the system, the user has to make a call to the phone connected to this robot. The receiver phone wi',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 272
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Camera Based Surveillance System Using Raspberry Pi',
	'29',
	'Camera Based Surveillance System Using Raspberry Pi is mainly beneficial for determining crime, It monitors scenarios and activities, helpful for gathering evidences and detecting thefts instantly. The system is built to monitor home, offices and detect theft as soon as it takes place. System uses Raspberry Pi with a camera based circuit.<br>System constantly monitors camera for motion. The camera input is constantly fed to the pi processor. The camera input is constantly processed by Raspberry Pi processor for any motion. If any motion is detected, the system goes into alert mode. System now sounds alarm as well as captures images of the motion happening. These images are saved for later viewing reference. Thus the system is an efficient camera based security system. It can be further enhanced by adding a gsm modem to send an alert sms or alert over IOT for remote alarm.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 273
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'College Enquiry Chat Bot',
	'15',
	'The College bot project is built using artificial algorithms that analyses user’s queries and understand user’s message. This System is a web application which provides answer to the query of the student. Students just have to query through the bot which is used for chating. Students can chat using any format there is no specific format the user has to follow. The System uses built in artificial intelligence to answer the query. The answers are appropriate what the user queries. The User can query any college related activities through the system. The user does not have to personally go to the college for enquiry. The System analyses the question and than answers to the user. The system answers to the query as if it is answered by the person. With the help of artificial intelligence, the system answers the query asked by the students. The system replies using an effective Graphical user interface which implies that as if a real person i',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 274
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Image Encryption Using AES Algorithm',
	'26',
	'Today almost all digital services like internet communication, medical and military imaging systems, multimedia system requires reliable security in storage and transmission of digital images. Due to faster growth in multimedia technology, internet and cell phones, there is a need for security in digital images. Therefore there is a need for image encryption techniques in order to hide images from such attacks. In this system we use AES (Advanced Encryption Technique) in order to hide image. Such Encryption technique helps to avoid intrusion attacks.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 275
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Intelligent Tourist System Project',
	'28',
	'<strong>User Section:</strong><br>1) A login page will appear initially and the user has to login in order to continue<br>2) If the user is new he/she will have to fill the registration form (username, password, email, firstname, lastname, etc.) current location of the user is obtained by the use of gps.<br>3) These details will be submitted to an online database.<br>4) After logging in, the user will get a screen with 2 tabs.<br><strong>Tab 1 :</strong><br>1. it will contain a set of questionnaire which the user has to reply using radio buttons.<br>2. Based on the answer provided by the user, an intelligent tree algorithm will run and 1-3 best results will be provided from the online database<br>3.Clicking on each result will provide the user with the description of spots/locations along with the pictures. The user will also have the option to view the exact location of the spot on Google map<br><strong>Tab 2:</strong><br>1. This secti',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 276
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Automatic Light Intensity Controller By External Light Sensing',
	'18',
	'Nowadays highways are lightened by using High Intensity Lamps. The disadvantage of this High Intensity Lamps is that it consumes a lot of energy and another disadvantage of this is that the intensity cannot be varied according to the requirement. To overcome this limitation, this system “Automatic Light Intensity Controller by External Light Sensing Project” is developed. To overcome the limitations specified above, it makes use of LED’s (Light Emitting Diodes) as light source and simultaneously its intensity can be varied and controlled as per the need. The programmable instructions to control the intensity by producing pulse width modulated signals which drives a MOSFET to switch LEDs to achieve required results are fed into the 8051 family microcontroller. Our system also senses external lighting conditions to vary the light intensity. Based on external lighting conditions the intensity of inner lights is varied using PWM. So when ex',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 277
	TO_DATE('19-02-16', 'DD-MM-YY'),
	'Smart Health Consulting Android System',
	'25',
	'It might have happened so many times that you or someone yours need doctors help immediately, but they are not available due to some reason. The Health Prediction application is an end user support and online consultation project. Here we propose an android application that allows users to get instant guidance on their health issues through an intelligent health care application online. The application is fed with various symptoms and the disease/illness associated with those systems. The application allows user to share their symptoms and issues. It then processes user’s symptoms to check for various illness that could be associated with it. Here we use some intelligent data mining techniques to guess the most accurate illness that could be associated with patient’s symptoms. If the application is not able to provide suitable results, it urges users to go for blood test, x-ray, CITI scan or whichever report it feels user’s symptoms are',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 278
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Hand Gesture Recognition Project',
	'18',
	'Here we proposed a system where hand gesture is recognized using image processing.  System detects number of fingers. System detects separated fingers which are above the palm. System first detects skin color from image using filtering. Image undergoes various image preprocessing steps in order to give accurate number of fingers. System finds nearest point from contour point. System erodes the image based on the centroid point. We applied more image preprocessing steps on resultant image so that fingers appear accurately. System finally detects number of fingers and displays the count to user',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 279
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Human Speed Detection Project',
	'25',
	'The main aim of this project is to detect speed of human. Thus this system proves very beneficial in areas of sports. In order o record the speed of humans, this system uses a handheld radar gun pointing towards the person of whose speed is to be detected. In case of running race, it may be required to detect speed of the participants to take the decision or for some other reason. The proposed system calculates the speed by considering the time taken parameter to travel from start to end point. For this IR transmitter and receiver are installed on either of the road side on the set points. Calculation of the time taken by the human is done by the control unit. The speed of the human is displayed on an LCD Screen.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 280
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Soldier Health and Position Tracking System',
	'29',
	'The soldier Health and Position Tracking System allows military to track the current GPS position of soldier<br>and also checks the health status including body temperature and heartbeats of soldier.<br>The System also consists extra feature with the help of that soldier can ask for help manually or send  a distress signal to military if he is in need.<br>The GPS modem sends the latitude and longitude position with link pattern with the help of that military can track the current position of the soldier.<br>The system is very helpful for getting health status information of soldier and providing them instant help.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 281
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Android Multi Layer Pattern Locking Project',
	'19',
	'Most of the smart phone users use pattern locking application in order to lock the application which contains important information. But these pattern locking applications allows the user to open the mobile application only when the user enters the pattern at one go, user won’t be able to open the application if he overlaps the pattern. So in our system user must specify the pattern while registering. He must specify the locking pattern twice for the confirmation. When the user registered successfully, he can use the pattern to open the application by specifying the registered pattern. This application allows the user to overlap the pattern. If the pattern matches with the registered pattern user will be allowed to access the application. If the user fails to match the pattern with the one registered within 5 attempts system will display an error message. Whenever user specifies the pattern each time pattern color will be changed. Multi',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 282
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'Drunk Driving Detection With Car Ignition Locking',
	'19',
	'Drunk driving is the reason behind most of the deaths, so the Drunk Driving Detection With Car Ignition Locking Using Raspberry Pi aims to change that with automated, transparent, noninvasive alcohol safety check in vehicles. The system uses raspberry pi with alcohol sensors ,dc motor, lcd display circuit to achieve this purpose. System uses alcohol sensor with, raspberry pi with dc motor to demonstrate as vehicle engine. System constantly monitors the sensitivity of alcohol sensor for drunk driver detection. If driver is drunk, the processor instantly stops the system ignition by stopping the motor. If alcohol sensor is not giving high alcohol intensity signals, system lets engine run. The raspberry pi processor constantly processes the alcohol sensor data to check drunk driving and operates a lock on the vehicle engine accordingly.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 283
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Secure Lab Access Using Card Scanner Plus Face Recognition',
	'17',
	'Research laboratories funded by private or government organizations are of strategic importance to a country. A lot of sensitive research is carried on in such laboratories. The confidentiality of such premises is of prime importance for the benefit of the society. At such time it becomes necessary to ensure high level authentication and authorization of personnel entering such facilities. A single form of authentication/authorization is not enough for these sensitive organizations. Here we propose a system that combines two different forms of authentication techniques to ensure only authorized persons access the premises. Our system integrates biometrics with secure card to create a dual secure high end security system never implemented before. The system first checks if the persons face is registered as an authorized personnel in its database. If the face matches, the person is allowed to go to the next stage. At this stage the user n',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 284
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'PIC Based Ultrasonic Radar',
	'16',
	'Keeping watch 24*7 on prohibited areas to avoid tresspassing is a difficult task. Keeping manual help is cost effective and not reliable too for keeping a watch over a area. The PIC Based Ultrasonic Radar System solves the problem. This system detects any unauthorised human/animal in the surrounding. The system monitors the area in the range and alerts the authorities alarming the buzzer. The PIC microcontroller in the circuit which is connected to an ultrasonic sensor mounted or servo motor for monitoring, alarms the buzzer to notify the unauthorised identity on the LCD screen.The radar keeps monitoring the environment checking the ultrasonic sensor echo. As soon as an object is detected the data of detection is processed and sent to authorities with an alert of where exactly the object was detected. Hence, this system proves to be a guard 24*7 monitoring the prohibited area.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 285
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Digitally Controlled Home Automation Project',
	'17',
	'The project is a home automation system that uses DTMF connection to control the home appliances remotely. It overcomes the limitations of conventional wall switches that have to be operated by physically going near to then and switch on the button.<br>The system uses DTMF by which one can control home appliances by dialling the designated number for particular load. One can operate it from home phone or by making a call to home number from outside. The system uses DTMF technology that receives commands from phone and produces digital output which initiates relay driver to switch ON/OFF the load appliances. For this the system we use De-Multiplexer, flip flop IC, DTMF Decoder. This DTMF technology  allows the user to send commands to operate the appliances via a mobile phone and avoids the use of microcontroller. In order to use this system the user has to make a call to the mobile phone connected to this system. Once the call is receiv',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 286
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Android AI Diet Consultant',
	'18',
	'Artificial dietician project is an application with artificial intelligence about human diets. It acts as a diet consultant similar to a real dietician. This system acts in a similar way as that of a dietician. A person in order to know his/her diet plan needs to give some information to the dietician such as its body type, weight, height and working hour details. Similar way this system also provides the diet plan according to the information entered by the user. The system asks all his data from the user and processes it to provide the diet plan to the user. Thus the user does not need to visit any dietician which also saves time and the user can get the required diet plan in just a click. The project also has a login page where in the user is required to register and only then can view the availability of blood and may also donate blood if he/she wishes to. This project requires internet access and thus there is a disadvantage of ser',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 287
	TO_DATE('18-02-16', 'DD-MM-YY'),
	'Home Automation Using Touch Screen',
	'26',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 288
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'PC Control By Android Over Internet',
	'19',
	'We usually come across areas where an admin or department or company head needs to monitor user work. This monitoring helps the authority to know about any unusual activity or any activity not supposed to be done in office premises, which is done by the employee. The interface of admin dashboard is developed in android, so that to monitor the work of employee more easily and effectively. Remote pc monitoring needs a working internet connection that too having a high bandwidth. Well such system when monitoring on a large number of PC’s proves to have a quite reasonable load on the network. Since, the system works by sending constant image snapshots of computer screen when the admin request for the same using android device. These constant image transfers from client computers to admins android phone. So, we propose an On Demand Android system that monitors a PC on authority demand.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 289
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Image Encryption Using Triple DES',
	'16',
	'In today’s world almost all digital services like internet communication, medical and military imaging systems, multimedia system needs a high level security. There is a need for security level in order to safely store and transmit digital images containing critical information. This is because of the faster growth in multimedia technology, internet and cell phones. Therefore there is a need for image encryption techniques in order to hide images from such attacks. In this system we use Triple DES (Data Encryption Standard) in order to hide image. Such Encryption technique helps to avoid intrusion attacks.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 290
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Opinion Mining For Hotel Rating Through Reviews',
	'19',
	'Users share their view about product, hotel, news and topic on web in the form of reviews, blogs, comments etc.  Many users read review information given on web to take decisions such as buying products, watching movie, going to restaurant etc. Reviews contain user''s opinion about product, event or topic. It is difficult for web users to read and understand contents from large number of reviews. Important and useful information can be extracted from reviews through opinion mining and summarization process. In this project, there will be a web application where user will provide review about hotels. This review will be in sentence form. System will extract certain keywords from the sentence and will mine keywords in database and system will rate the hotels based on the reviews of various users. We presented machine learning and Sentiment Word Net based method for opinion mining from hotel reviews and sentence relevance score based ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 291
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Weather Forecasting Using Data Mining',
	'28',
	'Weather forecasting is the application of science and technology to predict the state of the atmosphere for a given location. Ancient weather forecasting methods usually relied on observed patterns of events, also termed pattern recognition. For example, it might be observed that if the sunset was particularly red, the following day often brought fair weather. However, not all of these predictions prove reliable. Here this system will predict weather based on parameters such as temperature, humidity and wind. This system is a web application with effective graphical user interface. User will login to the system using his user ID and password. User will enter current temperature; humidity and wind, System will take this parameter and will predict weather from previous data in database. The role of the admin is to add previous weather data in database, so that system will calculate weather based on these data. Weather forecasting system t',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 292
	TO_DATE('14-02-16', 'DD-MM-YY'),
	'Online Ebook Maker Project',
	'25',
	'Online E-Book Maker Project will allow users to create E-Book for free. This software will have Admin Login and Author Login. This system will allow the authors to make their E-Book without any problem and without any charge. Author will have to register if new member in the system. And existing member can Create new book or resume with old book. One Author cannot keep more than 3 incomplete Books, he has to complete 1 book atleast to start new one. Book will be created on basics of Title, Context, No of Pages in books.<p><b>Modules:</b></p><p><b><u>Admin</u></b></p><ul><li>Accept request from Author</li><li>Check Author Details</li><li>Checked for finished Books</li><li>Make E-Books</li><li>Can Process request by mailing the E-Books to authors</li></ul><p><b><u>Author</u></b></p><ul><li>Register</li><li>Fill Details</li><li>Login and Choose</li><li>New E-book or Resume Existing</li><li>Enter Context of book</li><li>Can pause e-book aft',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 293
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'Website Evaluation Using Opinion Mining',
	'28',
	'Here we propose an advanced Website Evaluation system that rates the website based on the opinion of the user. Website will be evaluated based on factors such genuineness of the website, timely delivery of the product after online transaction and support provided by the website. User will comment about the website, based on the comment system will rate the website. The system takes opinion of various users, based on the opinion; system will decide whether the website is genuine or not.  The system uses opinion mining methodology in order to achieve desired functionality. We use a database of sentiment based keywords along with positivity or negativity weight in database and then based on these sentiment keywords mined in user comment is ranked. The system contains keywords related to fraud, genuineness, timely delivery of the product and service meters in the database. Based on these factors system will rate the website.<p><b>The workin',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 294
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Wireless Surveillance Robot Controlled by PC',
	'17',
	'This project is about controlling the wireless camera mounted robot through PC using Bluetooth module at the same time to pick any light object and place it.This project is about controlling the robot using Bluetooth modem.<br>µC board will be installed on robot. Bluetooth modem is attached to the robot and TV tuner card is connected to PC. Communication will be established between robot and PC through BT modem and BT dongle. Through PC we can control the robot. We will give left, right, forward, backward, command through PC to robot via BT dongle.<br>A wireless camera will be mounted on robot and TV tuner card will be interfaced with PC.Thus the robot will send images to PC through this wireless camera.<br>User will monitor and control the robot. User can command the robot to pick any object and place the same whenever it is required. User can take this action after getting the video/image from robot.<br>GUI will b',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 295
	TO_DATE('20-02-16', 'DD-MM-YY'),
	'Online AI Shopping With M-Wallet System',
	'24',
	'An Online shop that has various products needed as per users needs. The system is built to help users in shopping and shop in their behalf. The system takes users choice and shops on their behalf. The system is proposed to be built on artificial intelligence techniques that ensure hassle free shopping experience for users. The system also includes m wallet integration. M wallet integration ensures a good mobile shopping experience. The integration of both these system allows users to just enter his choices and the system fetches the best deal for the user within no time.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 296
	TO_DATE('16-02-16', 'DD-MM-YY'),
	'Improved Honeypot Project',
	'27',
	'This honeyware project is built to solve some issues that persist in other general honeypots, such as limitations in virus scan etc. Attackers may use these issues as a medium to launch an attack on users operating on these honeypots. It further enhances the security for your web search and other web related tasks. It can detect and block various security threats. This honeyware project introduces an advanced security honeypot. Get this web based software engineering project only on NevonProjects.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 297
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Android Anti-Virus Application',
	'19',
	'1. Quarantining: Separating the affected files into a separate quarantine zone.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 298
	TO_DATE('15-02-16', 'DD-MM-YY'),
	'Question paper generator system',
	'26',
	'In this system we present a smart question paper generating system. In our system we allow administrator to input a set of questions and respective answers for option ticking. We also allow admin to provide weight age and complexity for each of these questions. After this the questions are stored in database along with their weight age. Now on question paper generating time the admin just has to select the percentage of difficulty. On this selection the system selects questions randomly in a way that their weight age makes up for 100 marks and according to difficulty that admin chooses the questions are chosen based on their complexity level. After this q paper is converted to pdf file and emailed to colleges on button click.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 299
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'AI Multi Agent Shopping System',
	'24',
	'An AI multiagent shopping system where system is fed with various product details. The system allows user to register and enter his details about a particular product. The system records all the details provided by user and checks for various items matching his search. The system comes up with a list of items best suited for user needs. The system also suggests other related items that the user may like. The system suggests these items which are likely to be bought by the user based on his previous requirements. The system handles multiple users at a time and provides accurate results.<p><b>Modules:</b></p><ul><li><b>User Registration:</b> User can register on the system and get his online account on site.</li><li><b> User Login:</b> User can login to system and check various furniture data online.</li><li><b> Multi Agent Support:</b> The multi agent guides and supports user through his entire shopping experience and sorts out products ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 300
	TO_DATE('13-02-16', 'DD-MM-YY'),
	'Sql Injection Prevention Project',
	'22',
	'<strong>Additional Benifits:</strong>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 301
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'User Web Access Records Mining For Business Intelligence',
	'25',
	'In this project we analyse how business intelligence on a website could be obtained from user’s access records instead of web logs of “hits”. User’s access records are captured by implementing a data mining algorithm on the website. User mostly browses those products in which he is interested. This system will capture user’s browsing pattern using data mining algorithm. This system is a web application where user can view various resources on the website. User will register their profile in an exchange of a password. User will get user ID and password in order to access the system. Once the user login’s to the system user will gain access to certain resources on the website.  The links to the resources on the website have been modified such that a record of information about the access would be recorded in the database when clicked. This way, data mining can be performed on a relatively clean set of access records about the users. When ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 302
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Smart Solar Grass Cutter With Lawn Coverage',
	'29',
	'The smart grass cutter system puts forth a completely automated lawn mover mechanism. The robotic vehicle is equipped with a grass cutter blade that allows for grass cutting at high RPM. The system has a smart functionality that allows it to cover the complete area of a lawn or garden by detecting corners using ultrasonic sensor and moving in a zigzag manner in order to cover the entire area. This efficient system uses a microcontroller based circuit in order to achieve this functionality. It is a battery operated system that uses 2 batteries. One battery is used to run the vehicle movement DC motors and the other one is used to power the grass cutter motor. Also the system uses a solar panel to demonstrate the charging of vehicle movement battery. The microcontroller operates the vehicle movement dc motors as well as the grass cutter at the same time as monitoring the ultrasonic sensors. The microcontroller smartly operates the dc moto',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 303
	TO_DATE('13-09-15', 'DD-MM-YY'),
	'IR Based Dish Position Controller',
	'20',
	'The proposed project aims at automatically positioning a dish to exact angle for receiving maximum signal by using a TV remote.<br>The project uses a microcontroller of 8051 family which is interfaced to two motors that causes the dish movements in horizontal and vertical direction according to the commands generated by microcontroller. By operating a TV remote, coded signals are transmitted from it to IR receiver that is interfaced to microcontroller. IR receiver decodes the data (signal) and sends it to microcontroller that initiates the motors for movements through motor driver IC interfaced to motors. TV remote uses standard RC5 code that can be recognized by microcontroller to generate appropriate output signals.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 304
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Secure Remote Communication Using DES Algorithm',
	'22',
	'The Data Encryption Standard (DES) algorithm is a widely accepted system for data encryption that makes use of a private (secret) key that was judged so hard to break by the U.s. government that it was confined for exportation to different nations. There are more than 71,000,000,000,000,000 (71 quadrillion) encryption keys to be used in this algorithm. For any given message, the key is picked at irregular interval from among this colossal number of keys. Like other private key cryptographic routines, both the sender and the collector must know and utilize a common private key. Many companies, governments, military and other fields make use of DES algorithm for secure data transfer over unsecure networks. We here propose a system for secured data transfer over internet by implementing DES encryption and decryption applications over two remote computers. Our system encrypts data over one end and also transmits data over to the other devic',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 305
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Android Controlled Remote Password Security',
	'21',
	'Our project aims at a system that provides the required authority, the ability to change the password as and when needed. Organizational security is an important factor these days. This is applicable to intellectual as well as physical property security.<br>Our system aims to provides an improved security systems to domestic and organizational industry. Our project has a system that is configured to allow authorized person with a password. A password changing provision is also provided along with it.<br>The password entering feature is provide through remote access. The remote access is provided with the use of an android application that is to be run on any android operated device. The app provides an interactive GUI for this system.<br>The system is operated using an 8051 microcontroller. An EEPROM is used to store user password. The password entered through the android device is received through Bluetooth receiver and then passed on ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 306
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Supervisory Controlling Plus Data Acquisition For Remote Industry',
	'15',
	'The project designed is a data acquisition system under supervisory control which is essential in large industrial environment. SCADA is a technology that is used to track and control all the processes in industries and saves a lot of manpower. The project uses temperature sensors interfaced to a microcontroller of 8051 family to constantly monitor the remote plant operations. The microcontroller is connected to a PC which constantly receives the data recorded by the temperature sensors through microcontroller. With the help of a DAQ system software installed on the PC, the temperature values are displayed and stored in the database. There are parameters provided in the system such as set point, high or low point in the PC. Whenever the recorded temperature goes beyond or below the set point, the microcontroller turns off or on the lamps through relays interfaced to it respectively. When the temperature reaches high or low limit an alar',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 307
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Criminal Investigation Tracker with Suspect Prediction',
	'18',
	'We here propose a criminal investigation tracker system that tracks the investigation status of criminal cases with logs and also predicts primary suspects. The system is proposed to help agencies like CBI, CID and other such bureau’s to sped up investigation process and track status of multiple cases at a time. The system keeps logs of a case which includes case summary, people involved, disputes, past criminal history of those involved, Items recovered on scene and other details. The system realizes the type of case, allows admin to update the status of investigation, upload more images of crime, items found on scene etc. This allows authorized officers to check case status and look into its status online and also update any important info as and when needed. The system also consists of a suspect prediction algorithm. Based on type of case, property, land, love or other entities involved the system studies past cases, it studies past ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 308
	TO_DATE('13-09-15', 'DD-MM-YY'),
	'WiFi Shopping Guide Project',
	'29',
	'Our proposed project is an online Shopping system that provides an effective solution for users to buy the goods according to their requirements and demands. Often people get confused while buying goods from online, as they are not sure of material and quality, but we provide Quality products, and we even have great offers and coupons for our customers. This system solves all problems of the user by providing them different packages and facility.<p>The most important part of the online Shopping agency project is its products and offers provided to users. The database consists of a list of products. The system promises to build 3 different areas for demonstrating its functionality appropriately. Our proposed system will consist of a user registration and login module for new users to register and login to the system. The user may then view various products available. The user may even cancel his booking using his login credentials. After',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 309
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'Android Inventory Tracker',
	'18',
	'The project Android Inventory tracking system is an android application that allows tracking inventory with ease. This project will help to track the location of the inventory and is beneficial in case of large inventory. This application makes it easier to manage large inventories as it helps in tracking it which reduces the time required to search a particular stock. The project also has a login page where in the user is required to register and only then can view the availability of stock. This project requires internet access and thus there is a disadvantage of server failure. This application includes an attractive user interface and also enables a user to add, delete, and update the inventory. In a similar way the user can also add, delete or update inventory details as and when required. This application keeps proper track of inventory by keeping track of inventory inwards and outwards. This also maintains details of inventory su',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 310
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Irrigation System running on Solar Power',
	'21',
	'The system is an automatic irrigation system where the irrigation pump is operated from solar energy. It becomes tedious to manually operate the irrigation system and keep monitoring the water level of the soil. Hence the system uses solar power by using photo-voltaic cells instead of commercial electricity. The project requires an op-amp IC that acts as comparator and senses the soil moisture level. To measure the soil moisture content two copper wires are inserted into the soil at a certain distance. The sensors send the data to microcontroller which is interfaced to relay driver IC that initiates relay to operate pump motor to switch ON/OFF and the status of the pump is displayed on a LCD screen.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 311
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'IOT Industry Automation Using Raspberry Pi',
	'21',
	'Industries have been automated with machines that allow for fully automated tasks without or with little manual intervention.<br>Well here we propose an internet based industry automation system that allows a single industry operator to control industry appliances with ease using Raspberry Pi<br>and IOT Gecko for development. Our proposed system allows for automation of industrial loads to achieve automation over internet. We use IOT gecko for the web server<br>interface and raspberry pi to process and run circuit loads. User is allowed to send commands for machine/load switching over internet using IOT Gecko interface from<br>anywhere in the world over internet. The raspberry processor now captures these commands by internet over wifi connector. Now the raspberry pi processes received data<br>to extract user commands. After getting commands it displays it on an LCD display. Also it switches the loads on/off based on received commands t',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 312
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'RFID Based Passport Project',
	'27',
	'The project designed is an authentication system where the passport holder is authorized through RFID technology. The passport holder would have an RFID tag which contains all the passport details like name, number, nationality etc. This tag has to be swiped over the reader and the information thus read is provided to a microcontroller of 8051 family. This information is matched with the one stored in the microcontroller, if the data matches microcontroller displays an confirmation message otherwise displays a denial message on a LCD screen. The status of a particular person can also be obtained through a status button in the system.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 313
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Auto Irrigation using soil moisture sensor',
	'24',
	'<p>The project is intended to provide proper amount of irrigation to agricultural fields by observing the moisture content of soil. The project automates the process of manually irrigating the fields by switching the pump ON/OFF. It is implemented by using an 8051 series microcontroller, programmed such as to collect input signals that measures moisture content of soil through sensing arrangement. Sensing arrangement is made by inserting two stiff metallic rods into the field at some distance. An op-amp is used as a comparator that interfaces microcontroller and the sensing arrangement. On receiving the signal, the microcontroller produces an output that drives a relay and operates the water pump. Also LCD is used which is interfaced with microcontroller for displaying the moisture content of soil and water pump status. Hence the system reduces human intervention and provides required irrigation to field.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 314
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Bus and Truck Drunk Driving Alert Using PIC',
	'28',
	'Driving buses and trucks continuously for hours is a quite difficult job. In many cases it has been observed bus and truck drivers are seen driving after consuming alcohol. Driving such large vehicles on the road under the influence of alcohol is a grave threat to the driver’s as well as other commuters life on the road. So in order to detect drunk driving in buses and trucks we here propose an automated system that detects such incidents and also avoids it. Also it sends notification of the incident to respective authorities. We here use an alcohol sensor interfaced to microcontroller along with a GSM modem to send notifications, LCD display to display status and buzzer. The system is powered by a 12V power supply. Once alcohol is detected on sensor it generates a relative voltage and microcontroller is signaled. The microcontroller now checks if the alcohol content of driver is above permissible levels. If it is above permissible leve',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 315
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Programmable Sequential Load Operation Controlled By Android Application Project',
	'29',
	'Our project is designed to switch industrial loads by making use of android app through logic control device programmed by user. The system is made to be used in repetitive nature works. This remote controlling task is achieved through the use of any android based device (phone/tablet) running on an android OS.<br>Using programmable logical in order to achieve sequential switching of loads proves a very costly operation. Here we propose a simple and cost effective alternative to the issue by making use of 8051 microcontrollers. The controlling part is provided on an android application.<br>Various tasks and in today’s industries work on repeated operations in varied orders and intervals. Consider an example there a motor needs to run after every 3 seconds. So for this purpose we program the microcontroller to work in three different options: Set option, Manual option and Auto option.<br>When the set option is selected, the system works ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 316
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Android Employee Tracker',
	'17',
	'This system is a combination of web as well as android application where the user will be using the android application and admin as well as HR will work with web application. This application is meant for field work Employers. The Employee will have this application in his android phone, when the user will login to the system his image will be captured and his GPS location will be send to the admin where admin will view image and GPS location in web application. After Login, GPS location of the employee will be tracked automatically by the system  and send to the admin after every 5 minutes .When employee logout the system again the image will be captured as well as GPS location will be send to the admin. In order to keep track of the attendance as well as payroll of the employee, this system plays a major role. The role of the admin is to add new employee by entering his personal details and admin will provide the employee with identi',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 317
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Remote User Recognition And Access Provision',
	'22',
	'We come across conditions where a we need to verify the user by clicking his image and then providing access to user if he is authenticated to use the system. Image processing algorithms are not that good at user verification due to beard, facial expression, image angle, clarity and other factors. Sometimes manual recognition is needed for a 100 % accuracy. Well here we propose a web server that allows to take a photograph of the user as soon as he requests a session on a PC. The pc then transmits this clicked image through to the server without utilizing much bandwidth. The web server admin may now manually verify the person sitting on the PC. If the user is recognized as a valid user, the server machine now sends a command to client pc system in order to allow access to the system. This remote computer user authentication and authorization system can be used on a large scale verification and remote authorization. It is feasible to be ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 318
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Combustible Gas Detection With GSM Alert Using PIC',
	'22',
	'Combustible gases are a very common reason for blasts and fire accidents, causing large damage to life and property. So here we propose an automated gas detection and alerting system that alert users wherever they are using SMS message. So for this purpose we use a PIC microcontroller along with Combustible gas sensor, LCD display, GSM modem for sending message and buzzer. The system is powered by a 12V power supply. The system constantly scans the gas sensor to detect leakages. As soon as gas is detected at the sensor, it produces an equivalent voltage and signals the microcontroller. The microcontroller on reading the signal checks the amount of gas detected, On detecting gas above certain level it then goes into alert mode. The system now displays the status of the event occurred on an LCD display, also sounds a buzzer to alert. It now uses the GSM modem to send an SMS message to the user/authority to inform about the situation so re',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 319
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Android Electricity Bill Payment Project',
	'21',
	'The project is an Android based application where users can get instant electricity bill and pay them online via credit card. The system automates the conventional process of paying electricity bill by visiting the place. Users have to stand in queue for paying bill and wait for their turn. The process is tiresome and time consuming. They even have to wait for the bill being delivered to their place which sometimes can be delivered late by the delivery boy. Hence the system is developed to automate the electricity bill calculation and payment for user convenience.<br>The system would be having two logins admin and user login. Admin can view user account details and can even add or updates things in their account.  Admin has to feed the system with electricity usage data into respective users account through online web application. The system then calculates the electricity bill for every user and updates the information into their accou',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 320
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Android Voting System',
	'27',
	'This application provides is a new technique of casting votes using mobile phones. Android voting system is an application developed for android devices to deploy an easy and flexible way of casting votes anytime and from anywhere. The application is especially developed for organizations to get employees votes for any new policy regulation or issues. The issues or arguments are fed into the system by the admin. Employees can then cast their vote as yes or no. One voter can only post one vote for an argument. Each and every vote casted is stored in the database for the respective argument. At the end of the voting process the system counts the total votes and generates a brief report of it to the admin. Thus the app helps the company to get proper feedback of the employees.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 321
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'DC Motor Speed Control Using GSM',
	'23',
	'DC motors play an important role in industrial as well as other commercial systems. Motors are a major part of various machinery. So controlling of motors over GSM allows user to control machines from anywhere in the world using SMS message commands. We here use an Atmega microcontroller circuit along with GSM modem, a DC motor, LCD display and required circuitry to make this system. This system first allows user to configure a number from which to receive commands in configuration/settings mode. After that the system listens to SMS messages received on the GSM modem. The on receiving the message it checks of it was received from a registered number. If not, the message is rejected. If the number is valid one system now reads the message to check the command in it. On receiving proper commands the system operated the DC motor to achieve the user desired motion along with speed. The system thus allows to control DC motors over large dist',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 322
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Fire Fighter Robot With Night Vision Camera',
	'29',
	'This advanced project Fire Fighter Robotic Vehicle with Night Vision Camera allows a user to control a fire fighter robot equipped with water tank and gun remotely wirelessly for extinguishing fires. For this purposes the system uses an Rf remote for remote operation along with rf receive based microcontroller circuit for operating the robotic vehicle and water pump. The receiver circuit receives RF signals through  RF based remote transfer users commands. The receiver circuit now decodes the data commands sent. It then forwards it to the microcontroller. Now the microcontroller processes these instructions and then instructions the vehicle motors to run the vehicle in desired directions. It also operates the water pump motor and pump direction motor to spray water based on users commands. This allows the user to operate the robot and put off the fire by standing at a safe distance. This robot body also has a wireless night vision enabl',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 323
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'Efficient Doctor Patient Portal',
	'16',
	'We here propose a doctor patient handling, managing system that helps doctors in their work and also patients to book doctor appointments and view medical progress. The system allows doctors to manage their booking slots online. Patients are allowed to book empty slots online and those slots are reserved in their name. The system manages the appointment data for multiple doctors for various date and times. Each time a user visits a doctor his/her medical entry is stored in the database by doctor. Next time a user logs in he may view his/her entire medical history as and when needed. At the same time a doctor may view patients medical history even bore the patient visits him. This allows for an automated patient doctor handling system through an online interface. Our system also consists of organ donor module. This module allows for organ donation registration as well as organ search. The module is designed to help urgent organ requireme',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 324
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Engineering College Automation and Scheduling System',
	'27',
	'This project uses a web application concept to facilitate the departmental system in educational institutes. It uses the most reliable way of uniquely identifying students through website. Such type of web application is very useful in school as well as in college for daily attendance. Through this web application, we can keep a systematic record of students details, mark sheet, attendance and defaulters list. This project enables the easy way of maintaining class attendance with fewer efforts. The system also generates a brief report of attendance from the database according to subject-wise or date-wise as required. A defaulter list can be generated through system. Staff and HOD has the option to take a print of the reports and defaulter list thus generated. Hence, this project introduces a manageable and systematic approach of maintaining student and staff records.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 325
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'University Referencing of Bibliography Android With Barcode Scan',
	'28',
	'You can access all information about book just by scanning the Barcode and also organize references into logical groups (areas, subjects, disciplines, sub-disciplines) by utilizing folders and tags. You can one-click save articles and organize them from your browser. This is invaluable in saving time on organizing. You can read your articles inside the reference manager and then do useful things like highlighting and annotations which can then be saved as notes for future reference. You can export to specific citation styles. This is very useful for someone doing interdisciplinary work. For instance, I have to constantly use the same or similar bibliography using APA style, ACM style, IEEE style. The admin part is developed using Asp .Net and Student part is developed in Android. Its way much easier to get all the required information of books at one place anytime.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 326
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'IOT Weather Reporting System',
	'20',
	'Here we propose a smart weather reporting system over the internet. Our proposed system allows for weather parameter reporting over the internet.  It allows the people to directly check the weather stats online without the need of a weather forecasting agency.<br>System uses temperature, humidity as well as rain sensor to monitor weather and provide live reporting of the weather statistics.<br>The system constantly monitors temperature using temperature sensor, humidity using humidity sensor and also for rain. The system constantly transmits this data to the microcontroller, which now processes this data and keeps on transmitting it to the online web server over a wifi connection. This data is live updated to be viewed on the online server system. Also system allows user to set alerts for particular instances, the system provides alerts to user if the weather parameters cross those values. Thus the IOT based weather reporting system pro',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 327
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'RF Secure Coded Communication System',
	'17',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 328
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Automated Car Parking With Empty Slot Detection',
	'27',
	'System demonstrates a fully automated car parking system. For this purpose we use IR sensors along with motors, LCD display and microcontroller for controlling the<br>system working. Our system consists of an LCD display that is used to demonstrate as a parking gate entrance display.<br>The display displays empty slots to new car arriving at gate of parking area. If no parking space is available the system does not open the gate and displays parking full.<br>If slot is empty system allows car to enter the lot and displays empty slots where user can park. To detect vehicle slot occupancy the system uses IR sensors. Also system uses IR sensors to detect vehicles arriving at parking gates,<br>to open the gates automatically on vehicle arrival. The microcontroller is used to facilitate the working of the entire system.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 329
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'Impartial Intrusion and Crime Detection Without Gender or Caste Discrimination',
	'29',
	'Data mining is supported by Automated information gathering  systems for fraud and crime detection. Undoubtedly, banks, finance companies, vast organizations, insurance agencies, club, and so on are progressively mining information about their clients or representatives in perspective of distinguishing from potential interruption. In many organization intruders are identified by their outer look or by other sensitive attributes like gender, race or religion. This will not help to detect correct intruder. Detecting the intruder based on the sensitive attributes will not help to detect the correct intruder as well as it will lead to discrimination of particular person. Identifying the intruder by sensitive attributes is wrong method to detect the potential intruder. Our proposed system will detect the objective misbehavior of the potential intruder, rather than from sensitive attributes like gender, race or religion. Legal data will be st',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 330
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Android Blood Bank',
	'29',
	'This project acts as an important role in saving life of human beings and which is also its main aim. The project Android Blood Bank system is developed so that users can view the information about registered blood donors such as name, address, and other such personal information along with their details of blood group and other medical information of donor. The project also has a login page where in the user is required to register and only then can view the availability of blood and may also register to donate blood if he/she wishes to. This project requires internet access and thus there is a disadvantage of internet failure. Thus this application helps to select the right donor online instantly using medical details along with the blood group. The main aim of developing this application is to reduce the time to a great extent that is spent in searching for the right donor and the availability of blood required. Thus this application',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 331
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'IOT Based Home Automation',
	'29',
	'IOT or internet of things is an upcoming technology that allows us to control hardware devices through the internet. Here we propose to use IOT in order to control home appliances, thus automating modern homes through the internet. This system uses three loads to demonstrate as house lighting and a fan. Our user friendly interface allows a user to easily control these home appliances through the internet. For this system we use an AVR family microcontroller. This microcontroller is interfaced with a wifi modem to get user commands over the internet. Also we have an LCD display to display system status. Relays are used to switch loads. The entire system is powered by a 12 V transformer. After receiving user commands over the internet, microcontroller processes these instructions to operate these loads accordingly and display the system status on an LCD display. Thus this system allows for efficient home automation over the internet.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 332
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'IOT Heart Attack Detection and Heart Rate Monitor',
	'22',
	'These days we have an increased number of heart diseases including increased risk of heart attacks. Our proposed system users sensors that allow to detect heart rate of a person using heartbeat sensing even if the person is at home. The sensor is then interfaced to a microcontroller that allows checking heart rate readings and transmitting them over internet. The user may set the high as well as low levels of heart beat limit. After setting these limits, the system starts monitoring and as soon as patient heart beat goes above a certain limit, the system sends an alert to the controller which then transmits this over the internet and alerts the doctors as well as concerned users. Also the system alerts for lower heartbeats. Whenever the user logs on for monitoring, the system also displays the live heart rate of the patient. Thus concerned ones may monitor heart rate as well get an alert of heart attack to the patient immediately from a',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 333
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Flammable Gas and Fire Accident Prevention Project',
	'18',
	'Combustible gases are a very common reason for blasts and fire accidents, causing large damage to life and property due to these fires. So here we propose an automated gas detection and alerting system that alert users wherever they are about the leakage of combustible gas and/or fire using SMS through GSM modem. So for this purpose we use a PIC microcontroller along with Combustible gas sensor, temperature sensor, LCD display, GSM modem for sending message and buzzer. The system is powered by a 12V power supply. The system constantly scans the gas sensor and the temperature sensor to detect leakages or high temperatures in its vicinity. As soon as gas is detected at the sensor, it produces an equivalent voltage and signals the microcontroller. The microcontroller on reading the signal checks the amount of gas detected, On detecting gas above certain level it then goes into alert mode. The system now displays the status of the event occ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 334
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Fire Fighter Robot Project',
	'26',
	'This advanced project allows a user to control a fire fighter robot equipped with water tank and gun remotely wirelessly for extinguishing fires. For this purposes the system uses an Rf remote for remote operation along with rf receive based microcontroller circuit for operating the robotic vehicle and water pump. The rf based remote transfers users commands through rf signals which are received by the receiver circuit. The receiver circuit now decodes the data commands sent. It then forwards it to the microcontroller. Now the microcontroller processes these instructions and then instructions the vehicle motors to run the vehicle in desired directions. It also operates the water pump motor and pump direction motor to spray water based on users commands. This allows the user to operate the robot and put off the fire by standing at a safe distance. The robot operates within a 8 meter range of the remote.<br>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 335
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Image Processing Based Fire Detection Using Raspberry Pi',
	'23',
	'The main advantage of Image Processing Based Fire Detection System is the early warning benefit. This system  can be installed just about any where in a commercial building, malls and at many more public places for fire detection. This system uses camera for detecting fires. SO we do not need any other sensors to detect fire. System processes the camera input and then processor processes it to detect fires. The heat signatures and fire illumination patterns are detected in images to determine if it is a fire and take action accordingly. On detecting fire system goes into emergency mode and sounds an alarm. Also displays the status on the LCD display informing about the system.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 336
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Fire Plus Hazardous Gas Detection And Instant SMS Alerting System',
	'15',
	'<p>Dangerous gas leakage as well as fires have caused wide damage to industries and economies in the past. These agents spread wildly and instant action needs to be taken as soon as such an event occurs. It is very important to detect a gas leak or fire as soon as it breaks out so that it can be prevented from spreading instantly. We here propose a system that detects gas leakage as well as fires as soon as they start and alerts the authorities automatically so that it can be stopped from spreading. Our system consists of gas sensor to detect any gas leakage as soon as it is encountered. The gas sensor sends a signal to the microcontroller as soon as gas leak is detected so that microcontroller can process it further. We use a temperature sensor in order to detect fire. The temperature sensor instantly sends a signal to the microcontroller on fire detection. Once the microcontroller receives signal from the sensors, it processes the inp',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 337
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Wildlife Observation Robot Using Rf',
	'20',
	'We can make use of this innovative system in order to get close footage of wild animals. As with the help of this system the user doesn’t have to go close to the wild animals in order to get the close footage. Here the wildlife observation robot with night vision capability system makes use of RF remote to operate the robotic vehicle on which the night vision camera is being mounted. This allows the user to control the robotic vehicle wirelessly and get desired angled of these wild animals. This video is recorded and can be viewed on PC for reference. So wildlife observers can now safely get close footage of wild animals by operating this robotic vehicle from a safe distance. This system consists of an 8051 family microcontroller unit used for processing user sent through the rf transmitter circuit. These signals are received by the rf receiver mounted on the robotic vehicle. The microcontroller then processes this data and passes on si',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 338
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Smart Room Temperature Controller Atmega',
	'25',
	'As the outside temperature varies, it may affect our room temperature. So there is a need for technique to control the temperature of the room even if the outside temperature varies. Our project Smart Room Temperature Controller Using Atmega Microcontroller overcomes this problem. This project makes use 2 loads. It uses bulb to detect heater and fan to detect cooler. The system allows to maintain a specific temperature limit by continuously switching between heater and cooler i.e by alternatively turning ON/OFF the bulb and the fan. Once the system is turned ON, it displays the set temperature limit on the LCD screen. The system also includes two push buttons for increasing or decreasing the temperature. If the room temperature goes below the set limit, the system turns ON the bulb. Same way if the room temperature goes above the set temperature limit, the system turns ON the cooler. Thus by switching between the fan and the bulb, the s',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 339
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Ultrasonic Distance Measurement Project',
	'21',
	'<p>The project aims at measuring the distance of any object with the help of an ultrasonic transducer for inaccessible areas like high temperature, pressure zones where the traditional methods are inappropriate to be implemented.<br>A microcontroller of 8051 family is used to interface the ultrasonic module. Ultrasonic module consists of a transmitter and a receiver. The module transmits the sound waves to the object and the transducer receives the waves reflected back from it. The measurement of the distance is calculated by the total time taken from sending the waves and receiving it with respect to the velocity of sound. The calculation is done by the programmed microcontroller and displays it on LCD screen.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 340
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Secure Data Transfer Over Internet Using Image Steganography',
	'22',
	'Steganography is the technique of hiding private or sensitive information within something that appears to be nothing be a usual image. Steganography involves hiding Text so it appears that to be a normal image or other file. If a person views that object which has hidden information inside, he or she will have no idea that there is any secrete information. What steganography essentially does is exploit human perception, human senses are not trained to look for files that have information inside of them. What this system does is, it lets user to send text as secrete message inside an image file, user uploads the image and enters the text to send secretly, and gives a key or a pass word to lock the text, what this key does is it encrypts the text, so that even if it is hacked by hacker he will not be able to read the text. You will need the key to decrypt the hidden text. User then sends the image and key to the receiver and receiver fir',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 341
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Android File finder and Sorting',
	'20',
	'File finder and sorting is a system developed for android phones that helps user in finding the folder that he wishes. The system can even sort the file according to provided sorting options. It is an application developed effectively using user-friendly and attractive GUI that produces accurate results. People usually forget the location where they have stored the file. Hence the system is needful in finding the appropriate file for users.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 342
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Precise Digital Temperature Controller',
	'29',
	'<p>Our proposed project consists of digital temperature sensors for more accurate temperature control in various industries. Our system overcomes the disadvantages of thermostat/analog systems in terms of accuracy. This system can be used in baby incubators where it is very important to maintain precise temperatures.<br>Incubators are often used for creating temperature controlled suitable environments for prematurely newborn babies. The system displays temperature in a LCD display, as soon as the temperature exceeds our set limit; it automatically switches off the load (heater), to control the temperature. The heater is demonstrated with the help of a lamp.<br>The system uses a digital temperature sensor in order to detect temperature and pass on the data to the microcontroller. The 8051 microcontroller processes data and sends the temperature to be displayed on LCD screen. The display consists of 7 segment display unit to display up t',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 343
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Bikers Portal',
	'25',
	'This is an online Bike and bike parts store that has listings of various bike along with their features. It also consists of Bike service Registration. This system allows user to buy bike, bike parts and inventory online. System allow user to check various articles submitted by user and even comment on them. Credit card payment facility is available. This system also consists of ‘Rent a Bike’ feature where user can ask admin for bike on rent. The visitor who visits the system must register himself by filling up personal details. After registration user can login to the system with his username and password in order to access the system. User can check various bike listing and can view each bikes feature. User can also check features of the bike as well as inventory parts, and accessories. User may select the product and can add the product to shopping cart. User can make payment through credit cards by clicking on credit card payment op',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 344
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Android Password Based Remote Door Opener System Project',
	'18',
	'Our project aims at remote password based door opener system through an android application. The system tends to make a secure door opening mechanism such that the door only unlocks when a security personnel opens it by entering the right password through an android application.<br>The authorized personnel needs to be present within Bluetooth range of the door but need not open the door manually. He just needs to enter the right password through his android application in order to unlock the door. This is a useful concept in places where the security needs to open gates quite usually or need to operate a door from a vehicle without needing to get down from it.<br>The command sending functionality is achieved through an android application. The application provides an interactive user friendly GUI for this purpose. The android application can be operated from any device running on android OS and uses Bluetooth as a medium for sending com',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 345
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Ultrasonic Navigation For The Blind',
	'27',
	'<p>This project is built to aid the blind so that they may walk easily in urban areas and avoid obstacles using special detection sensors . This system uses a microcontroller coupled with an output buzzer to alert the concerned. The system is fitted with an infrared sensor and also three ultrasonic sensors. The system guides and alerts the blind person of walking route and also alerts others about the blind person at night through led’s fitted with it.</p><p>The ultrasonic sensors fitted with the system provides obstacle data to the blind person through voice message so that he/she may avoid them. The LDR circuit coupled with LED lets other people and vehicles aware about the blind person in the dark. A microcontroller does all the work of detecting ultrasonic signals and sending back respective messages to the blind person.Thus the system provides complete guidance and protection to a blind person under various circumstances.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 346
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Railway Tracking and Arrival Time Prediction',
	'28',
	'It has happened so many times that you have been waiting on railway station for someone to arrive and you don’t have any exact information about train timing and other stuff. So here we present to you a project on Railway Tracking and Arrival Time Prediction. Using this system user’s can get the information about train timing, and is it on time or not, and other information. In this, system will track the train timing at what time train departed from a particular station and pass these timing details to other station’s system where it will display the timing according to train departed from previous station. If system will find any delay in train due to signal it will automatically update the train timing in next station and will be displayed to viewers. <p>In this system there is an admin module, who enters the detail about trains and its timing and these details will be passed through internet server and is fetched by the system on ot',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 347
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Attack Source Tracing Project',
	'19',
	'marking concept for this purpose that establishes an efficient defense strategy that is capable of finding out the real source behind the attack by analyzing the packets that travel on the network. Well even though more such concepts are used for tracing attack sources yet this project enables the user with a quite convenient way to find out the attacker with more accurate details of the source. This projects works on a flexible packet marking scheme that adapts and changes with the situation and even edits its marking style in accordance to respective router loads. It has been observed that this strategy requires a relatively small number of packets to do its job and has the capacity to locate and trace a large number of sources from their attack data. An innovative built in feature of this project allows it to retrace sources even in case of heavy router loads. This project is developed as a strategy against ddos attacks. It proves as',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 348
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Android Smart Alarm System',
	'18',
	'Alarm System like any other Alarm System on Android Device allows the user to set an Alarm. While Setting an Alarm the user to select or enter the Time in the 24 hour Clock format, can name the Alarm and can set an Alarm tone. While Selecting the Alarm tone, the tone is play backed. This system has no option for snooze, but has a unique Activity to shut the Alarm Off. The Activity is a Simple Quiz of GK or Mathematical Questions. Once the User has selected the right answer the Alarm will be shut off. The Alarm can be updated or the Old Alarm can be turned on from the Home Page. This System uses a Background Service to check the current time and the time in the database.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 349
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Distributed Dealership Network Analyzer and Sales Monitor',
	'29',
	'These days we observe large enterprises in manufacturing business. These enterprises have their own dealership networks spread across geographical boundaries. At such time measuring the live sales across all networks cannot be accomplished through any manual method. Here we need to use internet to collectively get data from the live dealership networks and then process them at the system. This process completely automates the process since the data is fed by every dealer individually and the sales data goes directly to the system for the company to analyse and make future demand predictions. Here we propose to use a distributed system with company having a server/receiver application that communicates with dealership/client applications through the internet to get constant data feed. The client applications are designed to send sales data from time to time to server system. The server system thus constantly gets live feeds from dealersh',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 350
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Android Law System Project',
	'26',
	'There is a rise in the amount of crime in our country and most of the people are unaware of the criminal laws under IPC (Indian Penal Code). Therefore it becomes necessary to make the citizens aware of all kinds of laws put forth by our constitution against crime so that people come forward to register case against it. This project is executed especially for this purpose.<p>The project online law system is a software system that contains all the laws of IPC so that people can come and search for the laws for respective crime. The laws are categorized into different sections according to some keywords. There is also search option available where user can find or search according to his requirement by entering his query. There is also a facility available for users to get contact of lawyers. An enquiry form is provided where user can ask their query and can also register case and the form is sent to the court authority. This project conta',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 351
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Custom Web Search With User Centric Map',
	'19',
	'Most of the search engines used these days provide the same result sets to all the users searching for the same query even if the user may prefer different aspects or attributes of the query. This custom web search project provides a customized set of web results for each user based on his preference. In order to avoid wastage of time in including unimportant documents and details in browsing session is assigns a personalized search agent for the user. This agent is an intelligent system that uses a Self-Organizing Map for each user in its system. This map is responsible for providing custom/personalized search results to users based on their previous preferences. Get this intelligent web search project developed on J2ee only on NevonProjects.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 352
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'E Healthcare – Online Consultation And Medical Subscription',
	'20',
	'The E consultation system is an end user support and online consultation project. Here we propose a system that connects patients to available doctors for online consultation and also allows doctors to email subscriptions in printable format. Our proposed system aims to build an environment where various patients needing doctor help at their home can consult doctors, send their images(for skin diseases/beauty related issues), chat with doctors, tell then their issues and discuss remedies. It also consists of a doctors login panel where doctor may login to the system and then see patient requests for consultations. The system then schedules those requests and serves them to doctor one after another. This allows doctors to chat with patients and discuss their problems. At the end of consultation the doctor may send them an online subscription in a printable word format so that they may directly print it and get medicines based on that pre',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 353
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Wireless Indoor Positioning System',
	'20',
	'We usually find gps tracking systems to track a android phone location on Gmap but what if we run opt of internet connection or Gps. Or what is we want to track our location on a map. Well here we propose a system that uses wifi signals to exactly track an android phone location in a closed room. Here we do not need any internet or gps connection to do so.<br>Consists of four routers in four corners of room, based on the Network signaling strength of each wifi router displacement we store this data for further processing. Our proposed system gathers data and accurately maps it using indoor environment is estimated by FMM which is simultaneous algebraic reconstruction technique (SART) on a grid in order to get the exact mapping position of the mobile device. We propose this system to be built on an android device since it provides a robust mobile development platform. Our system is aimed to help the blind as well as knowing indoor user l',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 354
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Sentiment Based Movie Rating System',
	'28',
	'We usually come across movie rating websites where users are allowed to rate ad comment on movies online. These ratings are provided as input to the website rating system. The admin then checks reviews, critic’s ratings and displays an online rating for every movie. Here we propose an online system that automatically allows users to post reviews and stores them to rate movies based on user sentiments. The system now analyzes this data to check for user sentiments associated with each comment. Our system consists of a sentiment library designed for English as well as hindi sentiment analysis. The system breaks user comments to check for sentimental keywords and predicts user sentiment associated with it. Once the keywords are found it associates the comment with a sentiment rank. The system now gathers all comments for a particular movie and then calculates an average ranting to score it. This score is generated for every movie in the sy',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 355
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Vehicle Movement Based Street Light Using PIC',
	'28',
	'Vehicle Movement Based Street Lights Project mainly aims at saving energy. The system acheives this by switching on the street lights only when a vehicle will pass by  it and to switch off the lights when there are no vehicles in the street. Thus the system can be used to save a lot of energy by allowing only the required lights to be turned ON as soon as the system senses vehicle movement and to switch off the lights as soon as the vehicle moves ahead. Thus unlike the current system which keeps the street lights ON, irrespective of the vehicle movement. The system uses another mode of operation where the street lights are turned ON with 10% intensity and when the vehicle movement is sensed, the system switches ON lights with 100% intensity.PWM is used for intensity control through microcontroller. The sensors senses the vehicle movement and the sends messages to PIC controller which then the send commands to either switch ON or swithch',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 356
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Automated Visitor Counter With 7 Segment Display',
	'22',
	'The system is designed for optimum energy usage and is very beneficial in case if we want to count the number of people going to attend a particular event or any function thereby helps in collecting data by counting the number of people.This is done by simply incrementing the counter.<br>The system uses InfraRed Sensor pairs in order to fulfil this purpose and thus saves a large amount of energy. Each pair consists of 2 sensor pairs placed at a certain distance from one another in the opposite direction. The IR transmitter is used to transmit IR rays straight to the receiver which receives the input and feeds this to an 8051 Microcontroller.<br>As soon as a person enters the area where the system is placed, it is detected by the IR sensor module and this info is fed to the microcontroller. The microcontroller process this input received. At this time the system also counts the number of people present and increments a counter on each ar',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 357
	TO_DATE('13-09-15', 'DD-MM-YY'),
	'IOT Based Person/Wheelchair Fall Detection',
	'27',
	'When it comes to old age, it becomes necessary to monitor our old ones for their health and safety. Due to weakness and weak joints they have a great risk of falling down. Now it is important to know if an old age person has fallen so that he/she can be helped on time. Also people on wheelchair need to be checked for fall detection. For this purpose we propose a smart fall detection system. The system uses accelerometer and gyro sensor to detect person movements, It can be mounted on persons hand or wheelchair for detection. The sensor is connected to a microcontroller in order to constantly transmit the acceleration data. Now the system keeps monitoring for fall detection and abrupt movement changes in person. A sudden abrupt change with jerk in the system is treated as a fall. Now in case the person did not fall and alarm was false, the system allows to snooze the alert if person presses snooze button in 5 seconds. If person does not ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 358
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Android Group Expense Tracker Application',
	'28',
	'This Expense Tracker application falls in the Finance Category and serves the important purpose of managing finances which is a very important part of one’s life. This application allows multiple or single users to maintain a digital automated diary. User need to register first to access the application for which the user will be provided an id, which will be used to maintain the record of each unique user. Application allows user to add trip to calculate all the expenses done by each member in the group. Expense Tracker application which will keep a track of Income-Expense of a user on a day to day basis. This application takes all the expenses from multiple users and divides the amount roundsum amount between each. Expense tracking application will generate report as and when required to show the expense via multiple graphs. The application also specifies the name of group member to whom the amount is to be given equally.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 359
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Android Musical Instrument Store Project',
	'23',
	'<p>Music shopping App allows users to check for various Musical Instruments available and can purchase them. The project consists of list of Musical Instruments displayed in various models and designs. The user may browse through these products as per categories. If the user likes a product he may add it to his shopping cart. The User can view the items based on their names and Price in increasing or decreasing order.<br>This App has an Innovative Floating Cart that is available on each page, which pops up showing the Items that are currently in the cart with minimum details. The User must first register into the system and then is eligible to check out the products. The User has 3 kinds of payment method namely; Debit, Credit card or Cash on Delivery. The Front End of the App is done using Android Studio and SQL serves as a backend to store lists of musical instruments and inventory data. The products are added by the Admin, The Adm',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 360
	TO_DATE('13-09-15', 'DD-MM-YY'),
	'Mobile Self Encryption',
	'16',
	'This projects allows users to store sensitive data on their mobile phones without having to worry about is confidentiality even if the mobile is lost. This system is developed so that employees and other mobile users can store and operate on sensitive data on their mobile phones without having to worry of it bieng leaked. This software project concentrates on securing data on mobile phones by storing it in an encrypted form. THis data is encrypted with a stream cipher whose key is stored on a server. When the mobile device is lost it sends a report to the server and the server then destroyes the respective key so that the data on that mobile can never be encrypted and remains confidential. Get this software engineering project only on NevonProjects.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 361
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Credit Card Fraud Detection',
	'19',
	'The credit card fraud detection features uses user behavior and location scanning to check for unusual patterns. These patterns include user characteristics such as user spending patterns as well as usual user geographic locations to verify his identity. If any unusual pattern is detected, the system requires revivification. The system analyses user credit card data for various characteristics. These characteristics include user country, usual spending procedures. Based upon previous data of that user the system recognizes unusual patterns in the payment procedure. So now the system may require the user to login again or even block the user for more than 3 invalid attempts.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 362
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Car Overspeeding Detection Project',
	'19',
	'Our proposed project aims to develop a system that detects cars driving at speeds over specified limit and inform concerned authorities immediately. Road accidents occurrences have increased recently so there needs to be a system that allows to detect overspeeding cars. Current speed detection systems are handheld guns held by police personnel that allow them to check car speed and then manually inform authorities about the vehicle. Whereas this proposed system does not need any human interception and records car speed as well as wirelessly informs authorities of overspeeding detections.<br>The system first calculates the time required by the specific car for moving from first point to the second. Based on this data it calculates the car speed. This data is gathered and then transmitted by the system wirelessly to concerned authorities at a remote location. The mechanism consists of IT transmitter- receiver pair that work in combination',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 363
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'GSM Stepper Motor Speed and Direction Controller',
	'20',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 364
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Automated Elevator With Overload Alert',
	'16',
	'This system helps to indicate limit of an elevator, which is how many people can be inside an elevator at a particular time. The system displays the number of people inside an elevator with the help of 7 segment display. Each pair consists of 2 sensor pairs placed at a certain distance from one another in the opposite direction.  The system includes InfraRed Sensor pairs which are placed near the elevator door. These sensors senses when a person enters an elevator and it opens the door of the elevator and simultaneously increments the counter for the number of people entering the elevator. The IR transmitter is used to transmit IR rays straight to the receiver which receives the input and feeds this to an 8051 Microcontroller. The microcontroller process this input received. At this time the system also counts the number of people present and increments a counter on each arrival and decrements when a person exits from the elevator. The ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 365
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Voice Controlled Home Automation Using Raspberry Pi',
	'17',
	'We have reached the era of home automation. We have systems that allow you to control your home appliances using smart phones and remotes.<br>Here we propose an automated home automation that works on speech processing. System eases the home automation task by listening to users speech and switching appliances as per user spoken commands. Here we use a mic to record users speech and transfer these commands to the Raspberry Pi through our circuitry. The Pi processor now processes users speech to extract keywords related to load switching. It analyses the sentence of user to check if user said a command to switching of loads in his speech. If the system detects a command in users sentence, it analyses which load is referred to and what command is issued.  On processing of user spoken keywords the board operates a relay based circuit to switch loads on/off. The relay based circuit is used to switch AC supply loads easily using user command',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 366
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'CNG/LPG Gas Leakage Detection and Accident Prevention System',
	'17',
	'<p>Gas leakage tragedies and accidents have lead to heavy losses over the years. So it is very important to detect any gas leakage and prevent any accidents. So we here propose a system to detect LPG/CNG gas leakage scenarios and provide a security alert to intended users. We here propose to build the system using a MQ6 gas detection sensor and interface it with 8051 family microcontroller along with gsm modem for alerting via an SMS. Our system uses the gas sensor to detect any gas leakages. The gas sensor sends out a signal to microcontroller as soon as it encounters a gas leakage. The microcontroller processes this signal and sends out a signal to the gsm modem with required message details. The gsm modem now sends out an alerting sms to the authorized people so that they may handle the issue and look out for leakages.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 367
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Performance Evaluation in Virtual Organizations Using Data Mining and Opinion Mining',
	'17',
	'Performance evaluation in virtual organizations is one of the most important issues that have been considered due to the transition from industrial age to knowledge era. System will evaluate the performance of those employees who are working for the company from different branches located in different locations or working from home. Virtual Organization is an arrangement where people work for the company by sitting at home or may work from different branches of the company. Virtual organization is a trend that is becoming more common in information technology and other industries for services that have usually been regarded as intrinsic to managing a business. It is necessary to evaluate the performance of the employees who work for the company from different locations in order to increase the productivity and profitability of the company. It is possible to evaluate the performance of the employees who work in organization by monitoring',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 368
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Home Automation Using Android',
	'18',
	'This project helps to control the electrical loads with the help of android application. The electrical loads are controlled based on Bluetooth input signal. This input signal is received from the android device. Many times it becomes too tiring to operate the electrical switches manually every now and then. This is a big problem especially in case of aged or handicapped people.<br>This system solves the issue by interfacing a unit with home appliances that switches these loads based on the input received from android device.<br>The android device may be any android based phone or tab having an android OS. The app also provides an effective GUI for providing this functionality.<br>An 8051 microcontroller is used in this system. The Bluetooth receiver is interfaced with microcontroller in order to accept the commands and then react accordingly. It operates the loads through a set of relays using a relay driver IC. Relays are used between',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 369
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Data Mining For Automated Personality Classification',
	'16',
	'We come across areas where we have access to large amounts of person behavioural data. This data can help us classify persons using Automated personality classification (APC). In this project, we propose an advanced APC – automated personality classification system. We here use learning algorithms along with advanced data mining to mine user characteristics data and learn from the patterns. This learning can now be used to classify/predict user personality based on past classifications. The system analyses vast user characteristics and behaviours and based on the patterns observed, it stores its own user characteristics patterns in a database. The system now predicts new user personality based on personality data stored by classification of previous user data. This system is useful to social networks as well as various ad selling online networks to classify user personality and sell more relevant ads. Also the system is useful for gover',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 370
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'Android Book Store Project',
	'16',
	'Book shopping App allows users to check for various Books Instruments and can purchase them. The project consists of list of Books displayed in various models and designs. The user may browse through these products as per categories. If the user likes a product he may add it to his shopping cart. The User can view the items based on their names and Price in increasing or decreasing order.<br>This App has an Innovative Floating Cart that is available on each page, which pops up showing the Items that are currently in the cart with minimum details. The User must first register into the system and then is eligible to check out the products. The User has 3 kinds of payment method namely; Debit, Credit card or Cash on Delivery. The Front End of the App is done using Android Studio and SQL serves as a backend to store books lists and inventory data. The products are added by the Admin, The Admin Part uses Asp.Net with C#. Thus the online b',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 371
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'AI Desktop Partner',
	'15',
	'A desktop partner bot who chats with you when you are bored. The bot is built with an artificial intelligence algorithm. It chats with you as a real person with amusing replies which doesn''t make the user know he is really talking to a bot. The bot is built with a limited dictionary but uses a great algorithm to imitate a real person. The bot can be used to find you an amusing partner and help you in bad times. The AI desktop partner comes with a real life person imitation (RLPI) System designed in 2013 for putting forward a real time intelligent chatting session for users. The algorithm used here has a  intelligently built in logic and is designed to better chat with Indians since it''s dictionary is better configured as per Indian mentality.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 372
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'Security Access Control Using RFID Project',
	'24',
	'Our project aims at providing a secure authentication system based on RFID tags that allow only people with authorized RFID tags to access secure area. Security is an important issue for every enterprise.<br>It is important to protect physical as well as intellectual property protection. Due to this concern only authorized people with proper tags must be allowed to enter the premises. The tag holds an integrated circuit that is used to store, process data as well as modulate and demodulate the RF signals being transmitted.<br>So as soon as a person brings the RFID tag/card before the reader, the card is scanned and card data is compared with registered users data. If the data matches, microcontroller turns ON the load through a relay that is switched by microcontroller output. An LCD display is used to show an “AUTHORIZED” message in case the tag matches else it shows “UNAUTHORIZED” message.<br>A lamp is also used along with the LCD dis',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 373
	TO_DATE('13-09-15', 'DD-MM-YY'),
	'Unique User Identification Across Multiple Social Networks',
	'18',
	'There are number of social network sites that connect a large amount of people around the world. All social networking sites differ from each other based on various components such as Graphical User Interface, functionality, features etc. Many users have virtual identities on various social network sites. It is common that people are users of more than one social network and also their friends may be registered on multiple social network sites. User may login to different social networking sites at different timing, so user may not find his friends online when he logins to the particular social networking website. To overcome this issue our proposed system will bring together our online friends on different social networking sites into a single integrated environment. This would enable the user to keep up-to-date with their virtual contacts more easily, as well as to provide improved facility to search for people across different websit',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 374
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Biomedical Data Mining For Web Page Relevance Checking',
	'20',
	'Data mining is a technique used to mine out useful data and patterns from large data sets and make the most use of obtained results. Web mining and data mining go hand in hand when creating web mining systems. Web mining includes text mining methodologies that allow for usage reading from and classification based on unstructured data. Text mining allows us to detect patterns, keywords and relevant information in unstructured texts. Web mining and data mining systems each have their own uses. Data mining algorithms are efficient at manipulating organized data sets, while web mining algorithms are widely used to scan and mine from unorganized and unstructured web pages and text data available on the internet. Websites created in various platforms have different data structures and are difficult to read for a single algorithm. Since it is not feasible to build a different algorithm to suit various web technology we need to use efficient we',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 375
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Linux Based Speaking Medication Reminder Project',
	'19',
	'Medication mix-ups are extremely dangerous ,to avoid this  Linux based Speaking Medication Remindercan help to prevent these life-threatening mistakes. It first allows users to enter reminder inputs. System takes input through keyboard to accept various reminders with date and time and dosage. It then reminds patients to take the right medication at the right time. System allows users to store their medication dates and time using raspberry pi. Also users are allowed to enter dosage of each reminder. On set time the system gets the details and converts text to speech. System now speaks out the medication reminder at fed time intervals. This allows for a fully automated medication reminder system for patients.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 376
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Robotic Arm Vehicle Controlled By Touch Screen Display',
	'16',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 377
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'ERP System For Institutes',
	'16',
	'Engineering and medical institutes usually have a number of departments and courses. Managing all these department and course data manually is a very tedious, ineffective and expensive task. So here we propose an ERP system for institutes. We aim to provide entire examination section along with faculty dashboard and training placement department in this system. Our system firstly consists of student database needed by faculty as per their requirement. The system allows to input student attendance into the database which can later be viewed by concerned faculties and students. The students may view their personal attendance and assignment submission data through a separate student login. The examination allows authorized logins to insert update timetables. The time table is then available to be viewed on the web portal. The system also allows to manage the training and placement department. Here students may view latest vacancies and the',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 378
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Android Places Finder Project',
	'27',
	'The android places finder system consists of a list of places registered in the server memory. The android device acts as a client and PC acts as a server. The places data is stored on the server and mobile device is used to access it in order to display to the user.<br>It consists of an admin login that allows admin to enter and store various places in the system. After successful entry the places get stored along with their logo, location and description in the system. The system when user by user allows him to first select a location in the drop down list. The system now allows user to select a type of places from the following list:<ul><li>Restaurants</li><li>Theatres</li><li>Hotels</li><li>Attractions</li><li>Gyms</li></ul><p>Now that the system has got all of users needs, system now searches its database for all the results as per users selections. It then produces those results up on the display screen.  Now user may click on a p',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 379
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Fire and Gas Accident Avoider System',
	'18',
	'System smartly avoids fire as well gas accidents from by detecting fire and gas leakages and taking measures to avoid any accidents from happening.<br>The system consists of fire and gas sensors for detection purpose.<br>If system detects a gas leakage the system first shuts off the gas supply (displayed using stepper motor) to avoid more gas leakage.<br>The system now also starts an exhaust fan to suck out all the leaked gas. Also the system sends information of this event to the authorized user through an SMS message<br>using GSM modem. Now the system also has a fire sensor to detect fires. As soon as a fire is detected, the system shuts off gas supply thus preventing the fire from spreading further and avoiding any chances of explosions.<br>Now the system starts the exhaust fan too in order to suck out all the smoke, so any person stuck in the fire can see easily and escape it. Also it sends information of this event to the authorize',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 380
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Monitoring Suspicious Discussions On Online Forums Using Data Mining',
	'23',
	'People now-a-days are very fond of using internet as a discussion medium. As internet technology had been increasing more and more, this technology led to many legal and illegal activities. It is found that much first-hand news has been discussed in Internet forums well before they are reported in traditional mass media. This communication channel provides an effective channel for illegal activities such as dissemination of copyrighted movies, threatening messages and online gambling etc. The law enforcement agencies are looking for solutions to monitor these discussion forums for possible criminal activities and download suspected postings as evidence for investigation. We propose a system which will tackle this problem effectively. In this project we had used a data mining algorithm to detect criminal activities and illegal postings. Our proposed system will download postings from selected discussion forums continuously and employ dat',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 381
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Automatic Answer Checker',
	'19',
	'An automatic answer checker application that checks and marks written answers similar to a human being. This software application is built to check subjective answers in an online examination and allocate marks to the user after verifying the answer. The system requires you to store the original answer for the system. This facility is provided to the admin. The admin may insert questions and respective subjective answers in the system. These answers are stored as notepad files. When a user takes the test he is provided with questions and area to type his answers. Once the user enters his/her answers the system then compares this answer to original answer written in database and allocates marks accordingly. Both the answers need not be exactly same word to word. The system consists if in build artificial intelligence sensors that verify answers and allocate marks accordingly as good as a human being.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 382
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'Employee Hourly Attendance By Barcode Scan',
	'20',
	'The proposed project is a system that keeps a track of employees'' attendance using barcode scanner. This concept set forth to automate the traditional attendance system of taking signature by using authentication technique. The traditional system requires a register maintained for manually signing the attendance by the employees which is time consuming. Hence this proposed project eliminates the need of maintaining attendance sheet.The proposed system uses barcode method for authenticating employees with a unique barcode that represents their unique id. Every employee will have their attendance card. They have to scan their cards using barcode scanner and the system notes down their attendance as per date and time. System stores employee’s attendance details and generates brief report for admin as required. Such kind of application is very useful in organizations or corporations for taking daily attendance.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 383
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Remote Vehicle Control Through Cell Phone',
	'17',
	'<p>The proposed project aims to drive a vehicle using a mobile phone. The project requires two mobile phones, one to control the robot that sends DTMF commands to another one mounted on the robot vehicle. A DTMF decoder interfaced with the microcontroller of 8051 family receives the commands and with the help of a motor driver operates the vehicle movement. Thus according to the commands sent from the phone two DC motors enables the vehicle movement through motor driver IC. A battery is used for power source.</p>',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 384
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Automated RF plus IR Based Paid Parking Manager System',
	'15',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 385
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Android Dabbawala Project',
	'17',
	'This system is made with the view point of managing the Mumbai Dabbawala’s who provide homemade food to the respective people working in an organization. With the help of this system the dabbawala can deliver the food at correct time. This system is developed in android where user can easily order their food with their hand held devices. As this system is developed in android user can easily use dabba service anywhere at anytime. This application is built to be beneficial to student knowledge as well as help Mumbai dabbawala’s.This system allows the user to order the dabba service based on weekly, monthly or quarterly basis. System will calculate the cost based on the service user had selected. In this system android user can select dabba service or catering service. In dabba service he can get food delivered from his home by the dabbawala’s at specified timing. In catering service he can order thali by mentioning certain details requir',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 386
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'GPS Vehicle Tracking and Theft Detection',
	'16',
	'The project proposes a GPS based vehicle tracking system that tracks the vehicle and sends the tracking data over through a sms.<br>The microcontroller acts as the controlling head of the system.<br>When the system goes in Theft mode the authorized user gets the alert message and user will Able to stop the vehicle engine immediately via sending sms to system With ''S'' Keyword.<br>The system includes a GPS modem that tracks the vehicle location in the form of latitude and longitude.<br>This location can be accessed via sms that is being sent to the user.<br>With the help latitude and longitude information SMS user will able to locate vehicle with Google map.<br>This system proves very beneficial for transport and travel companies as they can now  keep track of their vehicles.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 387
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Rough Terrain Beetle Robot',
	'17',
	'Spy robots are not good for spying on rough terrains due to their wheeled mechanisms. Robots and drones get stuck due to their inability to work on rough terrains. Here we propose a rough terrain beetle robot that can navigate with easy through jungles, hilly and rocky areas with ease. Its small size allows it to get go through rough terrains like a small animal crawling through the jungle with very little noise. The robot uses a crawling mechanism to achieve this task. The robot uses a microcontroller based circuit to control the motors and achieve desired movement. The robotic vehicle uses specialized climbers to climb and descend on hilly terrains. The climbers also allow it to crawl easily through bushes and grass. Also it allows the robot to cross rocky paths and obstacles. The robot is remotely controlled by a joystick remote. This allows the user to remotely control the directional movement as well as speed and power of the robot',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 388
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Android Controlled Pick And Place Robotic Arm Vehicle Project',
	'17',
	'The system provides a pick and place robotic arm which is a soft catching gripper system. It can be used to pick and place objects as needed. This arm is mounted on a robotic vehicle that can be controlled wirelessly through an android mobile phone.<br>The android phone acts as the controller used to transmit the control commands through Bluetooth. These commands are used to operate the robot front, backwards, left and right directions. At the receiver side four motors are used, two to drive the vehicle and the other two used to control the arm movement and gripper movement respectively.<br>The android phone is used as remote controlling device used to control the robotic vehicle. The use of Bluetooth technology provides adequate operational range with instant transmissions. The microcontroller after receiving these commands, operate required motors through the driver IC. It can be remotely controlled by any android device.<br>This robo',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 389
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'Gsm Based Door Unlocker system',
	'27',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 390
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Shuttling Metro Train Between Stations Project',
	'28',
	'Our project aims at demonstrating the technology used to shuttle metro trains between stations in most of the developed countries. The train consists of IR controllers that enable it to detect and stop at stations as they arrive.<br>The system allows for running trains without any human intervention. This also rules the possibilities of human errors. The system uses IR sensors along with a microcontroller of 8051 family in order to achieve this goal.<br>The train and station are equipped with ir sensor pairs. This helps rain to detect station as it arrives and make a halt automatically. After that the train doors are also equipped with IR sensors that help to determine the number of passengers in the train. The passenger count is also displayed in the train.<br>If the train reaches its maximum passenger capacity, the door closes automatically. The door opens for specified time interval at each station, closes after that. The system also',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 391
	TO_DATE('16-09-15', 'DD-MM-YY'),
	'RF Based Night Vision Spy Robot Using PIC',
	'16',
	'Rf Controlled Spy Robot With Night Vision Camera project mainly aims to detect any unwanted activity and capture it for evidence purposes. For which the system uses night vision camera which can also capture activities during night time. In this way the system proves to be very beneficial for spying purposes and especially when there is high risk involved to capture the activity. i.e the humans cannot be sent to such high risk involved places for spying purposes. The system makes use of RF remote which has push buttons for forward, backward, left and right through which the users can send commands. The commands specifies in which direction the robotic vehicle should be moved. The receiver then sends these commands to the PIC microcontroller which then determines in which direction the robotic vehicle should be moved. The movement of this robotic vehicle can be monitored by the user from the PC.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 392
	TO_DATE('17-09-15', 'DD-MM-YY'),
	'Content Summary Generation Using NLP',
	'19',
	'To find prominent summarized points in a collection of documents. We here propose a system to detect summarized points from a huge or multiple paragraph. We use an efficient method to discover summarized points from the provided content using Natural language processing (NLP). The provided content is divided into two parts as Summarized Content and Summarized Point. One would expect particular words to appear in the content more or less frequently: "dog" and "bone" will appear more often in documents about dogs, "cat" and "meow" will appear in documents about cats, and "the" and "is" will appear equally in both. A document typically concerns multiple topics in different proportions; thus, in a document that is 10% about cats and 90% about dogs, there would probably be about 9 times more dog words than cat words. Our proposed system captures this intuition in a mathe',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 393
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Long Range Spy Robot With Metal Detection',
	'16',
	'This system Long Range Spy Robot with Metal Detection is a very innovative system as this system allows operating a robot irrespective of the distance of the user who wants to operate the robot. The user of this system doesn’t have to worry about the distance in order to operate the robot. The system does this with the help of DTMF technology which allows sending data commands via a call. The user wishing to operate the robot will just have to call on the mobile phone connected to this system. This system consists of 8051 family microcontroller which is interfaced to the metal detector, spy camera and the system also uses battery. The metal detector helps to detect metal on turns on the buzzer. In order to operate the system, the user has to make a call to the phone connected to this robot and once the call is received, the user will have to use the keypad to send data commands to the robot. The data commands will make the robot to eith',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 394
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Robotic Vehicle Controlled By Hand Gesture Using PIC',
	'20',
	'Robotic vehicle controlled by the hand movement mainly benefits the disabled person, as those person with the hand gesture moves to the direction they want to go without pressing any buttons.<br>This system includes a glove which has a receiver circuit which will be mounted on the top with Atmega microcontroller interfaced to the accelerometer and it is supposed to be worn by the user while using this machine. The circuit on the vehicle includes FR receiver, PIC microcontroller and Driver IC to operate the motors. The commands that are received by the IC on the circuit are sent to the RF transmitter which forwards the command to the RF receiver. The command from RF receiver then gets trasmitted to the PIC microcontroller which decodes the command and makes the vehicle move in the direction specified by the user.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 395
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Android Customer Relationship Management System',
	'25',
	'Customer relationship management (CRM) is a system for managing a company''s interactions with current and future customers. It often involves using technology to organize, automate, and synchronize sales.  Company employee must keep track of current and future customers to synchronize sales. Manually it is not possible for the employee to keep records of all the leads. Customer Relationship Management System helps to keep track of number of leads converted by the employee. This System helps to manage sales. This system is a combination of both .Net and android technology. <p><b>System works as follows:-</b></p><ul><li>Admin will add new employee by filling employee details and will provide identity number and password to the employee to access the system.</li><li>Admin can edit employee details.</li><li>Admin can view number of leads converted by employee as well as profit and loss amount of the employee.</li><li>When employee log',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 396
	TO_DATE('14-09-15', 'DD-MM-YY'),
	'GSM based Industry Protection System',
	'19',
	'With heavy automation taking place these days, the number of industries as well as number of accidents in those industries have increased substantially. Human errors and manual safety systems lead to increase in industrial accidents. So here we propose a gsm based industrial protection system that detects smoke, temperature as well as light to keep track of accidents. The system needs to detect if the temperature of a machine or environment goes above a certain level, if it goes above a level, it is an indication of a malfunction. So here we use temperature sensor to detect a possible accident. Next indication is the malfunction or overloading of machines leading to smoke. We use smoke detectors to detect smoke and similarly a light sensor to detect light due to spark or any flash caused due to malfunctions. All these indicators/sensors constantly provide their input to the microcontroller connected to them. The microcontroller constant',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 397
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'Detecting E Banking Phishing Websites Using Associative Classification',
	'16',
	'There are number of users who purchase products online and make payment through e- banking.  There are e- banking websites who ask user to provide sensitive data such as username, password or credit card details etc often for malicious reasons. This type of e-banking websites is known as phishing website. In order to detect and predict e-banking phishing website. We proposed an intelligent, flexible and effective system that is based on using classification Data mining algorithm. We implemented classification algorithm and techniques to extract the phishing data sets criteria to classify their legitimacy. The e-banking phishing website can be detected based on some important characteristics like URL and Domain Identity, and security and encryption criteria in the final phishing detection rate. Once user makes transaction through online when he makes payment through e-banking website our system will use data mining algorithm to detect wh',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 398
	TO_DATE('15-09-15', 'DD-MM-YY'),
	'Driver Card With Qr Code Identification',
	'27',
	'The software system tracks the reporting activities of drivers. Each driver is provided with a card that contains a unique QR code. On arriving, drivers have to scan the card where the system records the time and stores it. While going back again they have to scan it so that system noted down their leaving time. Thus the system stores the data and calculates the total amount of time that the driver has worked for in a month. Depending on per hour salary given by admin the system also calculates his total pay for the month. This project is helpful for organizations that involves pick and drop facility. Also it can be used for railway motor men and for pilots.',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 399
	TO_DATE('18-09-15', 'DD-MM-YY'),
	'Tab Based Library Book Availability and Location Finder On Wifi',
	'19',
	'Large libraries usually have thousands of books kept at different locations. It is sometimes tedious to search for book locations. It is also necessary to know weather a book is available or not at the library. So here we propose a tab based system that guides the user at librarian counter itself about book availability as well as book location if book is available. If book is unavailable the tab even guides the user about the book return date so that he may return that exact day. The tab based system allows user to search for books across various categories and check their availability and location at the counter itself.<br>The system also consists of and admin server/PC used by the librarian to insert data about new books. Update book availability status as well as book location as and when needed. This data is reflected in the tab through a wifi connection. The tab works in coordination with the server PC through a wifi based connect',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 400
	TO_DATE('19-09-15', 'DD-MM-YY'),
	'Raspberry Pi Home Automation Project',
	'19',
	'This is the era of automated homes and offices. Our proposed system puts forward a gull fledged home automation system using Raspberry Pi to control appliances. We here allow the user to easily control home appliances using an android phone. The android application sends user commands provided through GUI for home appliance control using Bluetooth. These commands are captures on our circuit board using a Bluetooth receiver. The receiver then forwards the commands to the Raspberry Pi board which is used t process these commands and then switch on/off appliances as per user specified commands. The circuit consists of relay based circuit which acts as switches for individual AC loads. Based on commands received by the receiver, the raspberry processor processes the commands and then switches relays accordingly to switch on/off required loads on the circuit. We use a transformer to provide required supply to our board.<br>Thus we demonstrat',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 401
	TO_DATE('12-09-15', 'DD-MM-YY'),
	'CCTV Theft Detection and Tracking',
	'15',
	'Here we propose a camera footage based theft detection along with thieves tracking based on motion. For this purpose we use image processing to detect theft occurrence and motion tracking to track thieves in CCTV footage. System allows to enhance theft detection without use of sensors. This application uses foreground detector and blob analysis to detect motion of thief. This system focuses on detecting objects. Here we don’t process the entire video but we work on initial video frame in which the moving objects are segmented from the background. Here we applied image preprocessing steps in order to remove undesirable noise and we used some image processing methodology to fill gaps in the detected objects. We used blob analysis methodology to detect connected component. System rejects smaller objects. Finally motion of large object is detected and surrounded by bounding box. System will detect the thief and beep sound will be generated ',
	'Y'
);

insert into projects values
(
	projects_id_seq.nextval,		-- 402
	TO_DATE('20-09-15', 'DD-MM-YY'),
	'Automatic Plant Irrigation Using PIC',
	'19',
	'The system''s main aim is to provide the amount of irrigation to agricultural fields by observing the moisture content of soil. The project minimizes the manual process if irrgating the field by switch the pump ON/OFF. The system works with the use of PIC microcontroller, which collects the input signals that measures moisture content of soil through sensing arrangement. On receving the signal, the PIC microcontroller produces an output that drives a relay and operates the water pump. The system is also built in with a LCD which is interfaced with the microcontroller for displaying the moisture content of soil and water pump status. This system helps in reducing the manual work and provides required irrigation to the agricultural feild.',
	'Y'
);

insert into project_members values
(
	1,
	'RIT2013001'
);

insert into project_members values
(
	1,
	'RIT2013002'
);

insert into project_members values
(
	1,
	'RIT2013003'
);

insert into project_members values
(
	1,
	'RIT2013004'
);

insert into project_members values
(
	1,
	'RIT2013005'
);

insert into project_members values
(
	2,
	'RIT2013007'
);

insert into project_members values
(
	3,
	'RIT2013008'
);

insert into project_members values
(
	3,
	'RIT2013009'
);

insert into project_members values
(
	4,
	'RIT2013010'
);

insert into project_members values
(
	4,
	'RIT2013011'
);

insert into project_members values
(
	4,
	'RIT2013012'
);

insert into project_members values
(
	4,
	'RIT2013013'
);

insert into project_members values
(
	5,
	'RIT2013015'
);

insert into project_members values
(
	5,
	'RIT2013016'
);

insert into project_members values
(
	5,
	'RIT2013017'
);

insert into project_members values
(
	6,
	'RIT2013018'
);

insert into project_members values
(
	6,
	'RIT2013019'
);

insert into project_members values
(
	6,
	'RIT2013020'
);

insert into project_members values
(
	7,
	'RIT2013021'
);

insert into project_members values
(
	7,
	'RIT2013022'
);

insert into project_members values
(
	7,
	'RIT2013023'
);

insert into project_members values
(
	8,
	'RIT2013024'
);

insert into project_members values
(
	8,
	'RIT2013025'
);

insert into project_members values
(
	8,
	'RIT2013026'
);

insert into project_members values
(
	9,
	'RIT2013027'
);

insert into project_members values
(
	10,
	'RIT2013028'
);

insert into project_members values
(
	10,
	'RIT2013029'
);

insert into project_members values
(
	10,
	'RIT2013030'
);

insert into project_members values
(
	11,
	'RIT2013032'
);

insert into project_members values
(
	12,
	'RIT2013033'
);

insert into project_members values
(
	12,
	'RIT2013034'
);

insert into project_members values
(
	13,
	'RIT2013035'
);

insert into project_members values
(
	14,
	'RIT2013036'
);

insert into project_members values
(
	14,
	'RIT2013037'
);

insert into project_members values
(
	14,
	'RIT2013038'
);

insert into project_members values
(
	14,
	'RIT2013039'
);

insert into project_members values
(
	15,
	'RIT2013040'
);

insert into project_members values
(
	16,
	'RIT2013041'
);

insert into project_members values
(
	17,
	'RIT2013042'
);

insert into project_members values
(
	17,
	'RIT2013043'
);

insert into project_members values
(
	18,
	'RIT2013044'
);

insert into project_members values
(
	18,
	'RIT2013045'
);

insert into project_members values
(
	19,
	'RIT2013046'
);

insert into project_members values
(
	19,
	'RIT2013047'
);

insert into project_members values
(
	19,
	'RIT2013048'
);

insert into project_members values
(
	19,
	'RIT2013049'
);

insert into project_members values
(
	20,
	'RIT2013050'
);

insert into project_members values
(
	20,
	'RIT2013051'
);

insert into project_members values
(
	20,
	'RIT2013052'
);

insert into project_members values
(
	21,
	'RIT2013053'
);

insert into project_members values
(
	21,
	'RIT2013054'
);

insert into project_members values
(
	21,
	'RIT2013055'
);

insert into project_members values
(
	22,
	'RIT2013056'
);

insert into project_members values
(
	22,
	'RIT2013057'
);

insert into project_members values
(
	22,
	'RIT2013058'
);

insert into project_members values
(
	22,
	'RIT2013059'
);

insert into project_members values
(
	23,
	'RIT2013060'
);

insert into project_members values
(
	23,
	'RIT2013061'
);

insert into project_members values
(
	23,
	'RIT2013062'
);

insert into project_members values
(
	23,
	'RIT2013063'
);

insert into project_members values
(
	24,
	'RIT2013064'
);

insert into project_members values
(
	25,
	'RIT2013065'
);

insert into project_members values
(
	25,
	'RIT2013066'
);

insert into project_members values
(
	25,
	'RIT2013067'
);

insert into project_members values
(
	25,
	'RIT2013068'
);

insert into project_members values
(
	25,
	'RIT2013069'
);

insert into project_members values
(
	26,
	'RIT2013070'
);

insert into project_members values
(
	26,
	'RIT2013071'
);

insert into project_members values
(
	26,
	'RIT2013072'
);

insert into project_members values
(
	26,
	'RIT2013073'
);

insert into project_members values
(
	27,
	'RIT2013074'
);

insert into project_members values
(
	27,
	'RIT2013075'
);

insert into project_members values
(
	28,
	'RIT2013076'
);

insert into project_members values
(
	28,
	'RIT2013077'
);

insert into project_members values
(
	28,
	'RIT2013078'
);

insert into project_members values
(
	28,
	'RIT2013079'
);

insert into project_members values
(
	28,
	'RIT2013080'
);

insert into project_members values
(
	29,
	'RIT2013081'
);

insert into project_members values
(
	29,
	'RIT2013082'
);

insert into project_members values
(
	29,
	'RIT2013083'
);

insert into project_members values
(
	29,
	'RIT2013084'
);

insert into project_members values
(
	30,
	'RIT2013085'
);

insert into project_members values
(
	30,
	'RIT2013086'
);

insert into project_members values
(
	30,
	'RIT2013087'
);

insert into project_members values
(
	30,
	'RIT2013088'
);

insert into project_members values
(
	30,
	'RIT2014030'
);

insert into project_members values
(
	31,
	'RIT2014033'
);

insert into project_members values
(
	31,
	'RIT2014001'
);

insert into project_members values
(
	32,
	'RIT2014062'
);

insert into project_members values
(
	32,
	'RIT2014039'
);

insert into project_members values
(
	32,
	'RIT2014008'
);

insert into project_members values
(
	32,
	'RIT2014060'
);

insert into project_members values
(
	33,
	'RIT2014020'
);

insert into project_members values
(
	33,
	'RIT2014028'
);

insert into project_members values
(
	33,
	'RIT2014048'
);

insert into project_members values
(
	33,
	'RIT2014059'
);

insert into project_members values
(
	33,
	'RIT2014055'
);

insert into project_members values
(
	34,
	'RIT2014007'
);

insert into project_members values
(
	34,
	'RIT2014014'
);

insert into project_members values
(
	34,
	'RIT2014063'
);

insert into project_members values
(
	35,
	'RIT2014018'
);

insert into project_members values
(
	35,
	'RIT2014047'
);

insert into project_members values
(
	35,
	'RIT2014035'
);

insert into project_members values
(
	35,
	'RIT2014050'
);

insert into project_members values
(
	35,
	'RIT2014057'
);

insert into project_members values
(
	36,
	'RIT2014034'
);

insert into project_members values
(
	36,
	'RIT2014043'
);

insert into project_members values
(
	36,
	'RIT2014004'
);

insert into project_members values
(
	37,
	'RIT2014046'
);

insert into project_members values
(
	37,
	'RIT2014042'
);

insert into project_members values
(
	37,
	'RIT2014054'
);

insert into project_members values
(
	38,
	'RIT2014045'
);

insert into project_members values
(
	38,
	'RIT2014017'
);

insert into project_members values
(
	38,
	'RIT2014011'
);

insert into project_members values
(
	38,
	'RIT2014013'
);

insert into project_members values
(
	39,
	'RIT2014012'
);

insert into project_members values
(
	39,
	'RIT2014052'
);

insert into project_members values
(
	39,
	'RIT2014021'
);

insert into project_members values
(
	40,
	'RIT2014006'
);

insert into project_members values
(
	41,
	'RIT2014009'
);

insert into project_members values
(
	42,
	'RIT2014024'
);

insert into project_members values
(
	42,
	'RIT2014044'
);

insert into project_members values
(
	42,
	'RIT2014051'
);

insert into project_members values
(
	43,
	'RIT2014022'
);

insert into project_members values
(
	43,
	'RIT2014027'
);

insert into project_members values
(
	43,
	'RIT2014032'
);

insert into project_members values
(
	43,
	'RIT2014037'
);

insert into project_members values
(
	44,
	'RIT2014041'
);

insert into project_members values
(
	44,
	'RIT2014031'
);

insert into project_members values
(
	45,
	'RIT2014058'
);

insert into project_members values
(
	45,
	'RIT2014010'
);

insert into project_members values
(
	45,
	'RIT2014003'
);

insert into project_members values
(
	45,
	'RIT2014029'
);

insert into project_members values
(
	45,
	'RIT2014015'
);

insert into project_members values
(
	46,
	'RIT2014016'
);

insert into project_members values
(
	47,
	'RIT2014049'
);

insert into project_members values
(
	47,
	'RIT2014061'
);

insert into project_members values
(
	47,
	'RIT2014002'
);

insert into project_members values
(
	48,
	'RIT2014005'
);

insert into project_members values
(
	48,
	'RIT2014019'
);

insert into project_members values
(
	48,
	'RIT2014023'
);

insert into project_members values
(
	48,
	'RIT2014025'
);

insert into project_members values
(
	49,
	'RIT2014026'
);

insert into project_members values
(
	49,
	'RIT2014036'
);

insert into project_members values
(
	49,
	'RIT2014038'
);

insert into project_members values
(
	50,
	'RIT2014040'
);

insert into project_members values
(
	50,
	'RIT2014053'
);

insert into project_members values
(
	50,
	'RIT2014056'
);

insert into project_members values
(
	50,
	'RIT2014064'
);

insert into project_members values
(
	51,
	'RIT2014067'
);

insert into project_members values
(
	51,
	'RIT2014073'
);

insert into project_members values
(
	52,
	'RIT2014078'
);

insert into project_members values
(
	52,
	'RIT2014076'
);

insert into project_members values
(
	52,
	'RIT2014083'
);

insert into project_members values
(
	53,
	'RIT2014074'
);

insert into project_members values
(
	53,
	'RIT2014066'
);

insert into project_members values
(
	54,
	'RIT2014068'
);

insert into project_members values
(
	54,
	'RIT2014079'
);

insert into project_members values
(
	55,
	'RIT2014072'
);

insert into project_members values
(
	55,
	'RIT2014090'
);

insert into project_members values
(
	56,
	'RIT2014084'
);

insert into project_members values
(
	56,
	'RIT2014081'
);

insert into project_members values
(
	56,
	'RIT2014089'
);

insert into project_members values
(
	57,
	'RIT2014088'
);

insert into project_members values
(
	57,
	'RIT2014080'
);

insert into project_members values
(
	57,
	'RIT2014085'
);

insert into project_members values
(
	57,
	'RIT2014092'
);

insert into project_members values
(
	58,
	'RIT2014091'
);

insert into project_members values
(
	58,
	'RIT2014075'
);

insert into project_members values
(
	59,
	'RIT2014082'
);

insert into project_members values
(
	59,
	'RIT2014065'
);

insert into project_members values
(
	59,
	'RIT2014077'
);

insert into project_members values
(
	59,
	'RIT2014087'
);

insert into project_members values
(
	60,
	'RIT2014086'
);

insert into project_members values
(
	60,
	'RIT2015001'
);

insert into project_members values
(
	61,
	'RIT2015002'
);

insert into project_members values
(
	61,
	'RIT2015003'
);

insert into project_members values
(
	61,
	'RIT2015004'
);

insert into project_members values
(
	61,
	'RIT2015005'
);

insert into project_members values
(
	61,
	'RIT2015006'
);

insert into project_members values
(
	62,
	'RIT2015007'
);

insert into project_members values
(
	62,
	'RIT2015008'
);

insert into project_members values
(
	62,
	'RIT2015009'
);

insert into project_members values
(
	62,
	'RIT2015010'
);

insert into project_members values
(
	62,
	'RIT2015011'
);

insert into project_members values
(
	63,
	'RIT2015012'
);

insert into project_members values
(
	63,
	'RIT2015013'
);

insert into project_members values
(
	64,
	'RIT2015014'
);

insert into project_members values
(
	64,
	'RIT2015015'
);

insert into project_members values
(
	64,
	'RIT2015016'
);

insert into project_members values
(
	65,
	'RIT2015017'
);

insert into project_members values
(
	65,
	'RIT2015018'
);

insert into project_members values
(
	66,
	'RIT2015019'
);

insert into project_members values
(
	66,
	'RIT2015020'
);

insert into project_members values
(
	66,
	'RIT2015021'
);

insert into project_members values
(
	66,
	'RIT2015022'
);

insert into project_members values
(
	67,
	'RIT2015023'
);

insert into project_members values
(
	67,
	'RIT2015024'
);

insert into project_members values
(
	67,
	'RIT2015025'
);

insert into project_members values
(
	67,
	'RIT2015026'
);

insert into project_members values
(
	67,
	'RIT2015027'
);

insert into project_members values
(
	68,
	'RIT2015028'
);

insert into project_members values
(
	68,
	'RIT2015029'
);

insert into project_members values
(
	68,
	'RIT2015030'
);

insert into project_members values
(
	69,
	'RIT2015031'
);

insert into project_members values
(
	69,
	'RIT2015032'
);

insert into project_members values
(
	69,
	'RIT2015033'
);

insert into project_members values
(
	69,
	'RIT2015034'
);

insert into project_members values
(
	69,
	'RIT2015035'
);

insert into project_members values
(
	70,
	'RIT2015036'
);

insert into project_members values
(
	70,
	'RIT2015037'
);

insert into project_members values
(
	70,
	'RIT2015038'
);

insert into project_members values
(
	70,
	'RIT2015039'
);

insert into project_members values
(
	71,
	'RIT2015040'
);

insert into project_members values
(
	71,
	'RIT2015041'
);

insert into project_members values
(
	71,
	'RIT2015042'
);

insert into project_members values
(
	72,
	'RIT2015043'
);

insert into project_members values
(
	72,
	'RIT2015044'
);

insert into project_members values
(
	73,
	'RIT2015045'
);

insert into project_members values
(
	73,
	'RIT2015046'
);

insert into project_members values
(
	73,
	'RIT2015047'
);

insert into project_members values
(
	74,
	'RIT2015048'
);

insert into project_members values
(
	74,
	'RIT2015049'
);

insert into project_members values
(
	74,
	'RIT2015050'
);

insert into project_members values
(
	75,
	'RIT2015051'
);

insert into project_members values
(
	75,
	'RIT2015052'
);

insert into project_members values
(
	75,
	'RIT2015053'
);

insert into project_members values
(
	75,
	'RIT2015054'
);

insert into project_members values
(
	75,
	'RIT2015055'
);

insert into project_members values
(
	76,
	'RIT2015056'
);

insert into project_members values
(
	76,
	'RIT2015057'
);

insert into project_members values
(
	76,
	'RIT2015058'
);

insert into project_members values
(
	77,
	'RIT2015059'
);

insert into project_members values
(
	77,
	'RIT2015060'
);

insert into project_members values
(
	77,
	'RIT2015061'
);

insert into project_members values
(
	77,
	'RIT2015062'
);

insert into project_members values
(
	77,
	'RIT2015063'
);

insert into project_members values
(
	78,
	'RIT2015064'
);

insert into project_members values
(
	78,
	'RIT2015065'
);

insert into project_members values
(
	78,
	'RIT2015066'
);

insert into project_members values
(
	78,
	'RIT2015067'
);

insert into project_members values
(
	78,
	'RIT2015068'
);

insert into project_members values
(
	79,
	'RIT2015069'
);

insert into project_members values
(
	79,
	'RIT2015070'
);

insert into project_members values
(
	79,
	'RIT2015071'
);

insert into project_members values
(
	80,
	'RIT2015072'
);

insert into project_members values
(
	80,
	'RIT2015073'
);

insert into project_members values
(
	80,
	'RIT2015074'
);

insert into project_members values
(
	81,
	'RIT2015075'
);

insert into project_members values
(
	81,
	'RIT2015076'
);

insert into project_members values
(
	81,
	'RIT2015077'
);

insert into project_members values
(
	82,
	'RIT2015078'
);

insert into project_members values
(
	83,
	'RIT2015079'
);

insert into project_members values
(
	83,
	'RIT2015080'
);

insert into project_members values
(
	83,
	'RIT2015081'
);

insert into project_members values
(
	83,
	'RIT2015082'
);

insert into project_members values
(
	84,
	'RIT2015083'
);

insert into project_members values
(
	84,
	'RIT2015084'
);

insert into project_members values
(
	84,
	'RIT2015085'
);

insert into project_members values
(
	84,
	'RIT2015086'
);

insert into project_members values
(
	85,
	'RIT2015088'
);

insert into project_members values
(
	85,
	'RIT2015089'
);

insert into project_members values
(
	86,
	'RIT2012050'
);

insert into project_members values
(
	86,
	'IIT2014017'
);

insert into project_members values
(
	86,
	'IIT2014032'
);

insert into project_members values
(
	87,
	'IIT2014046'
);

insert into project_members values
(
	87,
	'IIT2014011'
);

insert into project_members values
(
	87,
	'IIT2014108'
);

insert into project_members values
(
	87,
	'IIT2014137'
);

insert into project_members values
(
	88,
	'IIT2014109'
);

insert into project_members values
(
	88,
	'IIT2014066'
);

insert into project_members values
(
	88,
	'IIT2014106'
);

insert into project_members values
(
	88,
	'IIT2014033'
);

insert into project_members values
(
	89,
	'IIT2014096'
);

insert into project_members values
(
	89,
	'IIT2014022'
);

insert into project_members values
(
	89,
	'IIT2014038'
);

insert into project_members values
(
	89,
	'IIT2014064'
);

insert into project_members values
(
	90,
	'IIT2014142'
);

insert into project_members values
(
	90,
	'IIT2014083'
);

insert into project_members values
(
	91,
	'IIT2014134'
);

insert into project_members values
(
	91,
	'IIT2014097'
);

insert into project_members values
(
	91,
	'IIT2014003'
);

insert into project_members values
(
	92,
	'IIT2014029'
);

insert into project_members values
(
	92,
	'IIT2014058'
);

insert into project_members values
(
	92,
	'IIT2014082'
);

insert into project_members values
(
	93,
	'IIT2014070'
);

insert into project_members values
(
	94,
	'IIT2014123'
);

insert into project_members values
(
	94,
	'IIT2014090'
);

insert into project_members values
(
	94,
	'IIT2014118'
);

insert into project_members values
(
	95,
	'IIT2014079'
);

insert into project_members values
(
	96,
	'IIT2014040'
);

insert into project_members values
(
	96,
	'IIT2014107'
);

insert into project_members values
(
	96,
	'IIT2014102'
);

insert into project_members values
(
	96,
	'IIT2014120'
);

insert into project_members values
(
	97,
	'IIT2014016'
);

insert into project_members values
(
	97,
	'IIT2014043'
);

insert into project_members values
(
	97,
	'IIT2014009'
);

insert into project_members values
(
	97,
	'IIT2014136'
);

insert into project_members values
(
	98,
	'IIT2014008'
);

insert into project_members values
(
	98,
	'IIT2014061'
);

insert into project_members values
(
	99,
	'IIT2014023'
);

insert into project_members values
(
	99,
	'IIT2014071'
);

insert into project_members values
(
	99,
	'IIT2014001'
);

insert into project_members values
(
	100,
	'IIT2014088'
);

insert into project_members values
(
	101,
	'IIT2014002'
);

insert into project_members values
(
	101,
	'IIT2014005'
);

insert into project_members values
(
	101,
	'IIT2014020'
);

insert into project_members values
(
	101,
	'IIT2014052'
);

insert into project_members values
(
	101,
	'IIT2014099'
);

insert into project_members values
(
	102,
	'IIT2014021'
);

insert into project_members values
(
	102,
	'IIT2014073'
);

insert into project_members values
(
	102,
	'IIT2014128'
);

insert into project_members values
(
	102,
	'IIT2014131'
);

insert into project_members values
(
	102,
	'IIT2014132'
);

insert into project_members values
(
	103,
	'IIT2014138'
);

insert into project_members values
(
	103,
	'IIT2014140'
);

insert into project_members values
(
	103,
	'IIT2014143'
);

insert into project_members values
(
	103,
	'IIT2014048'
);

insert into project_members values
(
	104,
	'IIT2014007'
);

insert into project_members values
(
	104,
	'IIT2014081'
);

insert into project_members values
(
	104,
	'IIT2014027'
);

insert into project_members values
(
	104,
	'IIT2014042'
);

insert into project_members values
(
	105,
	'IIT2014113'
);

insert into project_members values
(
	105,
	'IIT2014036'
);

insert into project_members values
(
	105,
	'IIT2014075'
);

insert into project_members values
(
	106,
	'IIT2014044'
);

insert into project_members values
(
	106,
	'IIT2014013'
);

insert into project_members values
(
	106,
	'IIT2014014'
);

insert into project_members values
(
	106,
	'IIT2014039'
);

insert into project_members values
(
	107,
	'IIT2014139'
);

insert into project_members values
(
	107,
	'IIT2014101'
);

insert into project_members values
(
	107,
	'IIT2014067'
);

insert into project_members values
(
	107,
	'IIT2014050'
);

insert into project_members values
(
	107,
	'IIT2014089'
);

insert into project_members values
(
	108,
	'IIT2014041'
);

insert into project_members values
(
	108,
	'IIT2014078'
);

insert into project_members values
(
	108,
	'IIT2014111'
);

insert into project_members values
(
	108,
	'IIT2014094'
);

insert into project_members values
(
	109,
	'IIT2014129'
);

insert into project_members values
(
	110,
	'IIT2014074'
);

insert into project_members values
(
	111,
	'IIT2014015'
);

insert into project_members values
(
	111,
	'IIT2014006'
);

insert into project_members values
(
	112,
	'IIT2014126'
);

insert into project_members values
(
	112,
	'IIT2014112'
);

insert into project_members values
(
	113,
	'IIT2014068'
);

insert into project_members values
(
	113,
	'IIT2014024'
);

insert into project_members values
(
	113,
	'IIT2014095'
);

insert into project_members values
(
	113,
	'IIT2014049'
);

insert into project_members values
(
	113,
	'IIT2014057'
);

insert into project_members values
(
	114,
	'IIT2014019'
);

insert into project_members values
(
	114,
	'IIT2014122'
);

insert into project_members values
(
	114,
	'IIT2014104'
);

insert into project_members values
(
	114,
	'IIT2014004'
);

insert into project_members values
(
	114,
	'IIT2014150'
);

insert into project_members values
(
	115,
	'IIT2014149'
);

insert into project_members values
(
	115,
	'IIT2014018'
);

insert into project_members values
(
	115,
	'IIT2014119'
);

insert into project_members values
(
	115,
	'IIT2014012'
);

insert into project_members values
(
	116,
	'IIT2014047'
);

insert into project_members values
(
	116,
	'IIT2014065'
);

insert into project_members values
(
	116,
	'IIT2014147'
);

insert into project_members values
(
	116,
	'IIT2014069'
);

insert into project_members values
(
	116,
	'IIT2014114'
);

insert into project_members values
(
	117,
	'IIT2014063'
);

insert into project_members values
(
	118,
	'IIT2014010'
);

insert into project_members values
(
	118,
	'IIT2014056'
);

insert into project_members values
(
	119,
	'IIT2014045'
);

insert into project_members values
(
	119,
	'IIT2014084'
);

insert into project_members values
(
	120,
	'IIT2014130'
);

insert into project_members values
(
	120,
	'IIT2014062'
);

insert into project_members values
(
	120,
	'IIT2014091'
);

insert into project_members values
(
	120,
	'IIT2014053'
);

insert into project_members values
(
	120,
	'IIT2014026'
);

insert into project_members values
(
	121,
	'IIT2014093'
);

insert into project_members values
(
	121,
	'IIT2014125'
);

insert into project_members values
(
	121,
	'IIT2014034'
);

insert into project_members values
(
	122,
	'IIT2014060'
);

insert into project_members values
(
	122,
	'IIT2014085'
);

insert into project_members values
(
	123,
	'IIT2014025'
);

insert into project_members values
(
	123,
	'IIT2014072'
);

insert into project_members values
(
	124,
	'IIT2014059'
);

insert into project_members values
(
	124,
	'IIT2014103'
);

insert into project_members values
(
	124,
	'IIT2014127'
);

insert into project_members values
(
	124,
	'IIT2014080'
);

insert into project_members values
(
	125,
	'IIT2014145'
);

insert into project_members values
(
	125,
	'IIT2014135'
);

insert into project_members values
(
	125,
	'IIT2014133'
);

insert into project_members values
(
	125,
	'IIT2014146'
);

insert into project_members values
(
	126,
	'IIT2014087'
);

insert into project_members values
(
	126,
	'IIT2014086'
);

insert into project_members values
(
	126,
	'IIT2014144'
);

insert into project_members values
(
	127,
	'IIT2014092'
);

insert into project_members values
(
	127,
	'IIT2014030'
);

insert into project_members values
(
	127,
	'IIT2014051'
);

insert into project_members values
(
	127,
	'IIT2014031'
);

insert into project_members values
(
	128,
	'IIT2014035'
);

insert into project_members values
(
	129,
	'IIT2014037'
);

insert into project_members values
(
	129,
	'IIT2014054'
);

insert into project_members values
(
	130,
	'IIT2014055'
);

insert into project_members values
(
	131,
	'IIT2014077'
);

insert into project_members values
(
	131,
	'IIT2014098'
);

insert into project_members values
(
	131,
	'IIT2014100'
);

insert into project_members values
(
	131,
	'IIT2014105'
);

insert into project_members values
(
	132,
	'IIT2014110'
);

insert into project_members values
(
	132,
	'IIT2014115'
);

insert into project_members values
(
	132,
	'IIT2014116'
);

insert into project_members values
(
	132,
	'IIT2014117'
);

insert into project_members values
(
	133,
	'IIT2014121'
);

insert into project_members values
(
	133,
	'IIT2014141'
);

insert into project_members values
(
	133,
	'IIT2014148'
);

insert into project_members values
(
	133,
	'IIT2014151'
);

insert into project_members values
(
	133,
	'IIT2014152'
);

insert into project_members values
(
	134,
	'IIT2014153'
);

insert into project_members values
(
	134,
	'IIT2014154'
);

insert into project_members values
(
	134,
	'IIT2014155'
);

insert into project_members values
(
	135,
	'IIT2014156'
);

insert into project_members values
(
	135,
	'IIT2014157'
);

insert into project_members values
(
	135,
	'IIT2014158'
);

insert into project_members values
(
	135,
	'IIT2014159'
);

insert into project_members values
(
	135,
	'IIT2014160'
);

insert into project_members values
(
	136,
	'IIT2014161'
);

insert into project_members values
(
	137,
	'IIT2014162'
);

insert into project_members values
(
	137,
	'IIT2014163'
);

insert into project_members values
(
	137,
	'IIT2014164'
);

insert into project_members values
(
	137,
	'IIT2014165'
);

insert into project_members values
(
	137,
	'IIT2014501'
);

insert into project_members values
(
	138,
	'IIT2014502'
);

insert into project_members values
(
	138,
	'IIT2014503'
);

insert into project_members values
(
	138,
	'IIT2014504'
);

insert into project_members values
(
	138,
	'IIT2014505'
);

insert into project_members values
(
	139,
	'IIT2014506'
);

insert into project_members values
(
	139,
	'IIT2014507'
);

insert into project_members values
(
	140,
	'IIT2014508'
);

insert into project_members values
(
	140,
	'IIT2015001'
);

insert into project_members values
(
	140,
	'IIT2015002'
);

insert into project_members values
(
	140,
	'IIT2015003'
);

insert into project_members values
(
	141,
	'IIT2015004'
);

insert into project_members values
(
	141,
	'IIT2015005'
);

insert into project_members values
(
	141,
	'IIT2015006'
);

insert into project_members values
(
	142,
	'IIT2015007'
);

insert into project_members values
(
	142,
	'IIT2015008'
);

insert into project_members values
(
	143,
	'IIT2015009'
);

insert into project_members values
(
	144,
	'IIT2015010'
);

insert into project_members values
(
	144,
	'IIT2015011'
);

insert into project_members values
(
	144,
	'IIT2015012'
);

insert into project_members values
(
	144,
	'IIT2015013'
);

insert into project_members values
(
	145,
	'IIT2015014'
);

insert into project_members values
(
	145,
	'IIT2015015'
);

insert into project_members values
(
	145,
	'IIT2015016'
);

insert into project_members values
(
	146,
	'IIT2015017'
);

insert into project_members values
(
	147,
	'IIT2015018'
);

insert into project_members values
(
	147,
	'IIT2015019'
);

insert into project_members values
(
	147,
	'IIT2015020'
);

insert into project_members values
(
	147,
	'IIT2015021'
);

insert into project_members values
(
	148,
	'IIT2015022'
);

insert into project_members values
(
	148,
	'IIT2015023'
);

insert into project_members values
(
	148,
	'IIT2015024'
);

insert into project_members values
(
	148,
	'IIT2015025'
);

insert into project_members values
(
	149,
	'IIT2015026'
);

insert into project_members values
(
	149,
	'IIT2015027'
);

insert into project_members values
(
	149,
	'IIT2015028'
);

insert into project_members values
(
	150,
	'IIT2015029'
);

insert into project_members values
(
	150,
	'IIT2015030'
);

insert into project_members values
(
	151,
	'IIT2015031'
);

insert into project_members values
(
	152,
	'IIT2015032'
);

insert into project_members values
(
	152,
	'IIT2015033'
);

insert into project_members values
(
	153,
	'IIT2015034'
);

insert into project_members values
(
	153,
	'IIT2015035'
);

insert into project_members values
(
	153,
	'IIT2015036'
);

insert into project_members values
(
	153,
	'IIT2015038'
);

insert into project_members values
(
	153,
	'IIT2015039'
);

insert into project_members values
(
	154,
	'IIT2015040'
);

insert into project_members values
(
	154,
	'IIT2015041'
);

insert into project_members values
(
	154,
	'IIT2015042'
);

insert into project_members values
(
	155,
	'IIT2015043'
);

insert into project_members values
(
	156,
	'IIT2015044'
);

insert into project_members values
(
	156,
	'IIT2015045'
);

insert into project_members values
(
	157,
	'IIT2015046'
);

insert into project_members values
(
	158,
	'IIT2015047'
);

insert into project_members values
(
	158,
	'IIT2015048'
);

insert into project_members values
(
	158,
	'IIT2015049'
);

insert into project_members values
(
	158,
	'IIT2015050'
);

insert into project_members values
(
	159,
	'IIT2015051'
);

insert into project_members values
(
	159,
	'IIT2015052'
);

insert into project_members values
(
	159,
	'IIT2015053'
);

insert into project_members values
(
	159,
	'IIT2015054'
);

insert into project_members values
(
	160,
	'IIT2015055'
);

insert into project_members values
(
	160,
	'IIT2015056'
);

insert into project_members values
(
	160,
	'IIT2015057'
);

insert into project_members values
(
	161,
	'IIT2015058'
);

insert into project_members values
(
	161,
	'IIT2015059'
);

insert into project_members values
(
	161,
	'IIT2015060'
);

insert into project_members values
(
	161,
	'IIT2015062'
);

insert into project_members values
(
	161,
	'IIT2015063'
);

insert into project_members values
(
	162,
	'IIT2015064'
);

insert into project_members values
(
	162,
	'IIT2015065'
);

insert into project_members values
(
	162,
	'IIT2015066'
);

insert into project_members values
(
	162,
	'IIT2015067'
);

insert into project_members values
(
	162,
	'IIT2015068'
);

insert into project_members values
(
	163,
	'IIT2015069'
);

insert into project_members values
(
	163,
	'IIT2015070'
);

insert into project_members values
(
	164,
	'IIT2015071'
);

insert into project_members values
(
	164,
	'IIT2015072'
);

insert into project_members values
(
	164,
	'IIT2015073'
);

insert into project_members values
(
	164,
	'IIT2015074'
);

insert into project_members values
(
	165,
	'IIT2015075'
);

insert into project_members values
(
	165,
	'IIT2015076'
);

insert into project_members values
(
	165,
	'IIT2015077'
);

insert into project_members values
(
	165,
	'IIT2015078'
);

insert into project_members values
(
	165,
	'IIT2015079'
);

insert into project_members values
(
	166,
	'IIT2015080'
);

insert into project_members values
(
	166,
	'IIT2015081'
);

insert into project_members values
(
	166,
	'IIT2015082'
);

insert into project_members values
(
	166,
	'IIT2015083'
);

insert into project_members values
(
	166,
	'IIT2015084'
);

insert into project_members values
(
	167,
	'IIT2015085'
);

insert into project_members values
(
	167,
	'IIT2015086'
);

insert into project_members values
(
	167,
	'IIT2015087'
);

insert into project_members values
(
	168,
	'IIT2015088'
);

insert into project_members values
(
	168,
	'IIT2015089'
);

insert into project_members values
(
	169,
	'IIT2015090'
);

insert into project_members values
(
	169,
	'IIT2015091'
);

insert into project_members values
(
	169,
	'IIT2015092'
);

insert into project_members values
(
	169,
	'IIT2015093'
);

insert into project_members values
(
	170,
	'IIT2015094'
);

insert into project_members values
(
	170,
	'IIT2015095'
);

insert into project_members values
(
	170,
	'IIT2015096'
);

insert into project_members values
(
	170,
	'IIT2015097'
);

insert into project_members values
(
	170,
	'IIT2015099'
);

insert into project_members values
(
	171,
	'IIT2015101'
);

insert into project_members values
(
	171,
	'IIT2015102'
);

insert into project_members values
(
	171,
	'IIT2015103'
);

insert into project_members values
(
	171,
	'IIT2015104'
);

insert into project_members values
(
	172,
	'IIT2015105'
);

insert into project_members values
(
	172,
	'IIT2015106'
);

insert into project_members values
(
	172,
	'IIT2015107'
);

insert into project_members values
(
	172,
	'IIT2015108'
);

insert into project_members values
(
	172,
	'IIT2015109'
);

insert into project_members values
(
	173,
	'IIT2015110'
);

insert into project_members values
(
	174,
	'IIT2015111'
);

insert into project_members values
(
	175,
	'IIT2015112'
);

insert into project_members values
(
	176,
	'IIT2015113'
);

insert into project_members values
(
	176,
	'IIT2015114'
);

insert into project_members values
(
	176,
	'IIT2015115'
);

insert into project_members values
(
	176,
	'IIT2015116'
);

insert into project_members values
(
	176,
	'IIT2015117'
);

insert into project_members values
(
	177,
	'IIT2015118'
);

insert into project_members values
(
	177,
	'IIT2015119'
);

insert into project_members values
(
	177,
	'IIT2015120'
);

insert into project_members values
(
	177,
	'IIT2015121'
);

insert into project_members values
(
	177,
	'IIT2015122'
);

insert into project_members values
(
	178,
	'IIT2015123'
);

insert into project_members values
(
	179,
	'IIT2015124'
);

insert into project_members values
(
	179,
	'IIT2015125'
);

insert into project_members values
(
	179,
	'IIT2015126'
);

insert into project_members values
(
	179,
	'IIT2015127'
);

insert into project_members values
(
	180,
	'IIT2015128'
);

insert into project_members values
(
	180,
	'IIT2015129'
);

insert into project_members values
(
	180,
	'IIT2015130'
);

insert into project_members values
(
	180,
	'IIT2015131'
);

insert into project_members values
(
	181,
	'IIT2015132'
);

insert into project_members values
(
	181,
	'IIT2015133'
);

insert into project_members values
(
	181,
	'IIT2015134'
);

insert into project_members values
(
	181,
	'IIT2015136'
);

insert into project_members values
(
	181,
	'IIT2015137'
);

insert into project_members values
(
	182,
	'IIT2013001'
);

insert into project_members values
(
	182,
	'IIT2013002'
);

insert into project_members values
(
	182,
	'IIT2013003'
);

insert into project_members values
(
	182,
	'IIT2013004'
);

insert into project_members values
(
	183,
	'IIT2013005'
);

insert into project_members values
(
	183,
	'IIT2013006'
);

insert into project_members values
(
	183,
	'IIT2013007'
);

insert into project_members values
(
	183,
	'IIT2013008'
);

insert into project_members values
(
	184,
	'IIT2013009'
);

insert into project_members values
(
	184,
	'IIT2013010'
);

insert into project_members values
(
	184,
	'IIT2013011'
);

insert into project_members values
(
	184,
	'IIT2013012'
);

insert into project_members values
(
	185,
	'IIT2013013'
);

insert into project_members values
(
	185,
	'IIT2013015'
);

insert into project_members values
(
	185,
	'IIT2013016'
);

insert into project_members values
(
	186,
	'IIT2013017'
);

insert into project_members values
(
	186,
	'IIT2013019'
);

insert into project_members values
(
	186,
	'IIT2013020'
);

insert into project_members values
(
	186,
	'IIT2013022'
);

insert into project_members values
(
	186,
	'IIT2013023'
);

insert into project_members values
(
	187,
	'IIT2013024'
);

insert into project_members values
(
	187,
	'IIT2013025'
);

insert into project_members values
(
	187,
	'IIT2013026'
);

insert into project_members values
(
	187,
	'IIT2013027'
);

insert into project_members values
(
	187,
	'IIT2013028'
);

insert into project_members values
(
	188,
	'IIT2013029'
);

insert into project_members values
(
	188,
	'IIT2013030'
);

insert into project_members values
(
	188,
	'IIT2013031'
);

insert into project_members values
(
	188,
	'IIT2013032'
);

insert into project_members values
(
	189,
	'IIT2013033'
);

insert into project_members values
(
	190,
	'IIT2013034'
);

insert into project_members values
(
	190,
	'IIT2013035'
);

insert into project_members values
(
	190,
	'IIT2013036'
);

insert into project_members values
(
	190,
	'IIT2013037'
);

insert into project_members values
(
	190,
	'IIT2013038'
);

insert into project_members values
(
	191,
	'IIT2013039'
);

insert into project_members values
(
	191,
	'IIT2013040'
);

insert into project_members values
(
	191,
	'IIT2013041'
);

insert into project_members values
(
	192,
	'IIT2013042'
);

insert into project_members values
(
	192,
	'IIT2013043'
);

insert into project_members values
(
	193,
	'IIT2013044'
);

insert into project_members values
(
	193,
	'IIT2013045'
);

insert into project_members values
(
	193,
	'IIT2013046'
);

insert into project_members values
(
	193,
	'IIT2013047'
);

insert into project_members values
(
	194,
	'IIT2013048'
);

insert into project_members values
(
	194,
	'IIT2013049'
);

insert into project_members values
(
	194,
	'IIT2013050'
);

insert into project_members values
(
	194,
	'IIT2013051'
);

insert into project_members values
(
	194,
	'IIT2013052'
);

insert into project_members values
(
	195,
	'IIT2013053'
);

insert into project_members values
(
	196,
	'IIT2013054'
);

insert into project_members values
(
	196,
	'IIT2013055'
);

insert into project_members values
(
	196,
	'IIT2013056'
);

insert into project_members values
(
	197,
	'IIT2013057'
);

insert into project_members values
(
	197,
	'IIT2013058'
);

insert into project_members values
(
	198,
	'IIT2013059'
);

insert into project_members values
(
	198,
	'IIT2013060'
);

insert into project_members values
(
	199,
	'IIT2013061'
);

insert into project_members values
(
	199,
	'IIT2013062'
);

insert into project_members values
(
	199,
	'IIT2013063'
);

insert into project_members values
(
	199,
	'IIT2013064'
);

insert into project_members values
(
	199,
	'IIT2013065'
);

insert into project_members values
(
	200,
	'IIT2013066'
);

insert into project_members values
(
	201,
	'RIT2013001'
);

insert into project_members values
(
	202,
	'RIT2013002'
);

insert into project_members values
(
	202,
	'RIT2013003'
);

insert into project_members values
(
	202,
	'RIT2013004'
);

insert into project_members values
(
	202,
	'RIT2013005'
);

insert into project_members values
(
	203,
	'RIT2013007'
);

insert into project_members values
(
	203,
	'RIT2013008'
);

insert into project_members values
(
	203,
	'RIT2013009'
);

insert into project_members values
(
	204,
	'RIT2013010'
);

insert into project_members values
(
	204,
	'RIT2013011'
);

insert into project_members values
(
	204,
	'RIT2013012'
);

insert into project_members values
(
	204,
	'RIT2013013'
);

insert into project_members values
(
	204,
	'RIT2013015'
);

insert into project_members values
(
	205,
	'RIT2013016'
);

insert into project_members values
(
	205,
	'RIT2013017'
);

insert into project_members values
(
	206,
	'RIT2013018'
);

insert into project_members values
(
	207,
	'RIT2013019'
);

insert into project_members values
(
	207,
	'RIT2013020'
);

insert into project_members values
(
	208,
	'RIT2013021'
);

insert into project_members values
(
	208,
	'RIT2013022'
);

insert into project_members values
(
	208,
	'RIT2013023'
);

insert into project_members values
(
	209,
	'RIT2013024'
);

insert into project_members values
(
	209,
	'RIT2013025'
);

insert into project_members values
(
	209,
	'RIT2013026'
);

insert into project_members values
(
	210,
	'RIT2013027'
);

insert into project_members values
(
	210,
	'RIT2013028'
);

insert into project_members values
(
	210,
	'RIT2013029'
);

insert into project_members values
(
	210,
	'RIT2013030'
);

insert into project_members values
(
	211,
	'RIT2013032'
);

insert into project_members values
(
	211,
	'RIT2013033'
);

insert into project_members values
(
	211,
	'RIT2013034'
);

insert into project_members values
(
	211,
	'RIT2013035'
);

insert into project_members values
(
	212,
	'RIT2013036'
);

insert into project_members values
(
	212,
	'RIT2013037'
);

insert into project_members values
(
	212,
	'RIT2013038'
);

insert into project_members values
(
	212,
	'RIT2013039'
);

insert into project_members values
(
	212,
	'RIT2013040'
);

insert into project_members values
(
	213,
	'RIT2013041'
);

insert into project_members values
(
	213,
	'RIT2013042'
);

insert into project_members values
(
	214,
	'RIT2013043'
);

insert into project_members values
(
	214,
	'RIT2013044'
);

insert into project_members values
(
	214,
	'RIT2013045'
);

insert into project_members values
(
	215,
	'RIT2013046'
);

insert into project_members values
(
	215,
	'RIT2013047'
);

insert into project_members values
(
	216,
	'RIT2013048'
);

insert into project_members values
(
	216,
	'RIT2013049'
);

insert into project_members values
(
	216,
	'RIT2013050'
);

insert into project_members values
(
	217,
	'RIT2013051'
);

insert into project_members values
(
	217,
	'RIT2013052'
);

insert into project_members values
(
	217,
	'RIT2013053'
);

insert into project_members values
(
	218,
	'RIT2013054'
);

insert into project_members values
(
	218,
	'RIT2013055'
);

insert into project_members values
(
	218,
	'RIT2013056'
);

insert into project_members values
(
	218,
	'RIT2013057'
);

insert into project_members values
(
	219,
	'RIT2013058'
);

insert into project_members values
(
	219,
	'RIT2013059'
);

insert into project_members values
(
	219,
	'RIT2013060'
);

insert into project_members values
(
	219,
	'RIT2013061'
);

insert into project_members values
(
	220,
	'RIT2013062'
);

insert into project_members values
(
	221,
	'RIT2013063'
);

insert into project_members values
(
	221,
	'RIT2013064'
);

insert into project_members values
(
	222,
	'RIT2013065'
);

insert into project_members values
(
	222,
	'RIT2013066'
);

insert into project_members values
(
	222,
	'RIT2013067'
);

insert into project_members values
(
	222,
	'RIT2013068'
);

insert into project_members values
(
	223,
	'RIT2013069'
);

insert into project_members values
(
	223,
	'RIT2013070'
);

insert into project_members values
(
	224,
	'RIT2013071'
);

insert into project_members values
(
	224,
	'RIT2013072'
);

insert into project_members values
(
	224,
	'RIT2013073'
);

insert into project_members values
(
	225,
	'RIT2013074'
);

insert into project_members values
(
	225,
	'RIT2013075'
);

insert into project_members values
(
	225,
	'RIT2013076'
);

insert into project_members values
(
	225,
	'RIT2013077'
);

insert into project_members values
(
	226,
	'RIT2013078'
);

insert into project_members values
(
	226,
	'RIT2013079'
);

insert into project_members values
(
	226,
	'RIT2013080'
);

insert into project_members values
(
	227,
	'RIT2013081'
);

insert into project_members values
(
	228,
	'RIT2013082'
);

insert into project_members values
(
	229,
	'RIT2013083'
);

insert into project_members values
(
	229,
	'RIT2013084'
);

insert into project_members values
(
	229,
	'RIT2013085'
);

insert into project_members values
(
	229,
	'RIT2013086'
);

insert into project_members values
(
	229,
	'RIT2013087'
);

insert into project_members values
(
	230,
	'RIT2013088'
);

insert into project_members values
(
	230,
	'RIT2014030'
);

insert into project_members values
(
	230,
	'RIT2014033'
);

insert into project_members values
(
	231,
	'RIT2014001'
);

insert into project_members values
(
	231,
	'RIT2014062'
);

insert into project_members values
(
	231,
	'RIT2014039'
);

insert into project_members values
(
	232,
	'RIT2014008'
);

insert into project_members values
(
	232,
	'RIT2014060'
);

insert into project_members values
(
	232,
	'RIT2014020'
);

insert into project_members values
(
	232,
	'RIT2014028'
);

insert into project_members values
(
	233,
	'RIT2014048'
);

insert into project_members values
(
	233,
	'RIT2014059'
);

insert into project_members values
(
	233,
	'RIT2014055'
);

insert into project_members values
(
	233,
	'RIT2014007'
);

insert into project_members values
(
	234,
	'RIT2014014'
);

insert into project_members values
(
	234,
	'RIT2014063'
);

insert into project_members values
(
	234,
	'RIT2014018'
);

insert into project_members values
(
	234,
	'RIT2014047'
);

insert into project_members values
(
	234,
	'RIT2014035'
);

insert into project_members values
(
	235,
	'RIT2014050'
);

insert into project_members values
(
	235,
	'RIT2014057'
);

insert into project_members values
(
	235,
	'RIT2014034'
);

insert into project_members values
(
	236,
	'RIT2014043'
);

insert into project_members values
(
	236,
	'RIT2014004'
);

insert into project_members values
(
	236,
	'RIT2014046'
);

insert into project_members values
(
	236,
	'RIT2014042'
);

insert into project_members values
(
	237,
	'RIT2014054'
);

insert into project_members values
(
	237,
	'RIT2014045'
);

insert into project_members values
(
	237,
	'RIT2014017'
);

insert into project_members values
(
	238,
	'RIT2014011'
);

insert into project_members values
(
	238,
	'RIT2014013'
);

insert into project_members values
(
	238,
	'RIT2014012'
);

insert into project_members values
(
	238,
	'RIT2014052'
);

insert into project_members values
(
	238,
	'RIT2014021'
);

insert into project_members values
(
	239,
	'RIT2014006'
);

insert into project_members values
(
	240,
	'RIT2014009'
);

insert into project_members values
(
	240,
	'RIT2014024'
);

insert into project_members values
(
	240,
	'RIT2014044'
);

insert into project_members values
(
	241,
	'RIT2014051'
);

insert into project_members values
(
	241,
	'RIT2014022'
);

insert into project_members values
(
	242,
	'RIT2014027'
);

insert into project_members values
(
	242,
	'RIT2014032'
);

insert into project_members values
(
	242,
	'RIT2014037'
);

insert into project_members values
(
	243,
	'RIT2014041'
);

insert into project_members values
(
	243,
	'RIT2014031'
);

insert into project_members values
(
	244,
	'RIT2014058'
);

insert into project_members values
(
	244,
	'RIT2014010'
);

insert into project_members values
(
	245,
	'RIT2014003'
);

insert into project_members values
(
	245,
	'RIT2014029'
);

insert into project_members values
(
	245,
	'RIT2014015'
);

insert into project_members values
(
	246,
	'RIT2014016'
);

insert into project_members values
(
	246,
	'RIT2014049'
);

insert into project_members values
(
	246,
	'RIT2014061'
);

insert into project_members values
(
	246,
	'RIT2014002'
);

insert into project_members values
(
	246,
	'RIT2014005'
);

insert into project_members values
(
	247,
	'RIT2014019'
);

insert into project_members values
(
	247,
	'RIT2014023'
);

insert into project_members values
(
	248,
	'RIT2014025'
);

insert into project_members values
(
	249,
	'RIT2014026'
);

insert into project_members values
(
	249,
	'RIT2014036'
);

insert into project_members values
(
	250,
	'RIT2014038'
);

insert into project_members values
(
	250,
	'RIT2014040'
);

insert into project_members values
(
	250,
	'RIT2014053'
);

insert into project_members values
(
	251,
	'RIT2014056'
);

insert into project_members values
(
	251,
	'RIT2014064'
);

insert into project_members values
(
	251,
	'RIT2014067'
);

insert into project_members values
(
	251,
	'RIT2014073'
);

insert into project_members values
(
	252,
	'RIT2014078'
);

insert into project_members values
(
	252,
	'RIT2014076'
);

insert into project_members values
(
	252,
	'RIT2014083'
);

insert into project_members values
(
	252,
	'RIT2014074'
);

insert into project_members values
(
	252,
	'RIT2014066'
);

insert into project_members values
(
	253,
	'RIT2014068'
);

insert into project_members values
(
	253,
	'RIT2014079'
);

insert into project_members values
(
	253,
	'RIT2014072'
);

insert into project_members values
(
	254,
	'RIT2014090'
);

insert into project_members values
(
	254,
	'RIT2014084'
);

insert into project_members values
(
	254,
	'RIT2014081'
);

insert into project_members values
(
	255,
	'RIT2014089'
);

insert into project_members values
(
	255,
	'RIT2014088'
);

insert into project_members values
(
	255,
	'RIT2014080'
);

insert into project_members values
(
	255,
	'RIT2014085'
);

insert into project_members values
(
	255,
	'RIT2014092'
);

insert into project_members values
(
	256,
	'RIT2014091'
);

insert into project_members values
(
	256,
	'RIT2014075'
);

insert into project_members values
(
	256,
	'RIT2014082'
);

insert into project_members values
(
	256,
	'RIT2014065'
);

insert into project_members values
(
	256,
	'RIT2014077'
);

insert into project_members values
(
	257,
	'RIT2014087'
);

insert into project_members values
(
	257,
	'RIT2014086'
);

insert into project_members values
(
	257,
	'RIT2015001'
);

insert into project_members values
(
	257,
	'RIT2015002'
);

insert into project_members values
(
	258,
	'RIT2015003'
);

insert into project_members values
(
	258,
	'RIT2015004'
);

insert into project_members values
(
	258,
	'RIT2015005'
);

insert into project_members values
(
	258,
	'RIT2015006'
);

insert into project_members values
(
	258,
	'RIT2015007'
);

insert into project_members values
(
	259,
	'RIT2015008'
);

insert into project_members values
(
	259,
	'RIT2015009'
);

insert into project_members values
(
	259,
	'RIT2015010'
);

insert into project_members values
(
	259,
	'RIT2015011'
);

insert into project_members values
(
	259,
	'RIT2015012'
);

insert into project_members values
(
	260,
	'RIT2015013'
);

insert into project_members values
(
	260,
	'RIT2015014'
);

insert into project_members values
(
	261,
	'RIT2015015'
);

insert into project_members values
(
	261,
	'RIT2015016'
);

insert into project_members values
(
	261,
	'RIT2015017'
);

insert into project_members values
(
	262,
	'RIT2015018'
);

insert into project_members values
(
	262,
	'RIT2015019'
);

insert into project_members values
(
	262,
	'RIT2015020'
);

insert into project_members values
(
	262,
	'RIT2015021'
);

insert into project_members values
(
	262,
	'RIT2015022'
);

insert into project_members values
(
	263,
	'RIT2015023'
);

insert into project_members values
(
	263,
	'RIT2015024'
);

insert into project_members values
(
	264,
	'RIT2015025'
);

insert into project_members values
(
	264,
	'RIT2015026'
);

insert into project_members values
(
	264,
	'RIT2015027'
);

insert into project_members values
(
	264,
	'RIT2015028'
);

insert into project_members values
(
	265,
	'RIT2015029'
);

insert into project_members values
(
	265,
	'RIT2015030'
);

insert into project_members values
(
	265,
	'RIT2015031'
);

insert into project_members values
(
	265,
	'RIT2015032'
);

insert into project_members values
(
	265,
	'RIT2015033'
);

insert into project_members values
(
	266,
	'RIT2015034'
);

insert into project_members values
(
	266,
	'RIT2015035'
);

insert into project_members values
(
	267,
	'RIT2015036'
);

insert into project_members values
(
	267,
	'RIT2015037'
);

insert into project_members values
(
	268,
	'RIT2015038'
);

insert into project_members values
(
	268,
	'RIT2015039'
);

insert into project_members values
(
	268,
	'RIT2015040'
);

insert into project_members values
(
	268,
	'RIT2015041'
);

insert into project_members values
(
	268,
	'RIT2015042'
);

insert into project_members values
(
	269,
	'RIT2015043'
);

insert into project_members values
(
	269,
	'RIT2015044'
);

insert into project_members values
(
	269,
	'RIT2015045'
);

insert into project_members values
(
	269,
	'RIT2015046'
);

insert into project_members values
(
	270,
	'RIT2015047'
);

insert into project_members values
(
	270,
	'RIT2015048'
);

insert into project_members values
(
	271,
	'RIT2015049'
);

insert into project_members values
(
	272,
	'RIT2015050'
);

insert into project_members values
(
	272,
	'RIT2015051'
);

insert into project_members values
(
	273,
	'RIT2015052'
);

insert into project_members values
(
	273,
	'RIT2015053'
);

insert into project_members values
(
	273,
	'RIT2015054'
);

insert into project_members values
(
	274,
	'RIT2015055'
);

insert into project_members values
(
	274,
	'RIT2015056'
);

insert into project_members values
(
	274,
	'RIT2015057'
);

insert into project_members values
(
	274,
	'RIT2015058'
);

insert into project_members values
(
	275,
	'RIT2015059'
);

insert into project_members values
(
	275,
	'RIT2015060'
);

insert into project_members values
(
	275,
	'RIT2015061'
);

insert into project_members values
(
	275,
	'RIT2015062'
);

insert into project_members values
(
	275,
	'RIT2015063'
);

insert into project_members values
(
	276,
	'RIT2015064'
);

insert into project_members values
(
	277,
	'RIT2015065'
);

insert into project_members values
(
	277,
	'RIT2015066'
);

insert into project_members values
(
	277,
	'RIT2015067'
);

insert into project_members values
(
	278,
	'RIT2015068'
);

insert into project_members values
(
	278,
	'RIT2015069'
);

insert into project_members values
(
	278,
	'RIT2015070'
);

insert into project_members values
(
	278,
	'RIT2015071'
);

insert into project_members values
(
	278,
	'RIT2015072'
);

insert into project_members values
(
	279,
	'RIT2015073'
);

insert into project_members values
(
	279,
	'RIT2015074'
);

insert into project_members values
(
	279,
	'RIT2015075'
);

insert into project_members values
(
	280,
	'RIT2015076'
);

insert into project_members values
(
	280,
	'RIT2015077'
);

insert into project_members values
(
	281,
	'RIT2015078'
);

insert into project_members values
(
	281,
	'RIT2015079'
);

insert into project_members values
(
	281,
	'RIT2015080'
);

insert into project_members values
(
	281,
	'RIT2015081'
);

insert into project_members values
(
	281,
	'RIT2015082'
);

insert into project_members values
(
	282,
	'RIT2015083'
);

insert into project_members values
(
	282,
	'RIT2015084'
);

insert into project_members values
(
	282,
	'RIT2015085'
);

insert into project_members values
(
	283,
	'RIT2015086'
);

insert into project_members values
(
	283,
	'RIT2015088'
);

insert into project_members values
(
	283,
	'RIT2015089'
);

insert into project_members values
(
	283,
	'RIT2012050'
);

insert into project_members values
(
	284,
	'IIT2014017'
);

insert into project_members values
(
	284,
	'IIT2014032'
);

insert into project_members values
(
	284,
	'IIT2014046'
);

insert into project_members values
(
	284,
	'IIT2014011'
);

insert into project_members values
(
	285,
	'IIT2014108'
);

insert into project_members values
(
	285,
	'IIT2014137'
);

insert into project_members values
(
	285,
	'IIT2014109'
);

insert into project_members values
(
	285,
	'IIT2014066'
);

insert into project_members values
(
	285,
	'IIT2014106'
);

insert into project_members values
(
	286,
	'IIT2014033'
);

insert into project_members values
(
	286,
	'IIT2014096'
);

insert into project_members values
(
	286,
	'IIT2014022'
);

insert into project_members values
(
	287,
	'IIT2014038'
);

insert into project_members values
(
	287,
	'IIT2014064'
);

insert into project_members values
(
	287,
	'IIT2014142'
);

insert into project_members values
(
	288,
	'IIT2014083'
);

insert into project_members values
(
	288,
	'IIT2014134'
);

insert into project_members values
(
	289,
	'IIT2014097'
);

insert into project_members values
(
	289,
	'IIT2014003'
);

insert into project_members values
(
	290,
	'IIT2014029'
);

insert into project_members values
(
	291,
	'IIT2014058'
);

insert into project_members values
(
	291,
	'IIT2014082'
);

insert into project_members values
(
	291,
	'IIT2014070'
);

insert into project_members values
(
	291,
	'IIT2014123'
);

insert into project_members values
(
	292,
	'IIT2014090'
);

insert into project_members values
(
	292,
	'IIT2014118'
);

insert into project_members values
(
	292,
	'IIT2014079'
);

insert into project_members values
(
	292,
	'IIT2014040'
);

insert into project_members values
(
	293,
	'IIT2014107'
);

insert into project_members values
(
	294,
	'IIT2014102'
);

insert into project_members values
(
	295,
	'IIT2014120'
);

insert into project_members values
(
	295,
	'IIT2014016'
);

insert into project_members values
(
	295,
	'IIT2014043'
);

insert into project_members values
(
	296,
	'IIT2014009'
);

insert into project_members values
(
	296,
	'IIT2014136'
);

insert into project_members values
(
	296,
	'IIT2014008'
);

insert into project_members values
(
	296,
	'IIT2014061'
);

insert into project_members values
(
	296,
	'IIT2014023'
);

insert into project_members values
(
	297,
	'IIT2014071'
);

insert into project_members values
(
	297,
	'IIT2014001'
);

insert into project_members values
(
	297,
	'IIT2014088'
);

insert into project_members values
(
	298,
	'IIT2014002'
);

insert into project_members values
(
	298,
	'IIT2014005'
);

insert into project_members values
(
	299,
	'IIT2014020'
);

insert into project_members values
(
	300,
	'IIT2014052'
);

insert into project_members values
(
	300,
	'IIT2014099'
);

insert into project_members values
(
	301,
	'RIT2013001'
);

insert into project_members values
(
	301,
	'RIT2013002'
);

insert into project_members values
(
	301,
	'RIT2013003'
);

insert into project_members values
(
	302,
	'RIT2013004'
);

insert into project_members values
(
	302,
	'RIT2013005'
);

insert into project_members values
(
	303,
	'RIT2013007'
);

insert into project_members values
(
	304,
	'RIT2013008'
);

insert into project_members values
(
	304,
	'RIT2013009'
);

insert into project_members values
(
	304,
	'RIT2013010'
);

insert into project_members values
(
	305,
	'RIT2013011'
);

insert into project_members values
(
	306,
	'RIT2013012'
);

insert into project_members values
(
	307,
	'RIT2013013'
);

insert into project_members values
(
	308,
	'RIT2013015'
);

insert into project_members values
(
	308,
	'RIT2013016'
);

insert into project_members values
(
	308,
	'RIT2013017'
);

insert into project_members values
(
	308,
	'RIT2013018'
);

insert into project_members values
(
	308,
	'RIT2013019'
);

insert into project_members values
(
	309,
	'RIT2013020'
);

insert into project_members values
(
	310,
	'RIT2013021'
);

insert into project_members values
(
	310,
	'RIT2013022'
);

insert into project_members values
(
	310,
	'RIT2013023'
);

insert into project_members values
(
	310,
	'RIT2013024'
);

insert into project_members values
(
	310,
	'RIT2013025'
);

insert into project_members values
(
	311,
	'RIT2013026'
);

insert into project_members values
(
	311,
	'RIT2013027'
);

insert into project_members values
(
	311,
	'RIT2013028'
);

insert into project_members values
(
	311,
	'RIT2013029'
);

insert into project_members values
(
	312,
	'RIT2013030'
);

insert into project_members values
(
	312,
	'RIT2013032'
);

insert into project_members values
(
	313,
	'RIT2013033'
);

insert into project_members values
(
	313,
	'RIT2013034'
);

insert into project_members values
(
	313,
	'RIT2013035'
);

insert into project_members values
(
	314,
	'RIT2013036'
);

insert into project_members values
(
	314,
	'RIT2013037'
);

insert into project_members values
(
	314,
	'RIT2013038'
);

insert into project_members values
(
	314,
	'RIT2013039'
);

insert into project_members values
(
	315,
	'RIT2013040'
);

insert into project_members values
(
	315,
	'RIT2013041'
);

insert into project_members values
(
	316,
	'RIT2013042'
);

insert into project_members values
(
	317,
	'RIT2013043'
);

insert into project_members values
(
	317,
	'RIT2013044'
);

insert into project_members values
(
	317,
	'RIT2013045'
);

insert into project_members values
(
	318,
	'RIT2013046'
);

insert into project_members values
(
	319,
	'RIT2013047'
);

insert into project_members values
(
	319,
	'RIT2013048'
);

insert into project_members values
(
	319,
	'RIT2013049'
);

insert into project_members values
(
	320,
	'RIT2013050'
);

insert into project_members values
(
	320,
	'RIT2013051'
);

insert into project_members values
(
	321,
	'RIT2013052'
);

insert into project_members values
(
	321,
	'RIT2013053'
);

insert into project_members values
(
	322,
	'RIT2013054'
);

insert into project_members values
(
	322,
	'RIT2013055'
);

insert into project_members values
(
	323,
	'RIT2013056'
);

insert into project_members values
(
	323,
	'RIT2013057'
);

insert into project_members values
(
	324,
	'RIT2013058'
);

insert into project_members values
(
	325,
	'RIT2013059'
);

insert into project_members values
(
	325,
	'RIT2013060'
);

insert into project_members values
(
	325,
	'RIT2013061'
);

insert into project_members values
(
	325,
	'RIT2013062'
);

insert into project_members values
(
	326,
	'RIT2013063'
);

insert into project_members values
(
	327,
	'RIT2013064'
);

insert into project_members values
(
	327,
	'RIT2013065'
);

insert into project_members values
(
	327,
	'RIT2013066'
);

insert into project_members values
(
	327,
	'RIT2013067'
);

insert into project_members values
(
	328,
	'RIT2013068'
);

insert into project_members values
(
	328,
	'RIT2013069'
);

insert into project_members values
(
	328,
	'RIT2013070'
);

insert into project_members values
(
	328,
	'RIT2013071'
);

insert into project_members values
(
	328,
	'RIT2013072'
);

insert into project_members values
(
	329,
	'RIT2013073'
);

insert into project_members values
(
	329,
	'RIT2013074'
);

insert into project_members values
(
	329,
	'RIT2013075'
);

insert into project_members values
(
	330,
	'RIT2013076'
);

insert into project_members values
(
	330,
	'RIT2013077'
);

insert into project_members values
(
	330,
	'RIT2013078'
);

insert into project_members values
(
	330,
	'RIT2013079'
);

insert into project_members values
(
	330,
	'RIT2013080'
);

insert into project_members values
(
	331,
	'RIT2013081'
);

insert into project_members values
(
	332,
	'RIT2013082'
);

insert into project_members values
(
	332,
	'RIT2013083'
);

insert into project_members values
(
	332,
	'RIT2013084'
);

insert into project_members values
(
	332,
	'RIT2013085'
);

insert into project_members values
(
	332,
	'RIT2013086'
);

insert into project_members values
(
	333,
	'RIT2013087'
);

insert into project_members values
(
	333,
	'RIT2013088'
);

insert into project_members values
(
	333,
	'RIT2014030'
);

insert into project_members values
(
	333,
	'RIT2014033'
);

insert into project_members values
(
	334,
	'RIT2014001'
);

insert into project_members values
(
	335,
	'RIT2014062'
);

insert into project_members values
(
	336,
	'RIT2014039'
);

insert into project_members values
(
	336,
	'RIT2014008'
);

insert into project_members values
(
	336,
	'RIT2014060'
);

insert into project_members values
(
	336,
	'RIT2014020'
);

insert into project_members values
(
	337,
	'RIT2014028'
);

insert into project_members values
(
	338,
	'RIT2014048'
);

insert into project_members values
(
	338,
	'RIT2014059'
);

insert into project_members values
(
	339,
	'RIT2014055'
);

insert into project_members values
(
	339,
	'RIT2014007'
);

insert into project_members values
(
	339,
	'RIT2014014'
);

insert into project_members values
(
	339,
	'RIT2014063'
);

insert into project_members values
(
	340,
	'RIT2014018'
);

insert into project_members values
(
	340,
	'RIT2014047'
);

insert into project_members values
(
	340,
	'RIT2014035'
);

insert into project_members values
(
	340,
	'RIT2014050'
);

insert into project_members values
(
	340,
	'RIT2014057'
);

insert into project_members values
(
	341,
	'RIT2014034'
);

insert into project_members values
(
	341,
	'RIT2014043'
);

insert into project_members values
(
	342,
	'RIT2014004'
);

insert into project_members values
(
	342,
	'RIT2014046'
);

insert into project_members values
(
	343,
	'RIT2014042'
);

insert into project_members values
(
	343,
	'RIT2014054'
);

insert into project_members values
(
	343,
	'RIT2014045'
);

insert into project_members values
(
	344,
	'RIT2014017'
);

insert into project_members values
(
	344,
	'RIT2014011'
);

insert into project_members values
(
	344,
	'RIT2014013'
);

insert into project_members values
(
	345,
	'RIT2014012'
);

insert into project_members values
(
	345,
	'RIT2014052'
);

insert into project_members values
(
	345,
	'RIT2014021'
);

insert into project_members values
(
	346,
	'RIT2014006'
);

insert into project_members values
(
	346,
	'RIT2014009'
);

insert into project_members values
(
	346,
	'RIT2014024'
);

insert into project_members values
(
	346,
	'RIT2014044'
);

insert into project_members values
(
	347,
	'RIT2014051'
);

insert into project_members values
(
	347,
	'RIT2014022'
);

insert into project_members values
(
	348,
	'RIT2014027'
);

insert into project_members values
(
	348,
	'RIT2014032'
);

insert into project_members values
(
	349,
	'RIT2014037'
);

insert into project_members values
(
	350,
	'RIT2014041'
);

insert into project_members values
(
	350,
	'RIT2014031'
);

insert into project_members values
(
	350,
	'RIT2014058'
);

insert into project_members values
(
	351,
	'RIT2014010'
);

insert into project_members values
(
	351,
	'RIT2014003'
);

insert into project_members values
(
	351,
	'RIT2014029'
);

insert into project_members values
(
	351,
	'RIT2014015'
);

insert into project_members values
(
	352,
	'RIT2014016'
);

insert into project_members values
(
	352,
	'RIT2014049'
);

insert into project_members values
(
	353,
	'RIT2014061'
);

insert into project_members values
(
	353,
	'RIT2014002'
);

insert into project_members values
(
	353,
	'RIT2014005'
);

insert into project_members values
(
	353,
	'RIT2014019'
);

insert into project_members values
(
	354,
	'RIT2014023'
);

insert into project_members values
(
	354,
	'RIT2014025'
);

insert into project_members values
(
	354,
	'RIT2014026'
);

insert into project_members values
(
	354,
	'RIT2014036'
);

insert into project_members values
(
	354,
	'RIT2014038'
);

insert into project_members values
(
	355,
	'RIT2014040'
);

insert into project_members values
(
	356,
	'RIT2014053'
);

insert into project_members values
(
	356,
	'RIT2014056'
);

insert into project_members values
(
	357,
	'RIT2014064'
);

insert into project_members values
(
	357,
	'RIT2014067'
);

insert into project_members values
(
	357,
	'RIT2014073'
);

insert into project_members values
(
	358,
	'RIT2014078'
);

insert into project_members values
(
	358,
	'RIT2014076'
);

insert into project_members values
(
	359,
	'RIT2014083'
);

insert into project_members values
(
	359,
	'RIT2014074'
);

insert into project_members values
(
	360,
	'RIT2014066'
);

insert into project_members values
(
	360,
	'RIT2014068'
);

insert into project_members values
(
	360,
	'RIT2014079'
);

insert into project_members values
(
	360,
	'RIT2014072'
);

insert into project_members values
(
	360,
	'RIT2014090'
);

insert into project_members values
(
	361,
	'RIT2014084'
);

insert into project_members values
(
	361,
	'RIT2014081'
);

insert into project_members values
(
	361,
	'RIT2014089'
);

insert into project_members values
(
	362,
	'RIT2014088'
);

insert into project_members values
(
	363,
	'RIT2014080'
);

insert into project_members values
(
	364,
	'RIT2014085'
);

insert into project_members values
(
	364,
	'RIT2014092'
);

insert into project_members values
(
	365,
	'RIT2014091'
);

insert into project_members values
(
	365,
	'RIT2014075'
);

insert into project_members values
(
	365,
	'RIT2014082'
);

insert into project_members values
(
	366,
	'RIT2014065'
);

insert into project_members values
(
	366,
	'RIT2014077'
);

insert into project_members values
(
	366,
	'RIT2014087'
);

insert into project_members values
(
	366,
	'RIT2014086'
);

insert into project_members values
(
	367,
	'RIT2015001'
);

insert into project_members values
(
	367,
	'RIT2015002'
);

insert into project_members values
(
	367,
	'RIT2015003'
);

insert into project_members values
(
	367,
	'RIT2015004'
);

insert into project_members values
(
	367,
	'RIT2015005'
);

insert into project_members values
(
	368,
	'RIT2015006'
);

insert into project_members values
(
	369,
	'RIT2015007'
);

insert into project_members values
(
	369,
	'RIT2015008'
);

insert into project_members values
(
	369,
	'RIT2015009'
);

insert into project_members values
(
	369,
	'RIT2015010'
);

insert into project_members values
(
	370,
	'RIT2015011'
);

insert into project_members values
(
	371,
	'RIT2015012'
);

insert into project_members values
(
	371,
	'RIT2015013'
);

insert into project_members values
(
	372,
	'RIT2015014'
);

insert into project_members values
(
	372,
	'RIT2015015'
);

insert into project_members values
(
	372,
	'RIT2015016'
);

insert into project_members values
(
	372,
	'RIT2015017'
);

insert into project_members values
(
	373,
	'RIT2015018'
);

insert into project_members values
(
	373,
	'RIT2015019'
);

insert into project_members values
(
	373,
	'RIT2015020'
);

insert into project_members values
(
	373,
	'RIT2015021'
);

insert into project_members values
(
	373,
	'RIT2015022'
);

insert into project_members values
(
	374,
	'RIT2015023'
);

insert into project_members values
(
	374,
	'RIT2015024'
);

insert into project_members values
(
	374,
	'RIT2015025'
);

insert into project_members values
(
	375,
	'RIT2015026'
);

insert into project_members values
(
	375,
	'RIT2015027'
);

insert into project_members values
(
	375,
	'RIT2015028'
);

insert into project_members values
(
	375,
	'RIT2015029'
);

insert into project_members values
(
	375,
	'RIT2015030'
);

insert into project_members values
(
	376,
	'RIT2015031'
);

insert into project_members values
(
	376,
	'RIT2015032'
);

insert into project_members values
(
	377,
	'RIT2015033'
);

insert into project_members values
(
	377,
	'RIT2015034'
);

insert into project_members values
(
	377,
	'RIT2015035'
);

insert into project_members values
(
	378,
	'RIT2015036'
);

insert into project_members values
(
	378,
	'RIT2015037'
);

insert into project_members values
(
	378,
	'RIT2015038'
);

insert into project_members values
(
	378,
	'RIT2015039'
);

insert into project_members values
(
	378,
	'RIT2015040'
);

insert into project_members values
(
	379,
	'RIT2015041'
);

insert into project_members values
(
	379,
	'RIT2015042'
);

insert into project_members values
(
	379,
	'RIT2015043'
);

insert into project_members values
(
	379,
	'RIT2015044'
);

insert into project_members values
(
	380,
	'RIT2015045'
);

insert into project_members values
(
	381,
	'RIT2015046'
);

insert into project_members values
(
	381,
	'RIT2015047'
);

insert into project_members values
(
	381,
	'RIT2015048'
);

insert into project_members values
(
	382,
	'RIT2015049'
);

insert into project_members values
(
	382,
	'RIT2015050'
);

insert into project_members values
(
	382,
	'RIT2015051'
);

insert into project_members values
(
	383,
	'RIT2015052'
);

insert into project_members values
(
	383,
	'RIT2015053'
);

insert into project_members values
(
	384,
	'RIT2015054'
);

insert into project_members values
(
	384,
	'RIT2015055'
);

insert into project_members values
(
	385,
	'RIT2015056'
);

insert into project_members values
(
	385,
	'RIT2015057'
);

insert into project_members values
(
	385,
	'RIT2015058'
);

insert into project_members values
(
	385,
	'RIT2015059'
);

insert into project_members values
(
	385,
	'RIT2015060'
);

insert into project_members values
(
	386,
	'RIT2015061'
);

insert into project_members values
(
	387,
	'RIT2015062'
);

insert into project_members values
(
	387,
	'RIT2015063'
);

insert into project_members values
(
	388,
	'RIT2015064'
);

insert into project_members values
(
	389,
	'RIT2015065'
);

insert into project_members values
(
	389,
	'RIT2015066'
);

insert into project_members values
(
	390,
	'RIT2015067'
);

insert into project_members values
(
	390,
	'RIT2015068'
);

insert into project_members values
(
	390,
	'RIT2015069'
);

insert into project_members values
(
	390,
	'RIT2015070'
);

insert into project_members values
(
	390,
	'RIT2015071'
);

insert into project_members values
(
	391,
	'RIT2015072'
);

insert into project_members values
(
	391,
	'RIT2015073'
);

insert into project_members values
(
	391,
	'RIT2015074'
);

insert into project_members values
(
	392,
	'RIT2015075'
);

insert into project_members values
(
	392,
	'RIT2015076'
);

insert into project_members values
(
	393,
	'RIT2015077'
);

insert into project_members values
(
	393,
	'RIT2015078'
);

insert into project_members values
(
	393,
	'RIT2015079'
);

insert into project_members values
(
	394,
	'RIT2015080'
);

insert into project_members values
(
	394,
	'RIT2015081'
);

insert into project_members values
(
	394,
	'RIT2015082'
);

insert into project_members values
(
	394,
	'RIT2015083'
);

insert into project_members values
(
	394,
	'RIT2015084'
);

insert into project_members values
(
	395,
	'RIT2015085'
);

insert into project_members values
(
	395,
	'RIT2015086'
);

insert into project_members values
(
	395,
	'RIT2015088'
);

insert into project_members values
(
	395,
	'RIT2015089'
);

insert into project_members values
(
	396,
	'RIT2012050'
);

insert into project_members values
(
	396,
	'IIT2014017'
);

insert into project_members values
(
	396,
	'IIT2014032'
);

insert into project_members values
(
	397,
	'IIT2014046'
);

insert into project_members values
(
	397,
	'IIT2014011'
);

insert into project_members values
(
	397,
	'IIT2014108'
);

insert into project_members values
(
	398,
	'IIT2014137'
);

insert into project_members values
(
	398,
	'IIT2014109'
);

insert into project_members values
(
	398,
	'IIT2014066'
);

insert into project_members values
(
	398,
	'IIT2014106'
);

insert into project_members values
(
	399,
	'IIT2014033'
);

insert into project_members values
(
	399,
	'IIT2014096'
);

insert into project_members values
(
	399,
	'IIT2014022'
);

insert into project_members values
(
	400,
	'IIT2014038'
);

insert into project_members values
(
	401,
	'IIT2014064'
);

insert into project_members values
(
	401,
	'IIT2014142'
);

insert into project_members values
(
	401,
	'IIT2014083'
);

insert into project_members values
(
	402,
	'IIT2014134'
);

insert into project_members values
(
	402,
	'IIT2014097'
);


-- keywords table data

insert into keywords values
(
	keywords_id_seq.nextval,	-- 1
	'Data Mining'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 2
	'Artificial Intelligence'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 3
	'Smart Card and Biometrics'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 4
	'Web Development'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 5
	'Information Security'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 6
	'Android Development'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 7
	'MS.Net Applications'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 8
	'MATLAB Application'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 9
	'Wireless Communication'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 10
	'Robotic Systems'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 11
	'Internet of Things'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 12
	'Sensor Based'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 13
	'Arduino'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 14
	'GPS Tracking'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 15
	'Digital Electronics'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 16
	'Raspberry Pi'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 17
	'Image Processing'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 18
	'Data Structures'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 19
	'Algorithms'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 20
	'Game Theory'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 21
	'Networking'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 22
	'Machine Learning'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 23
	'Big Data'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 24
	'Cognitive Science'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 25
	'Neural Networks'
);

insert into keywords values
(
	keywords_id_seq.nextval,	-- 26
	'Cloud Computing'
);

insert into project_keywords values
(
	1,
	1
);

insert into project_keywords values
(
	1,
	7
);

insert into project_keywords values
(
	2,
	12
);

insert into project_keywords values
(
	3,
	5
);

insert into project_keywords values
(
	3,
	7
);

insert into project_keywords values
(
	4,
	10
);

insert into project_keywords values
(
	4,
	9
);

insert into project_keywords values
(
	5,
	1
);

insert into project_keywords values
(
	5,
	4
);

insert into project_keywords values
(
	5,
	2
);

insert into project_keywords values
(
	6,
	3
);

insert into project_keywords values
(
	7,
	12
);

insert into project_keywords values
(
	7,
	9
);

insert into project_keywords values
(
	8,
	12
);

insert into project_keywords values
(
	9,
	15
);

insert into project_keywords values
(
	10,
	3
);

insert into project_keywords values
(
	10,
	7
);

insert into project_keywords values
(
	11,
	6
);

insert into project_keywords values
(
	12,
	12
);

insert into project_keywords values
(
	13,
	7
);

insert into project_keywords values
(
	14,
	6
);

insert into project_keywords values
(
	15,
	3
);

insert into project_keywords values
(
	15,
	7
);

insert into project_keywords values
(
	16,
	7
);

insert into project_keywords values
(
	17,
	7
);

insert into project_keywords values
(
	18,
	12
);

insert into project_keywords values
(
	19,
	10
);

insert into project_keywords values
(
	19,
	15
);

insert into project_keywords values
(
	19,
	9
);

insert into project_keywords values
(
	20,
	6
);

insert into project_keywords values
(
	21,
	10
);

insert into project_keywords values
(
	21,
	9
);

insert into project_keywords values
(
	22,
	5
);

insert into project_keywords values
(
	23,
	1
);

insert into project_keywords values
(
	23,
	4
);

insert into project_keywords values
(
	23,
	2
);

insert into project_keywords values
(
	24,
	12
);

insert into project_keywords values
(
	24,
	9
);

insert into project_keywords values
(
	25,
	3
);

insert into project_keywords values
(
	26,
	10
);

insert into project_keywords values
(
	27,
	1
);

insert into project_keywords values
(
	28,
	5
);

insert into project_keywords values
(
	28,
	7
);

insert into project_keywords values
(
	29,
	15
);

insert into project_keywords values
(
	30,
	6
);

insert into project_keywords values
(
	31,
	12
);

insert into project_keywords values
(
	32,
	10
);

insert into project_keywords values
(
	32,
	9
);

insert into project_keywords values
(
	33,
	6
);

insert into project_keywords values
(
	34,
	12
);

insert into project_keywords values
(
	34,
	9
);

insert into project_keywords values
(
	35,
	15
);

insert into project_keywords values
(
	36,
	16
);

insert into project_keywords values
(
	37,
	12
);

insert into project_keywords values
(
	38,
	5
);

insert into project_keywords values
(
	39,
	3
);

insert into project_keywords values
(
	39,
	7
);

insert into project_keywords values
(
	40,
	12
);

insert into project_keywords values
(
	40,
	9
);

insert into project_keywords values
(
	41,
	3
);

insert into project_keywords values
(
	41,
	5
);

insert into project_keywords values
(
	41,
	7
);

insert into project_keywords values
(
	42,
	1
);

insert into project_keywords values
(
	42,
	4
);

insert into project_keywords values
(
	42,
	7
);

insert into project_keywords values
(
	43,
	12
);

insert into project_keywords values
(
	44,
	6
);

insert into project_keywords values
(
	45,
	5
);

insert into project_keywords values
(
	46,
	15
);

insert into project_keywords values
(
	47,
	5
);

insert into project_keywords values
(
	48,
	9
);

insert into project_keywords values
(
	49,
	12
);

insert into project_keywords values
(
	49,
	15
);

insert into project_keywords values
(
	49,
	9
);

insert into project_keywords values
(
	50,
	14
);

insert into project_keywords values
(
	51,
	5
);

insert into project_keywords values
(
	52,
	8
);

insert into project_keywords values
(
	53,
	1
);

insert into project_keywords values
(
	53,
	4
);

insert into project_keywords values
(
	53,
	7
);

insert into project_keywords values
(
	54,
	10
);

insert into project_keywords values
(
	55,
	6
);

insert into project_keywords values
(
	56,
	6
);

insert into project_keywords values
(
	57,
	12
);

insert into project_keywords values
(
	58,
	2
);

insert into project_keywords values
(
	58,
	7
);

insert into project_keywords values
(
	59,
	12
);

insert into project_keywords values
(
	60,
	12
);

insert into project_keywords values
(
	61,
	10
);

insert into project_keywords values
(
	61,
	15
);

insert into project_keywords values
(
	62,
	6
);

insert into project_keywords values
(
	63,
	16
);

insert into project_keywords values
(
	63,
	11
);

insert into project_keywords values
(
	64,
	12
);

insert into project_keywords values
(
	64,
	11
);

insert into project_keywords values
(
	65,
	6
);

insert into project_keywords values
(
	65,
	7
);

insert into project_keywords values
(
	66,
	12
);

insert into project_keywords values
(
	66,
	9
);

insert into project_keywords values
(
	67,
	7
);

insert into project_keywords values
(
	68,
	12
);

insert into project_keywords values
(
	69,
	6
);

insert into project_keywords values
(
	70,
	6
);

insert into project_keywords values
(
	71,
	5
);

insert into project_keywords values
(
	71,
	7
);

insert into project_keywords values
(
	72,
	1
);

insert into project_keywords values
(
	72,
	4
);

insert into project_keywords values
(
	72,
	7
);

insert into project_keywords values
(
	73,
	10
);

insert into project_keywords values
(
	73,
	15
);

insert into project_keywords values
(
	73,
	9
);

insert into project_keywords values
(
	74,
	10
);

insert into project_keywords values
(
	74,
	9
);

insert into project_keywords values
(
	75,
	12
);

insert into project_keywords values
(
	76,
	10
);

insert into project_keywords values
(
	77,
	12
);

insert into project_keywords values
(
	78,
	6
);

insert into project_keywords values
(
	79,
	7
);

insert into project_keywords values
(
	80,
	12
);

insert into project_keywords values
(
	81,
	15
);

insert into project_keywords values
(
	82,
	8
);

insert into project_keywords values
(
	83,
	7
);

insert into project_keywords values
(
	84,
	9
);

insert into project_keywords values
(
	85,
	3
);

insert into project_keywords values
(
	86,
	12
);

insert into project_keywords values
(
	87,
	14
);

insert into project_keywords values
(
	88,
	12
);

insert into project_keywords values
(
	88,
	9
);

insert into project_keywords values
(
	89,
	6
);

insert into project_keywords values
(
	90,
	12
);

insert into project_keywords values
(
	91,
	12
);

insert into project_keywords values
(
	92,
	5
);

insert into project_keywords values
(
	93,
	12
);

insert into project_keywords values
(
	94,
	12
);

insert into project_keywords values
(
	95,
	3
);

insert into project_keywords values
(
	96,
	7
);

insert into project_keywords values
(
	97,
	10
);

insert into project_keywords values
(
	97,
	9
);

insert into project_keywords values
(
	98,
	6
);

insert into project_keywords values
(
	99,
	6
);

insert into project_keywords values
(
	100,
	12
);

insert into project_keywords values
(
	100,
	15
);

insert into project_keywords values
(
	101,
	10
);

insert into project_keywords values
(
	101,
	9
);

insert into project_keywords values
(
	102,
	3
);

insert into project_keywords values
(
	103,
	6
);

insert into project_keywords values
(
	104,
	12
);

insert into project_keywords values
(
	104,
	9
);

insert into project_keywords values
(
	105,
	12
);

insert into project_keywords values
(
	106,
	5
);

insert into project_keywords values
(
	106,
	6
);

insert into project_keywords values
(
	107,
	6
);

insert into project_keywords values
(
	108,
	12
);

insert into project_keywords values
(
	108,
	9
);

insert into project_keywords values
(
	108,
	11
);

insert into project_keywords values
(
	109,
	10
);

insert into project_keywords values
(
	110,
	12
);

insert into project_keywords values
(
	110,
	9
);

insert into project_keywords values
(
	111,
	1
);

insert into project_keywords values
(
	111,
	4
);

insert into project_keywords values
(
	111,
	2
);

insert into project_keywords values
(
	111,
	7
);

insert into project_keywords values
(
	112,
	5
);

insert into project_keywords values
(
	112,
	7
);

insert into project_keywords values
(
	113,
	12
);

insert into project_keywords values
(
	113,
	10
);

insert into project_keywords values
(
	114,
	1
);

insert into project_keywords values
(
	114,
	4
);

insert into project_keywords values
(
	114,
	7
);

insert into project_keywords values
(
	115,
	6
);

insert into project_keywords values
(
	116,
	7
);

insert into project_keywords values
(
	117,
	11
);

insert into project_keywords values
(
	118,
	6
);

insert into project_keywords values
(
	119,
	6
);

insert into project_keywords values
(
	120,
	12
);

insert into project_keywords values
(
	120,
	11
);

insert into project_keywords values
(
	121,
	16
);

insert into project_keywords values
(
	121,
	9
);

insert into project_keywords values
(
	121,
	11
);

insert into project_keywords values
(
	122,
	8
);

insert into project_keywords values
(
	123,
	6
);

insert into project_keywords values
(
	124,
	12
);

insert into project_keywords values
(
	125,
	15
);

insert into project_keywords values
(
	126,
	5
);

insert into project_keywords values
(
	127,
	12
);

insert into project_keywords values
(
	128,
	12
);

insert into project_keywords values
(
	129,
	7
);

insert into project_keywords values
(
	130,
	6
);

insert into project_keywords values
(
	131,
	7
);

insert into project_keywords values
(
	132,
	1
);

insert into project_keywords values
(
	132,
	4
);

insert into project_keywords values
(
	132,
	7
);

insert into project_keywords values
(
	133,
	1
);

insert into project_keywords values
(
	134,
	12
);

insert into project_keywords values
(
	134,
	15
);

insert into project_keywords values
(
	135,
	1
);

insert into project_keywords values
(
	135,
	4
);

insert into project_keywords values
(
	136,
	12
);

insert into project_keywords values
(
	136,
	9
);

insert into project_keywords values
(
	136,
	11
);

insert into project_keywords values
(
	137,
	5
);

insert into project_keywords values
(
	138,
	12
);

insert into project_keywords values
(
	139,
	5
);

insert into project_keywords values
(
	139,
	6
);

insert into project_keywords values
(
	139,
	7
);

insert into project_keywords values
(
	140,
	15
);

insert into project_keywords values
(
	141,
	3
);

insert into project_keywords values
(
	141,
	7
);

insert into project_keywords values
(
	142,
	5
);

insert into project_keywords values
(
	142,
	7
);

insert into project_keywords values
(
	143,
	12
);

insert into project_keywords values
(
	143,
	15
);

insert into project_keywords values
(
	144,
	12
);

insert into project_keywords values
(
	144,
	15
);

insert into project_keywords values
(
	145,
	4
);

insert into project_keywords values
(
	146,
	6
);

insert into project_keywords values
(
	147,
	12
);

insert into project_keywords values
(
	147,
	10
);

insert into project_keywords values
(
	148,
	1
);

insert into project_keywords values
(
	148,
	4
);

insert into project_keywords values
(
	148,
	7
);

insert into project_keywords values
(
	149,
	1
);

insert into project_keywords values
(
	149,
	4
);

insert into project_keywords values
(
	150,
	15
);

insert into project_keywords values
(
	150,
	9
);

insert into project_keywords values
(
	151,
	7
);

insert into project_keywords values
(
	152,
	1
);

insert into project_keywords values
(
	153,
	15
);

insert into project_keywords values
(
	154,
	10
);

insert into project_keywords values
(
	155,
	10
);

insert into project_keywords values
(
	155,
	9
);

insert into project_keywords values
(
	156,
	12
);

insert into project_keywords values
(
	157,
	1
);

insert into project_keywords values
(
	157,
	4
);

insert into project_keywords values
(
	157,
	7
);

insert into project_keywords values
(
	158,
	9
);

insert into project_keywords values
(
	159,
	15
);

insert into project_keywords values
(
	159,
	9
);

insert into project_keywords values
(
	160,
	6
);

insert into project_keywords values
(
	161,
	12
);

insert into project_keywords values
(
	162,
	9
);

insert into project_keywords values
(
	163,
	1
);

insert into project_keywords values
(
	163,
	2
);

insert into project_keywords values
(
	164,
	10
);

insert into project_keywords values
(
	164,
	9
);

insert into project_keywords values
(
	165,
	12
);

insert into project_keywords values
(
	166,
	8
);

insert into project_keywords values
(
	167,
	1
);

insert into project_keywords values
(
	168,
	9
);

insert into project_keywords values
(
	169,
	4
);

insert into project_keywords values
(
	169,
	7
);

insert into project_keywords values
(
	170,
	1
);

insert into project_keywords values
(
	171,
	1
);

insert into project_keywords values
(
	171,
	4
);

insert into project_keywords values
(
	171,
	7
);

insert into project_keywords values
(
	172,
	7
);

insert into project_keywords values
(
	173,
	5
);

insert into project_keywords values
(
	174,
	12
);

insert into project_keywords values
(
	174,
	10
);

insert into project_keywords values
(
	174,
	9
);

insert into project_keywords values
(
	175,
	12
);

insert into project_keywords values
(
	175,
	15
);

insert into project_keywords values
(
	176,
	12
);

insert into project_keywords values
(
	177,
	15
);

insert into project_keywords values
(
	178,
	5
);

insert into project_keywords values
(
	179,
	9
);

insert into project_keywords values
(
	180,
	9
);

insert into project_keywords values
(
	180,
	11
);

insert into project_keywords values
(
	181,
	6
);

insert into project_keywords values
(
	181,
	7
);

insert into project_keywords values
(
	182,
	9
);

insert into project_keywords values
(
	183,
	12
);

insert into project_keywords values
(
	183,
	9
);

insert into project_keywords values
(
	184,
	6
);

insert into project_keywords values
(
	184,
	7
);

insert into project_keywords values
(
	185,
	5
);

insert into project_keywords values
(
	185,
	7
);

insert into project_keywords values
(
	186,
	7
);

insert into project_keywords values
(
	187,
	12
);

insert into project_keywords values
(
	187,
	9
);

insert into project_keywords values
(
	188,
	10
);

insert into project_keywords values
(
	189,
	1
);

insert into project_keywords values
(
	189,
	4
);

insert into project_keywords values
(
	190,
	11
);

insert into project_keywords values
(
	191,
	12
);

insert into project_keywords values
(
	192,
	12
);

insert into project_keywords values
(
	192,
	9
);

insert into project_keywords values
(
	193,
	7
);

insert into project_keywords values
(
	194,
	16
);

insert into project_keywords values
(
	194,
	12
);

insert into project_keywords values
(
	195,
	1
);

insert into project_keywords values
(
	195,
	7
);

insert into project_keywords values
(
	196,
	7
);

insert into project_keywords values
(
	197,
	7
);

insert into project_keywords values
(
	198,
	1
);

insert into project_keywords values
(
	198,
	4
);

insert into project_keywords values
(
	199,
	10
);

insert into project_keywords values
(
	200,
	5
);

insert into project_keywords values
(
	201,
	1
);

insert into project_keywords values
(
	202,
	6
);

insert into project_keywords values
(
	203,
	12
);

insert into project_keywords values
(
	204,
	12
);

insert into project_keywords values
(
	204,
	9
);

insert into project_keywords values
(
	205,
	12
);

insert into project_keywords values
(
	206,
	6
);

insert into project_keywords values
(
	207,
	10
);

insert into project_keywords values
(
	208,
	12
);

insert into project_keywords values
(
	208,
	15
);

insert into project_keywords values
(
	209,
	8
);

insert into project_keywords values
(
	210,
	12
);

insert into project_keywords values
(
	211,
	12
);

insert into project_keywords values
(
	212,
	10
);

insert into project_keywords values
(
	213,
	6
);

insert into project_keywords values
(
	213,
	7
);

insert into project_keywords values
(
	214,
	3
);

insert into project_keywords values
(
	215,
	8
);

insert into project_keywords values
(
	216,
	12
);

insert into project_keywords values
(
	217,
	1
);

insert into project_keywords values
(
	217,
	7
);

insert into project_keywords values
(
	218,
	6
);

insert into project_keywords values
(
	219,
	12
);

insert into project_keywords values
(
	220,
	12
);

insert into project_keywords values
(
	221,
	10
);

insert into project_keywords values
(
	222,
	6
);

insert into project_keywords values
(
	223,
	10
);

insert into project_keywords values
(
	224,
	12
);

insert into project_keywords values
(
	225,
	9
);

insert into project_keywords values
(
	226,
	14
);

insert into project_keywords values
(
	226,
	9
);

insert into project_keywords values
(
	227,
	1
);

insert into project_keywords values
(
	227,
	4
);

insert into project_keywords values
(
	227,
	7
);

insert into project_keywords values
(
	228,
	12
);

insert into project_keywords values
(
	229,
	10
);

insert into project_keywords values
(
	230,
	14
);

insert into project_keywords values
(
	230,
	9
);

insert into project_keywords values
(
	231,
	1
);

insert into project_keywords values
(
	232,
	4
);

insert into project_keywords values
(
	233,
	12
);

insert into project_keywords values
(
	233,
	10
);

insert into project_keywords values
(
	234,
	16
);

insert into project_keywords values
(
	235,
	9
);

insert into project_keywords values
(
	236,
	5
);

insert into project_keywords values
(
	237,
	7
);

insert into project_keywords values
(
	238,
	9
);

insert into project_keywords values
(
	238,
	11
);

insert into project_keywords values
(
	239,
	1
);

insert into project_keywords values
(
	239,
	7
);

insert into project_keywords values
(
	240,
	9
);

insert into project_keywords values
(
	241,
	7
);

insert into project_keywords values
(
	242,
	6
);

insert into project_keywords values
(
	243,
	12
);

insert into project_keywords values
(
	243,
	9
);

insert into project_keywords values
(
	244,
	10
);

insert into project_keywords values
(
	244,
	9
);

insert into project_keywords values
(
	245,
	9
);

insert into project_keywords values
(
	246,
	8
);

insert into project_keywords values
(
	247,
	1
);

insert into project_keywords values
(
	247,
	7
);

insert into project_keywords values
(
	248,
	6
);

insert into project_keywords values
(
	248,
	7
);

insert into project_keywords values
(
	249,
	12
);

insert into project_keywords values
(
	250,
	15
);

insert into project_keywords values
(
	251,
	7
);

insert into project_keywords values
(
	252,
	10
);

insert into project_keywords values
(
	253,
	7
);

insert into project_keywords values
(
	254,
	12
);

insert into project_keywords values
(
	255,
	6
);

insert into project_keywords values
(
	256,
	12
);

insert into project_keywords values
(
	257,
	7
);

insert into project_keywords values
(
	258,
	6
);

insert into project_keywords values
(
	259,
	4
);

insert into project_keywords values
(
	260,
	5
);

insert into project_keywords values
(
	261,
	7
);

insert into project_keywords values
(
	262,
	12
);

insert into project_keywords values
(
	263,
	16
);

insert into project_keywords values
(
	263,
	12
);

insert into project_keywords values
(
	264,
	5
);

insert into project_keywords values
(
	264,
	7
);

insert into project_keywords values
(
	265,
	8
);

insert into project_keywords values
(
	266,
	12
);

insert into project_keywords values
(
	266,
	15
);

insert into project_keywords values
(
	267,
	4
);

insert into project_keywords values
(
	267,
	2
);

insert into project_keywords values
(
	268,
	3
);

insert into project_keywords values
(
	268,
	7
);

insert into project_keywords values
(
	269,
	3
);

insert into project_keywords values
(
	270,
	6
);

insert into project_keywords values
(
	271,
	12
);

insert into project_keywords values
(
	271,
	10
);

insert into project_keywords values
(
	272,
	16
);

insert into project_keywords values
(
	272,
	12
);

insert into project_keywords values
(
	273,
	1
);

insert into project_keywords values
(
	273,
	2
);

insert into project_keywords values
(
	274,
	5
);

insert into project_keywords values
(
	275,
	6
);

insert into project_keywords values
(
	275,
	2
);

insert into project_keywords values
(
	276,
	12
);

insert into project_keywords values
(
	276,
	15
);

insert into project_keywords values
(
	277,
	6
);

insert into project_keywords values
(
	278,
	8
);

insert into project_keywords values
(
	279,
	12
);

insert into project_keywords values
(
	280,
	12
);

insert into project_keywords values
(
	280,
	14
);

insert into project_keywords values
(
	280,
	15
);

insert into project_keywords values
(
	281,
	6
);

insert into project_keywords values
(
	282,
	16
);

insert into project_keywords values
(
	282,
	12
);

insert into project_keywords values
(
	283,
	3
);

insert into project_keywords values
(
	283,
	5
);

insert into project_keywords values
(
	283,
	7
);

insert into project_keywords values
(
	284,
	12
);

insert into project_keywords values
(
	285,
	15
);

insert into project_keywords values
(
	285,
	9
);

insert into project_keywords values
(
	286,
	6
);

insert into project_keywords values
(
	287,
	12
);

insert into project_keywords values
(
	287,
	15
);

insert into project_keywords values
(
	288,
	6
);

insert into project_keywords values
(
	289,
	5
);

insert into project_keywords values
(
	290,
	1
);

insert into project_keywords values
(
	291,
	1
);

insert into project_keywords values
(
	291,
	7
);

insert into project_keywords values
(
	292,
	7
);

insert into project_keywords values
(
	293,
	1
);

insert into project_keywords values
(
	293,
	4
);

insert into project_keywords values
(
	293,
	7
);

insert into project_keywords values
(
	294,
	10
);

insert into project_keywords values
(
	294,
	9
);

insert into project_keywords values
(
	295,
	2
);

insert into project_keywords values
(
	295,
	7
);

insert into project_keywords values
(
	296,
	5
);

insert into project_keywords values
(
	297,
	5
);

insert into project_keywords values
(
	298,
	1
);

insert into project_keywords values
(
	298,
	2
);

insert into project_keywords values
(
	299,
	7
);

insert into project_keywords values
(
	300,
	5
);

insert into project_keywords values
(
	301, 
	1
);

insert into project_keywords values
(
	301, 
	4
);

insert into project_keywords values
(
	301, 
	7
);

insert into project_keywords values
(
	302, 
	12
);

insert into project_keywords values
(
	302, 
	10
);

insert into project_keywords values
(
	303, 
	12
);

insert into project_keywords values
(
	304, 
	5
);

insert into project_keywords values
(
	304, 
	7
);

insert into project_keywords values
(
	305, 
	15
);

insert into project_keywords values
(
	306, 
	9
);

insert into project_keywords values
(
	307, 
	5
);

insert into project_keywords values
(
	307, 
	7
);

insert into project_keywords values
(
	308, 
	7
);

insert into project_keywords values
(
	309, 
	6
);

insert into project_keywords values
(
	310, 
	12
);

insert into project_keywords values
(
	311, 
	16
);

insert into project_keywords values
(
	311, 
	11
);

insert into project_keywords values
(
	312, 
	12
);

insert into project_keywords values
(
	313, 
	12
);

insert into project_keywords values
(
	314, 
	12
);

insert into project_keywords values
(
	314, 
	9
);

insert into project_keywords values
(
	315, 
	15
);

insert into project_keywords values
(
	316, 
	6
);

insert into project_keywords values
(
	317, 
	5
);

insert into project_keywords values
(
	317, 
	7
);

insert into project_keywords values
(
	318, 
	12
);

insert into project_keywords values
(
	318, 
	9
);

insert into project_keywords values
(
	319, 
	6
);

insert into project_keywords values
(
	320, 
	6
);

insert into project_keywords values
(
	321, 
	9
);

insert into project_keywords values
(
	322, 
	10
);

insert into project_keywords values
(
	323, 
	7
);

insert into project_keywords values
(
	324, 
	7
);

insert into project_keywords values
(
	325, 
	6
);

insert into project_keywords values
(
	326, 
	9
);

insert into project_keywords values
(
	326, 
	11
);

insert into project_keywords values
(
	327, 
	12
);

insert into project_keywords values
(
	328, 
	12
);

insert into project_keywords values
(
	328, 
	15
);

insert into project_keywords values
(
	329, 
	1
);

insert into project_keywords values
(
	330, 
	6
);

insert into project_keywords values
(
	331, 
	11
);

insert into project_keywords values
(
	332, 
	12
);

insert into project_keywords values
(
	332, 
	9
);

insert into project_keywords values
(
	332, 
	11
);

insert into project_keywords values
(
	333, 
	12
);

insert into project_keywords values
(
	333, 
	9
);

insert into project_keywords values
(
	334, 
	10
);

insert into project_keywords values
(
	335, 
	16
);

insert into project_keywords values
(
	335, 
	12
);

insert into project_keywords values
(
	336, 
	12
);

insert into project_keywords values
(
	337, 
	10
);

insert into project_keywords values
(
	337, 
	9
);

insert into project_keywords values
(
	338, 
	12
);

insert into project_keywords values
(
	338, 
	15
);

insert into project_keywords values
(
	339, 
	12
);

insert into project_keywords values
(
	340, 
	5
);

insert into project_keywords values
(
	341, 
	6
);

insert into project_keywords values
(
	342, 
	12
);

insert into project_keywords values
(
	343, 
	1
);

insert into project_keywords values
(
	344, 
	15
);

insert into project_keywords values
(
	345, 
	12
);

insert into project_keywords values
(
	346, 
	7
);

insert into project_keywords values
(
	347, 
	5
);

insert into project_keywords values
(
	348, 
	6
);

insert into project_keywords values
(
	349, 
	7
);

insert into project_keywords values
(
	350, 
	6
);

insert into project_keywords values
(
	351, 
	4
);

insert into project_keywords values
(
	352, 
	7
);

insert into project_keywords values
(
	353, 
	6
);

insert into project_keywords values
(
	353, 
	7
);

insert into project_keywords values
(
	354, 
	1
);

insert into project_keywords values
(
	354, 
	2
);

insert into project_keywords values
(
	355, 
	12
);

insert into project_keywords values
(
	356, 
	12
);

insert into project_keywords values
(
	356, 
	15
);

insert into project_keywords values
(
	357, 
	12
);

insert into project_keywords values
(
	357, 
	9
);

insert into project_keywords values
(
	357, 
	11
);

insert into project_keywords values
(
	358, 
	6
);

insert into project_keywords values
(
	359, 
	6
);

insert into project_keywords values
(
	360, 
	5
);

insert into project_keywords values
(
	361, 
	5
);

insert into project_keywords values
(
	361, 
	7
);

insert into project_keywords values
(
	362, 
	12
);

insert into project_keywords values
(
	362, 
	9
);

insert into project_keywords values
(
	363, 
	9
);

insert into project_keywords values
(
	364, 
	15
);

insert into project_keywords values
(
	365, 
	16
);

insert into project_keywords values
(
	366, 
	12
);

insert into project_keywords values
(
	367, 
	1
);

insert into project_keywords values
(
	368, 
	15
);

insert into project_keywords values
(
	369, 
	1
);

insert into project_keywords values
(
	369, 
	7
);

insert into project_keywords values
(
	370, 
	6
);

insert into project_keywords values
(
	371, 
	2
);

insert into project_keywords values
(
	371, 
	7
);

insert into project_keywords values
(
	372, 
	12
);

insert into project_keywords values
(
	373, 
	1
);

insert into project_keywords values
(
	373, 
	4
);

insert into project_keywords values
(
	374, 
	1
);

insert into project_keywords values
(
	374, 
	4
);

insert into project_keywords values
(
	374, 
	7
);

insert into project_keywords values
(
	375, 
	16
);

insert into project_keywords values
(
	375, 
	12
);

insert into project_keywords values
(
	376, 
	10
);

insert into project_keywords values
(
	377, 
	7
);

insert into project_keywords values
(
	378, 
	6
);

insert into project_keywords values
(
	379, 
	12
);

insert into project_keywords values
(
	379, 
	15
);

insert into project_keywords values
(
	380, 
	1
);

insert into project_keywords values
(
	380, 
	4
);

insert into project_keywords values
(
	380, 
	7
);

insert into project_keywords values
(
	381, 
	2
);

insert into project_keywords values
(
	381, 
	7
);

insert into project_keywords values
(
	382, 
	3
);

insert into project_keywords values
(
	382, 
	7
);

insert into project_keywords values
(
	383, 
	9
);

insert into project_keywords values
(
	384, 
	12
);

insert into project_keywords values
(
	385, 
	6
);

insert into project_keywords values
(
	386, 
	12
);

insert into project_keywords values
(
	386, 
	14
);

insert into project_keywords values
(
	386, 
	15
);

insert into project_keywords values
(
	387, 
	12
);

insert into project_keywords values
(
	387, 
	10
);

insert into project_keywords values
(
	387, 
	9
);

insert into project_keywords values
(
	388, 
	10
);

insert into project_keywords values
(
	389, 
	9
);

insert into project_keywords values
(
	390, 
	10
);

insert into project_keywords values
(
	391, 
	10
);

insert into project_keywords values
(
	391, 
	9
);

insert into project_keywords values
(
	392, 
	1
);

insert into project_keywords values
(
	392, 
	7
);

insert into project_keywords values
(
	393, 
	12
);

insert into project_keywords values
(
	393, 
	10
);

insert into project_keywords values
(
	394, 
	12
);

insert into project_keywords values
(
	394, 
	10
);

insert into project_keywords values
(
	394, 
	9
);

insert into project_keywords values
(
	395, 
	6
);

insert into project_keywords values
(
	396, 
	12
);

insert into project_keywords values
(
	396, 
	9
);

insert into project_keywords values
(
	397, 
	1
);

insert into project_keywords values
(
	397, 
	4
);

insert into project_keywords values
(
	397, 
	7
);

insert into project_keywords values
(
	398, 
	3
);

insert into project_keywords values
(
	398, 
	7
);

insert into project_keywords values
(
	399, 
	7
);

insert into project_keywords values
(
	400, 
	16
);

insert into project_keywords values
(
	401, 
	8
);

insert into project_keywords values
(
	402, 
	12
);

commit;
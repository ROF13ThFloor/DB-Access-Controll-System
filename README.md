# DB-Access-Controll-System
This is a simple simulation of access control implementation in a hospital. In this project, we implemented a simulation of mandatory access control(MAC) needed in the hospital. As frontend technology, we used Jquery plus HTML5. Backend technologies are Django framework using python and Postgres Database in Queries handling.
<br/> 
<br/> 

you can see a schema of databse used in this project: 
<p align="center">
  <img  src="4.png">
</p>
<br/> 
After user logining in access control system users will be verified by theirs usename and get their roles based in their ID and roles domain in hospital.
<p align="center">
  <img  src="1.png">
</p>
<br/> 

<p align="center">
  <img  src="3.png">
</p>

<br/> 

Then each user can make a query, user's query is executed based on MAC Policy. It means that the Mandatory access control policy will not be violated after the execution of the query. 
<p align="center">
  <img  src="2.png">
</p>

# What is Mandatory Access Control policy ? 
based on the Wikipedia article : 
<br/>
In computer security, mandatory access control (MAC) refers to a type of access control by which the operating system or database constrains the ability of a subject or initiator to access or generally perform some sort of operation on an object or target.In the case of operating systems, a subject is usually a process or thread; objects are constructs such as files, directories, TCP/UDP ports, shared memory segments, IO devices, etc. Subjects and objects each have a set of security attributes. Whenever a subject attempts to access an object, an authorization rule enforced by the operating system kernel examines these security attributes and decides whether the access can take place. Any operation by any subject on any object is tested against the set of authorization rules (aka policy) to determine if the operation is allowed.
<br/>



## Developed by contributors:

<a href="https://github.com/ROF13ThFloor/DB-Access-Controll-System/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ROF13ThFloor/DB-Access-Controll-System" />
</a>


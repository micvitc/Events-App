**This repository contains the source code of defining REST API using flask framework and mongoDB ODM in python.**

**Pre-requites:**

**python3** installed and path specified in local machine.

“git clone <https://github.com/micvitc/Events-App.git>” to create a local repository inside your PC

“git pull” the update recent changes from “[micvitc](https://github.com/micvitc)/[**Events-App**](https://github.com/micvitc/Events-App)” repository.(has to be done frequently to ensure the bugs/new features are updated to your local repository)

**About REST APIs:**

In a nutshell, REST APIs (which are a type of web API) involve requests and responses, not too unlike visiting a web page. You make a request to a resource stored on a server, and the server responds with the requested information. The protocol used to transport the data is HTTP. “REST” stands for Representational State Transfer.


|![](rest-api-image.png)|
| :- |
|*REST APIs involve requests and responses over HTTP protocol*|

Usually response methods consist of data in HTML, CSV, JSON, JPEG(or any form of image), XML, SOAP etc..  However, this project is developed in a sense to send/receive in JSON format.


**HTTP Methods used in this project:**

- GET - Requests retrieve resource information
- POST - The server creates a new entry in a database
- PUT - Updates an existing resource
- DELETE - Deletes resource or related component

**Database model attributes:**

|**Attributes defined**|**Description**|**Input type**|**Necessity**|
| :- | :- | :- | :- |
|**event\_id**|Uniquely identifies an event|String|Required and have to be unique|
|**event\_name** |Name of the event|String|Required|
|**event\_date**|Date the event is held|Datetime|Required|
|**event\_venue**|Venue/Location the event is held|String|Required |
|**event\_host**|Name/names of the host team/club/organization|Array of strings|Required|
|**event\_coordinators**|Name/names of the coordinators|Array of strings|Optional|
|**school\_name**|Name of school|String|Required|


**Endpoints and methods (API reference tutorial):**

🚀 **Request:** Retrieve response from endpoint instantly.

1. Choose method
1. Enter URL
1. Send

👋 **Response**: Contains the status line, headers, and the message/response body.

- Copy response to clipboard
- Download response as a file
- View response headers
- View raw and preview of HTML, image, JSON, XML responses

**Usage of endpoints:**

**This project contains 3 endpoints at present. Below is a documentation of using those endpoints**

**How to use those endpoints?**\
**1. [http://35.171.162.185/api/events](http://35.171.162.185/api/events) - Retrieves all the information of events inserted by the admin.**

What information will the “**/api/events”** retrieve**?**

- event\_id – Primary key ID to describe the event **uniquely**. 
- event\_name 
- event\_date 
- event\_venue 
- event\_host 
- event\_coordinators 
- school\_name

All these attributes of each and every event stored in the database will be operated according to the given CURD operations. 


**2. [http://35.171.162.185:5000/api/events/<id](http://35.171.162.185:5000/api/events/%3cid)> - Retrieves only the information of the event identified by “event\_id”.** 

**Note: <id> is dynamic. Event id passed on to the URL replacing <id> would result in fetching only a particular event information with respect to the event id provided.**

For example, to access event id = 2:

<http://35.171.162.185:5000/api/events/2> 

**3. [http://35.171.162.185:5000/api/events/filter/<school_name](http://35.171.162.185:5000/api/events/filter/%3cschool_name)> - Retrieves event information based on “school name”.** 

**Note: <school\_name> field is dynamic. School name passed on to the URL replacing <school\_name> would result in fetching a list of events with respect to the school’s name provided.** 

*This endpoint doesn’t return group by events, instead it only returns a list of events hosted/managed by that school.*

For example, to access only the events organized by “QBIT”:

<http://35.171.162.185:5000/api/events/filter/qbit>  


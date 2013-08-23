COMP353 - Final Project
===============

Contributions:

Cheng Cheng:
	- Created preliminary Diagram
	    - only included tables, no relations
	- Created initial database tables
	- Found HTML/CSS template
	- Created contact us page

Karim Kaidbey:
	- Modified Relational Diagram
	- Wrote assumptions text for Relational Diagram
	- Created/modified database tables
	- Created generic database views
	   - not included in final project
	- Generated some database test data
	   - not included in final project

Christopher Mukherjee:
	- Modified Relational Diagram
	    - added non-identifying & identifying relationships
	- Finalized Relational Diagram
	- Created/modified database tables
	- Converted pure HTML template to PHP/HTML blend
	    - added PHP includes for header, footer, and sidebar
	    - removed redundant blocks of HTML
	- Worked on HTML & CSS
	- Edited header and footer of website
	- Modified contact us page
	- Created initial login page with POST method form
	    - on unsuccessful login, display red error message using PHP
	- Added PHP redirect code to enforce proper login
	    - if a user tries to manually get to a page without logging in, redirect to login screen
	    - if a user tries to manually return to login page (without logging out), redirect to contact us page
	- Created "login as patient" option that does not require a userID
	- Added logout function
	- Established PHP interface connection to MySQL server and database schema (supported Alexander)
	- Added Welcome text that displays user's name (supported Alexander)
	- Added PHP code to limit access to pages
	    - sidebar will only display links to certain pages, based on the user's staff type
	    - if a user tries to manually access a page that they should not have access to, redirect to contact us page
	- Created required database views (supported Alexander)
	- Created PHP code and SQL queries to retrieve and display appropriate views on some of the staff pages (supported Alexander)
	- Updated website look-and-feel, in HTML/CSS
	- Created code to allow Administrators to update and delete their services as specified
	- Finalized website
	- Wrote README.txt (contributions for myself, Karim, and Cheng)

Alexander Vissa:
	- Modified Relational Diagram
	    - added non-identifying & identifying relationships
	- Created/modified database tables
	- Added coloured layers to database diagram as visual aid for the "segments/zones" of the database
	- Established PHP interface connection to MySQL server and database schema
	- Edited sidebar
	- Created authentication system for login page
	    - get userID and password from form using POST method
	    - get staffID and password from database tables using SQL queries
	    - check form values against database values
	    - on successful login, redirect staff member to appropriate page using PHP
	- Added Welcome text that displays user's name
	- Created required database views
	- Created PHP code and SQL queries to retrieve and display appropriate views on each of the staff pages
	- Created code to allow Doctors to update and delete their services as specified
	- Wrote README.txt (contributions for myself)
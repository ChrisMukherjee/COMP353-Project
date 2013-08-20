COMP353 - Project
===============

Final Project for COMP 353 (Databases)

Contributions:

Cheng Cheng:
	- Created preliminary Diagram (without table relations)
	- Created database tables
	- Found and modified HTML/CSS template
	- Created contact us page

Karim Kaidbey:
	- Modified Relational Diagram
	    - added non-identifying & identifying relationships
	- Finalized Relational Diagram
	- Created/modified database tables
	    - modified table attributes
	- Created database views
	- Generated database test data

Christopher Mukherjee:
	- Modified Relational Diagram
	    - added non-identifying & identifying relationships
	- Created/modified database tables
	    - modified table attributes
	- Converted pure HTML template to PHP/HTML blend
	    - added PHP includes for header, footer, and sidebar
	    - removed redundant blocks of HTML
	- Edited header and footer of website
	- Edited HTML/CSS of contact us page
	- Created initial login page with POST method form
	- Added redirect code to enforce proper login
	    - if a user tries to manually get to a page without logging in, redirect to login screen
	    - if a user tries to manually return to login page (without logging out), redirect to contact us page
	- Created "login as patient" option that does not require a userID
	- Added logout function
	- Added Welcome text that displays user's name (supported Alexander)

Alexander Vissa:
	- Modified Relational Diagram
	    - added non-identifying & identifying relationships
	- Created/modified database tables
	    - modified table attributes
	- Added coloured layers to database diagram as visual aid for the "segments/zones" of the database
	- Established PHP interface connection to MySQL server and database schema
	- Edited sidebar
	- Created authentication system for login page
	    - get userID and password from form using POST method
	    - get staffID and password from tables using SQL queries
	    - check form values against database values
	    - on successful login, redirect staff member to appropriate page using PHP
	- Created database views (supported Karim)
	- Created PHP code and SQL queries to retrieve and display appropriate views on each of the staff pages
	- Added Welcome text that displays user's name
  

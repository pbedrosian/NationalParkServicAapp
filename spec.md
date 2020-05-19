Specs:
- [x] Use Sinatra to build the app
    used the corneal gem to build the project structure
- [x] Use ActiveRecord for storing information in a database
    used Parks/User.new then .save to persist data to the DB
- [x] Include more than one model class (e.g. User, Post, Category)
    Have two models, Users and Parks
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has_many Parks
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Parks belong_to Users
- [x] Include user accounts with unique login attribute (username or email)
    Used has_secure_password to allow for securely stored password, used email and password  
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Added each section of CRUD into the site
- [x] Ensure that users can't modify content created by other users
    Checked to see if a user is logged in, then check a custom helper that takes in the sessin ID and params id.
        -returns a park that matches the users based on the index
- [x] Include user input validations
    used ActiveRecord validation to make sure user add all data to input
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    added errors based on activerecords validation errors. Also used sinatra-flash to to display errors
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
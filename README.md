## Prerequisites

Ruby: Version 3.3.1
Rails: Version 7.1.3.4

## Setup

1. Clone the Repository
   git clone https://github.com/msureshm/teacher_app.git
   cd teacher_app

2. Install Dependencies
   Install Ruby gems:
     bundle install

3. Setup the Database
   Create and migrate the database:
     rails db:create
     rails db:migrate
     rails db:seed

4. Start the Rails Server
   rails server

   By default, the server will run at `http://localhost:3000`.
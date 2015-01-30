Concert Connection
======================

A Ruby Sinatra web application that allows a user to add venues and bands and connect the bands to the venues they have played.

Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
rake
sinatra
sinatra-contrib
sinatra-activerecord
pg
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active session. At the time of
creation of this application, Postgres 9.4 was used. To create the necessary database schema, enter the following Rake statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.2.0 was used.

Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Motivation
--------
> **To Practice:**
> - Using ActiveRecord
> - Many-to-many relationship of two Ruby classes
> - User input validation
> - Using CRUD methodologies in Sinatra

Known Bugs
----------

None as of 2015-01-30.

Author
------

Kathryn Carr

License
-------

MIT license.

# Blog

## Overview

This is a bit of playground. It is based around building a blog platform, but
there are features missing.

## How to start

1. Fork this repo
2. Make sure git is installed locally and pull the code down.

### Steps to get the rails application running

1. Install Vagrant
2. Install VirtualBox
3. cd into project directory and run `vagrant up`
4. Once up run `vagrant ssh` to connect to the VM
5. On the VM run `bundle install`
6. Then run `rake db:migrate`
7. Then run `rake db:seed`
8. Then run `foreman start`

### Features to implement

#### As a blogger, I want my articles to have an 'average time to read' displayed,
so that my readers get an idea how long it will take them to read.

* Calculate how long the article would take an average reader to read in seconds
  * Save the calculation in the read_time on the article
  * Once you get the read_time as a part of creation, make sure it is always saved
and updated with the model.
** *Extra* display the number on the article show view in a human readable format
example: 60 becomes 1 minute

#### As a blogger, I want to be able to tag my articles, so that my users get
an idea of what the article is about.

* Create tag model
  * Needs to have name, created at and updated at fields
  * name will be required
  * Will be associated to an article model
* Allow the user to set a tag when creating an article (no need to allow update)
  * The seed file has Tags to add to the database. Simply delete the
development.sqlite3 database file, run `rake db:migrate` then `rake db:seed`

### How to submit changes for review

1. Commit your changes to the master branch
2. Push the changes to your remote repo
3. Create a pull request

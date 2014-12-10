# A Virtual Machine for learning Ruby in IMG 240

An Ubuntu Linux system for learning Ruby and Rails.

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

## How To Use Get Started

From the terminal:

    git clone https://github.com/alexdunae/rails-dev-box.git
    cd rails-dev-box
    vagrant up

After the installation has finished you can log in to the virtual machine with:

    vagrant ssh


## Working with Rails

You'll be editing files using your favourite editor on your Windows or Mac computer. 
Any time you need to type in a command you'll do it inside the virtual machine.

Do everything `/vagrant` directory on the virtual machine.

For example, to create a new Rails project you'd type something like this into
the virtual machine:

    cd /vagrant
    rails new projectname
    cd projectname
    bundle install
    bundle exec rails server

Your site would then be available via your web browser at `http://localhost:3000/`.

## Database Info

Both MySQL and Postgres are installed. You can connect to them with the user `rails` (no password.)

## Useful Commands

To log out press `Ctrl+D` from inside the virtual machine.  

You can shut down the virtual machine with:

    vagrant halt

You can restart it with:

    vagrant up

If something gets messed up you can wipe the virtual machine with:

    vagrant destroy

## What's In The Box

* Git
* Ruby 2.1
* Bundler
* SQLite3, MySQL, and Postgres
* Databases and users needed to run the Active Record test suite
* System dependencies for nokogiri, imagemagick, sqlite3, mysql, mysql2, and pg
* Memcached
* Redis
* NodeJS

## License

Released under the MIT License, Copyright (c) 2012–<i>ω</i> Xavier Noria.

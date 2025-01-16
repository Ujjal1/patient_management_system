# README

Execute the following commands to run this code

Install RVM

`sudo apt-get install software-properties-common`

`sudo apt-add-repository -y ppa:rael-gc/rvm`

`sudo apt-get update`

`sudo apt-get install rvm`

`sudo usermod -a -G rvm $USER`

`echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc`

And then reboot the system

Then run `rvm install ruby-3.3.5`

Now clone this repo in your system and the run the following commands

`sudo apt install libpq-dev`

`bundle install`

`rails db:migrate `

And now run `rails server` to run the code and you can access the UI by going to the URL "localhost:3000" in your browser


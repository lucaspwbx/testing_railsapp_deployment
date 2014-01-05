set :application, "testing_deployment"
set :repository,  "git://github.com/lucasweiblen/testing_railsapp_deployment"
set :user, "vagrant"
set :deploy_to, "/home/vagrant/apps/testing_deployment"
set :use_sudo, false
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "192.168.1.4", :app, :web, :db, primary: true

namespace :deploy do
  task :start do
    sudo "service nginx start"
    sudo "service postgresql start"
    run "cd #{current_path} && bundle exec unicorn -c config/unicorn.rb -E production -D"
  end

  task :stop do
    sudo "service nginx stop"
    sudo "service postgresql stop"
    run "kill `cat /vagrant/tmp/unicorn_rails4demo.pid`"
  end

  task :restart do
    stop
    start
  end
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

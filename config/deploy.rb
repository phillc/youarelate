set :application, "youarelate"
set :deploy_to, "/opt/#{application}"

role :web, "linode"
role :app, "linode"
role :db, "linode", :primary => true



default_run_options[:pty] = true
set :repository,  "git@github.com:railsrumble/rr09-team-143.git"
set :scm, "git"
ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :use_sudo, false 

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

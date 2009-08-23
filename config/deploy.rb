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

  desc "Creates the database configuration on the fly"
  task :create_database_configuration, :roles => :app do
    require "yaml"
    set :production_db_password, proc { Capistrano::CLI.password_prompt("Remote production database password: ") }

    db_config = YAML::load_file("config/database.yml.template")
    db_config.delete('test')
    db_config.delete('development')
    db_config.delete('cucumber')

    db_config['production']['adapter'] = "mysql"
    db_config['production']['database'] = "youarelate"
    db_config['production']['username'] = "youarelate"
    db_config['production']['password'] = production_db_password
    db_config['production']['host'] = "localhost"

    put YAML::dump(db_config), "#{release_path}/config/database.yml", :mode => 0664
  end

  after "deploy:update_code", "deploy:create_database_configuration"
end

namespace :load do
  task :defaults do
    set :kemal_pid, -> { File.join(shared_path, "kemal.pid") }
    set :kemal_file, 'app.cr'
    set :kemal_env, 'development'
    set :kemal_log_file, 'kemal.log'
  end
end

namespace :deploy do
  after :updated, :build do
    on roles(:web) do
      execute "cd '#{release_path}' && shards install --production"
      execute "cd '#{release_path}' && crystal build --release src/#{fetch(:kemal_file)}"
    end
  end
end

namespace :kemal do
  task :start do
    on roles(:web) do
      execute "cd #{release_path}; KEMAL_ENV=#{fetch(:kemal_env)} ./app >> #{fetch(:kemal_log_file)} & echo $! > #{fetch(:kemal_pid)}"
    end
   end

  task :restart do
    on roles(:web) do
      invoke "kemal:stop"
      invoke "kemal:start"
    end    
  end

  task :stop do
    on roles(:web) do
      execute "kill -INT $(cat #{fetch(:kemal_pid)}) && rm #{fetch(:kemal_pid)}"
    end    
  end
end
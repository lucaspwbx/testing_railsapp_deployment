working_directory File.expand_path("../..", __FILE__)
worker_processes 2
listen "/tmp/unicorn.sock"
timeout 30
pid "/vagrant/tmp/unicorn_rails4demo.pid"
#stdout_path "/vagrant/tmp/unicorn.log"
#stderr_path "/vagrant/tmp/unicorn.log"

# frozen_string_literal: true

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_min = ENV.fetch('RAILS_MIN_THREADS') { 1 }
threads_max = ENV.fetch('RAILS_MAX_THREADS') { 4 }
threads threads_min, threads_max

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch('RAILS_ENV') { 'development' }

# Logging
stdout_redirect "#{Rails.root}/log/puma.stdout.log", "#{Rails.root}/log/puma.stderr.log", true

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
#port        ENV.fetch('PORT') { 3000 }

# Unix socket bind
bind        "unix://#{Rails.root}/tmp/sockets/puma.socket"

# Set master PID and state locations
pidfile     "#{Rails.root}/tmp/pids/puma.pid"
state_path  "#{Rails.root}/tmp/pids/puma.state"

activate_control_app

# Daemonize the server into the background. Highly suggest that
# this be combined with “pidfile” and “stdout_redirect”.
# The default is “false”.
# daemonize true

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

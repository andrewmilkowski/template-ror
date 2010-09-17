# This file is used by Rack-based servers to start the application.

# Rack Dispatcher

# Require your environment file to bootstrap Rails
require File.dirname(__FILE__) + '/config/environment'

use Rails::Rack::LogTailer
use Rails::Rack::Static

# Dispatch the request
run ActionController::Dispatcher.new


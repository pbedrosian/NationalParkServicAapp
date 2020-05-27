require './config/environment'
require 'HTTParty'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
use ExploresController
use UsersController
use ParksController

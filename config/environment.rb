require "active_record"
require "mysql2"
require "rspec"
require "rake"
require "pathname"

path_to_root_directory = File.expand_path('../../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)

lib_files = Dir[APP_ROOT.join('lib', '*.rb')]
lib_files.each do |file|
  require file
end


ActiveRecord::Base.establish_connection(
  :adapter => 'mysql2',
  :database => 'slcsp_finder',
  :host => 'localhost',
  :username => 'root'
)

ActiveRecord::Base.connection

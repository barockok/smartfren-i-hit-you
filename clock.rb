require File.expand_path('../config/boot',        __FILE__)
require File.expand_path('../config/environment', __FILE__)

include Clockwork

every(3.seconds, 'checking status'){ puts "i'll running the maintenance task" }
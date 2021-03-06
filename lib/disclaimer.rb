require "disclaimer/engine"
require File.expand_path('rails/actionpack/lib/action_controller/base', File.dirname(__FILE__))

module Disclaimer
  ACCEPTED = :accepted
    
  def self.enable_crud?
    @enable_crud
  end
  
  def self.enable_crud!
    @enable_crud = true
  end
  
  def self.host_app_root_path
    @host_app_root_path
  end
  
  def self.host_app_root_path=(path)
    @host_app_root_path = path
  end
  

end

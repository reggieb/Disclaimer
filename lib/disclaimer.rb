require "disclaimer/engine"
require 'rails/actionpack/lib/action_controller/base'

module Disclaimer
  ACCEPTED = :accepted
    
  def self.enable_crud?
    @enable_crud
  end
  
  def self.enable_crud!
    @enable_crud = true
  end
end

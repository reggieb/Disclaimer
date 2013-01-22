require "disclaimer/engine"
require 'rails/actionpack/lib/action_controller/base'

module Disclaimer
  ACCEPTED = :accepted
    
  def self.show_only
    @show_only 
  end
  
  def self.show_only=(bool)
    @show_only = bool
  end
end

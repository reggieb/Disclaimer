module Disclaimer
  class Segment < ActiveRecord::Base
    attr_accessible :body, :title, :name
    
    has_many :segment_holders
    has_many :documents, :through => :segment_holders
    
    validates :name, :presence => true
    
  end
end

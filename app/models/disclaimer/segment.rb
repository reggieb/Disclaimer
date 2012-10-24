module Disclaimer
  class Segment < ActiveRecord::Base
    attr_accessible :body, :title
    
    has_many :segment_holders
    has_many :documents, :through => :segment_holders
    
  end
end

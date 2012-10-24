module Disclaimer
  class Segment < ActiveRecord::Base
    attr_accessible :body, :title, :name
    
    before_save :underscore_name
    
    has_many :segment_holders
    has_many :documents, :through => :segment_holders
    
    validates :name, :presence => true
    
    def to_param
      name
    end  
    
    def title
      super || name.humanize
    end
    
    private
    def underscore_name
      self.name = self.name.downcase.gsub(/\s+/, '_')
    end
    
  end
end

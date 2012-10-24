require 'acts_as_list'

module Disclaimer
  class SegmentHolder < ActiveRecord::Base
    attr_accessible :document_id, :position, :segment_id
    
    belongs_to :document
    belongs_to :segment
    
    acts_as_list :scope => :document
    
    # I needed to use default_scope to preserve ordering in through relationships.
    # Using 'acts_as_list :scope => :document' alone does not preserve ordering
    # in the 'has_many :segments, :through => :segment_holders' relationship.
    default_scope :order => :position 
  end
end

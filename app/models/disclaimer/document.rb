module Disclaimer
  class Document < ActiveRecord::Base
    attr_accessible :footer, :header, :title, :name, :segments, :segment_ids
    
    before_save :underscore_name
    
    has_many :segment_holders, :uniq => true, :order => 'position'
    has_many :segments, :through => :segment_holders, :uniq => true
    accepts_nested_attributes_for :segments
    
    validates :name, :presence => true
    
    def segment_holder_for(segment)
      segment_holders.where(:segment_id => segment.id).first
    end
    
    def to_param
      name
    end
    
    def title
      ((!super || super.empty?) && name.present?) ? name.humanize : super
    end
    
    private
    def method_missing(method, *args)  
      segment = args.first     
      if act_as_list_methods.include?(method.to_sym) and segment.kind_of? Segment
        modify_via_segment_holder_acts_as_list_method(method, segment)
      else
        super(method, *args)
      end     
    end
    
    def act_as_list_methods
      @act_as_list_methods ||= ActiveRecord::Acts::List::InstanceMethods.instance_methods
    end

    # This method, together with method missing, is used to allow segments
    # to be ordered within a document. It allows an acts_as_list method to be
    # passed to the segment_holder holding a segment, so as to alter its position.
    #
    # For example:
    #   document.move_to_top document.segments.last
    #
    # will move the last segment so that it becomes the first within
    # document.segments.
    #
    #
    # The syntax is:
    #
    #   document.<acts_as_list_method> <the_segment_to_be_moved>
    #
    # The segment must already belong to the document
    def modify_via_segment_holder_acts_as_list_method(method, segment)
      segment_holder = segment_holder_for(segment)
      raise segment_not_associated_message(method, segment) unless segment_holder     
      segment_holder.send(method)  
    end
    
    def segment_not_associated_message(method, segment)
      <<EOF
The segment is not associated with the document, and therefore document.#{method}(segment) is not valid: 
#{inspect} 
#{segment.inspect}
EOF
    end
    
    def underscore_name
      self.name = self.name.downcase.gsub(/\s+/, '_')
    end
    
  end
end

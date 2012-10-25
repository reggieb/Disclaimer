module Disclaimer
  class Document < ActiveRecord::Base
    attr_accessible :footer, :header, :title, :name, :segments
    
    before_save :underscore_name
    
    has_many :segment_holders, :uniq => true
    has_many :segments, :through => :segment_holders, :uniq => true
    
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

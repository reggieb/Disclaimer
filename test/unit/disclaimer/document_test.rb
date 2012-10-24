require 'test_helper'

module Disclaimer
  class DocumentTest < ActiveSupport::TestCase
    def setup
      @document = Document.find(1)
      @segment = Segment.find(1)
    end
    
    def test_setup
      assert_equal(1, @document.id)
    end
    
    def test_segment_holder_for
      segment_holder = @segment.segment_holders.first
      assert_equal(segment_holder, @document.segment_holder_for(@segment))
    end 
    
    def test_name_under_scored_on_save
      @document.update_attribute(:name, "This is a Name")
      assert_equal('this_is_a_name', @document.name)
    end
    
    def test_title_if_empty
      @document.title = ""
      @document.name = "this_is_a_name"
      assert_equal("This is a name", @document.title)
    end
    
    def test_title_if_nil
      @document.title = nil
      @document.name = "this_is_a_name"
      assert_equal("This is a name", @document.title)
    end    
  end
end

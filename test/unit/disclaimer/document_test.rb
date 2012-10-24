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
  end
end

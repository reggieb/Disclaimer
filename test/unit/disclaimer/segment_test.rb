require 'test_helper'

module Disclaimer
  class SegmentTest < ActiveSupport::TestCase
    def setup
      @document = Document.find(1)
      @segment = Segment.find(1)
      @segment_two = Segment.find(2)
    end
    
    def test_ordering_preserver_via_through
      assert_equal([@segment.segment_holders.first, @segment_two.segment_holders.first], @document.segment_holders)
      assert_equal([@segment, @segment_two], @document.segments)
    end
    
    def test_reordering_via_segment_holder
      @document.segment_holders.first.move_to_bottom
      assert_equal([@segment_two, @segment], @document.segments)
    end
    
    def test_reordering_via_document
      @document.move_to_bottom(@segment)
      assert_equal([@segment_two, @segment], @document.segments)
    end
    
    def test_reordering_via_document_when_segment_not_in_document
      assert_raise RuntimeError do
        @document.move_to_bottom(new_segment)
      end
    end
    
    def test_cannot_add_duplicate_segments_to_document
      assert_no_difference '@document.segments.length' do
        @document.segments << @segment
      end
    end
    
    def new_segment
      Segment.new(:title => 'not in document')
    end
  end
end

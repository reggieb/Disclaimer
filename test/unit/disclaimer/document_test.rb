require 'test_helper'

module Disclaimer
  class DocumentTest < ActiveSupport::TestCase
    def setup
      @document = Document.find(1)
    end
    
    def test_setup
      assert_equal(1, @document.id)
    end
  end
end

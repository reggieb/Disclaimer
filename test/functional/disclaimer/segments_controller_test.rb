require 'test_helper'

module Disclaimer
  class SegmentsControllerTest < ActionController::TestCase

    def setup
      @segment = Segment.find(1)
    end
    
    def test_index
      get :index
      assert_response :success
      assert_equal(@segment, assigns('segment'))
    end
  
    def test_show
      get :show, :id => @segment.id
      assert_response :success
      assert_equal(@segment, assigns('segment'))
    end
  
    def test_new
      get :new
      assert_response :success
    end
    
    def test_create
      title = "Create segment"
      assert_difference 'Segment.count', 1 do
        post(
          :create, 
          :segment => {
            :title => title
          }
        )
      end
      assert_response :redirect
      assert_equal(title, Segment.last.title)
    end
    
    def test_edit
      get :edit, :id => @segment.id
      assert_equal(@segment, assigns('segment'))
      assert_response :success
    end    
    
    def test_update
      title = "Segment update"
      assert_no_difference 'Segment.count' do
        post(
          :update, 
          :id => @segment.id,
          :segment => {
            :title => title
          }        
        )
      end
      assert_response :redirect
      assert_equal(title, @segment.reload.title)
    end
  
    def test_delete
      get :delete, :id => @segment.id
      assert_response :success
      assert_equal(@segment, assigns('segment'))
    end
    
    def test_destroy
      assert_difference 'Segment.count', -1 do
        delete :destroy, :id => @segment.id, :use_route => :disclaimer 
      end
      assert_response :redirect
    end
  
  end
end

require 'test_helper'

module Disclaimer
  class DocumentsControllerTest < ActionController::TestCase
    
    def setup
      @document = Document.find(1)
    end
    
    def test_index
      get :index
      assert_response :success
      assert_equal(Document.all, assigns('documents'))
    end
  
    def test_show
      get :show, :id => @document.name
      assert_response :success
      assert_equal(@document, assigns('document'))
    end
  
    def test_new
      get :new
      assert_response :success
    end
    
    def test_create
      title = "Create document"
      assert_difference 'Document.count', 1 do
        post(
          :create, 
          :document => {
            :title => title,
            :name => 'new document'
          }
        )
      end
      assert_response :redirect
      assert_equal(title, Document.last.title)
    end
    
    def test_edit
      get :edit, :id => @document.name
      assert_equal(@document, assigns('document'))
      assert_response :success
    end    
    
    def test_update
      title = "Document update"
      assert_no_difference 'Document.count' do
        post(
          :update, 
          :id => @document.name,
          :document => {
            :title => title
          }        
        )
      end
      assert_response :redirect
      assert_equal(title, @document.reload.title)
    end
    
    def test_update_with_no_segments
      assert_equal(2, @document.segments.length)
      post(
        :update, 
        :id => @document.name,
        :document => {
          :segments => nil
        }        
      )
      assert_equal(0, @document.reload.segments.length)
    end
    
    def test_adding_one_segment
      segment = Segment.last
      post(
        :update, 
        :id => @document.name,
        :document => {
          :segments => {
            segment.id => 'yes'
          }
        }        
      )
      assert_equal([segment], @document.reload.segments)
    end
    
    def test_adding_two_segments
      test_update_with_no_segments
      post(
        :update, 
        :id => @document.name,
        :document => {
          :segments => {
            Segment.first.id => 'yes',
            Segment.last.id => 'yes'
          }
        }        
      )
      assert_equal(2, @document.reload.segments.length)
    end
    
    def test_adding_one_segment_after_two_segments_removed_the_extra_segment
      test_adding_two_segments
      test_adding_one_segment
    end
  
    def test_delete
      get :delete, :id => @document.name
      assert_response :success
      assert_equal(@document, assigns('document'))
    end
    
    def test_destroy
      assert_difference 'Document.count', -1 do
        delete :destroy, :id => @document.name, :use_route => :disclaimer 
      end
      assert_response :redirect
    end
    
    def test_accept
      post :accept, :id => @document.name
      assert_response :redirect
      root_url = "http://#{request.host_with_port}"
      assert_equal root_url, response.location
      assert_equal({@document.name.to_sym => ACCEPTED}, session[:disclaimer])
    end
    
    def test_accept_redirects_to_previous
      post :accept, {:id => @document.name}, {:disclaimer => {@document.name.to_sym => '/disclaimer/documents' }}
      assert_response :redirect
      assert_equal "http://#{request.host_with_port}/disclaimer/documents", response.location
      assert_equal({@document.name.to_sym => ACCEPTED}, session[:disclaimer])
    end
    
  end
end

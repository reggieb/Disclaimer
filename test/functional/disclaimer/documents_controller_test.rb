require 'test_helper'

module Disclaimer
  class DocumentsControllerTest < ActionController::TestCase
    
    def setup
      @document = Document.find(1)
    end
    
    def test_index
      get :index
      assert_response :success
      assert_equal(@document, assigns('document'))
    end
  
    def test_show
      get :show, :id => @document.id
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
      get :edit, :id => @document.id
      assert_equal(@document, assigns('document'))
      assert_response :success
    end    
    
    def test_update
      title = "Document update"
      assert_no_difference 'Document.count' do
        post(
          :update, 
          :id => @document.id,
          :document => {
            :title => title
          }        
        )
      end
      assert_response :redirect
      assert_equal(title, @document.reload.title)
    end
  
    def test_delete
      get :delete, :id => @document.id
      assert_response :success
      assert_equal(@document, assigns('document'))
    end
    
    def test_destroy
      assert_difference 'Document.count', -1 do
        delete :destroy, :id => @document.id, :use_route => :disclaimer 
      end
      assert_response :redirect
    end
  
  end
end

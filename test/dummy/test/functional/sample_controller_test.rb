require 'test_helper'

class SampleControllerTest < ActionController::TestCase

  def setup
    @document = Disclaimer::Document.first
  end

  def test_index_default_redirect
    get :index
    assert_redirected_to("/disclaimer/documents/#{@document.name}")
    path_to_sample_index = "http://#{request.host}/"
    assert_equal({@document.name.to_sym => path_to_sample_index}, session[:disclaimer])
  end

  def test_index_with_disclaimer_accepted
    get(
      :index,
      {},
      :disclaimer => {@document.name.to_sym => :accepted}
    )
    assert_response :success
  end

  def test_bypass_disclaimer
    get :bypass_disclaimer
    assert_response :success
    assert_nil session[:disclaimer], "Session should not be set when disclaimer is bypassed"
  end
end

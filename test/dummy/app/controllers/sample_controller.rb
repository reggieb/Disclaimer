class SampleController < ApplicationController

  disclaimer_name = Disclaimer::Document.first.name if Disclaimer::Document.first
  
  disclaimer disclaimer_name, :only => [:index]

  def index
  end

  def bypass_disclaimer
    render :index
  end

end

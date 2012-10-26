class SampleController < ApplicationController

  disclaimer Disclaimer::Document.first.name.to_sym, :only => [:index]

  def index
  end

  def bypass_disclaimer
    render :index
  end

end

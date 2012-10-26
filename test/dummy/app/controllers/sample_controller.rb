class SampleController < ApplicationController

  disclaimer(Disclaimer::Document.first.name.to_sym)

  def index
  end
end

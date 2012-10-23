module Disclaimer
  class Document < ActiveRecord::Base
    attr_accessible :footer, :header, :title
  end
end

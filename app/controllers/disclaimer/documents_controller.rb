require_dependency "disclaimer/application_controller"

module Disclaimer
  class DocumentsController < ApplicationController
    before_filter :get_document, :only => [:show, :delete, :destroy, :edit, :update]
    
    def index
      @document = Document.first
      render :show if @document
    end
  
    def show
    end
  
    def new
      @document = Document.new
    end
    
    def create
      new
      update
    end
    
    def edit
      render :new
    end
    
    def update
      @document.update_attributes(params[:document])
      redirect_to document_path(@document)      
    end
  
    def delete
    end
    
    def destroy
      @document.destroy
      redirect_to :controller => 'disclaimer/documents', :action => 'index'
    end
  
    private
    def get_document
      @document = Document.find(params[:id])
    end
    
  end
end

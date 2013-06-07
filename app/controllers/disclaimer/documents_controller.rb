require_dependency "disclaimer/application_controller"

module Disclaimer
  class DocumentsController < ApplicationController
    before_filter :get_document, :only => [:show, :delete, :destroy, :edit, :update, :accept]
    
    def index
      @documents = Document.all
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
      params[:document][:segments] = replace_with_segments(params[:document][:segments])    
      @document.update_attributes(params[:document])
      redirect_to document_path(@document)      
    end
  
    def delete
    end
    
    def destroy
      @document.destroy
      redirect_to :controller => 'disclaimer/documents', :action => 'index'
    end
    
    def accept
      return_path = disclaimer_return_path
      store_disclaimer_acceptance
      redirect_to return_path || host_app_root_path
    end
  
    private
    def get_document
      @document = Document.find_by_name(params[:id])
    end
    
    def replace_with_segments(hash_with_ids_as_keys = nil)
      if hash_with_ids_as_keys
        hash_with_ids_as_keys.keys.collect{|id| Segment.find(id)}
      else
        []
      end
    end

    def store_disclaimer_acceptance
      session[:disclaimer] ||= {}
      session[:disclaimer][@document.name.to_sym] = ACCEPTED
    end

    def disclaimer_return_path
      if session[:disclaimer]
        return_path = session[:disclaimer][@document.name.to_sym]
        return return_path if return_path != ACCEPTED
      end

    end
    
    def host_app_root
      '/'
    end
    
  end
end

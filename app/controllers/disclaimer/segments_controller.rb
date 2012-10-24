require_dependency "disclaimer/application_controller"

module Disclaimer
  class SegmentsController < ApplicationController
    before_filter :get_segment, :only => [:show, :delete, :destroy, :edit, :update]
    
    def index
      @segments = Segment.all
    end
  
    def show
    end
  
    def new
      @segment = Segment.new
    end
    
    def create
      new
      update
    end
    
    def edit
      render :new
    end
    
    def update
      @segment.update_attributes(params[:segment])
      redirect_to segment_path(@segment)      
    end
  
    def delete
    end
    
    def destroy
      @segment.destroy
      redirect_to :controller => 'disclaimer/segments', :action => 'index'
    end
  
    private
    def get_segment
      @segment = Segment.find(params[:id])
    end
  end
end

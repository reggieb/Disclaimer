
module ActionController
  class Base < Metal

    def self.disclaimer(document_name, options = {})

      before_filter(options) {|c| c.redirect_to_disclaimer(document_name)}

    end

    def redirect_to_disclaimer(document_name)
      return unless disclaimer_exists?(document_name)
      @disclaimer_document_name = document_name.to_sym
      unless disclaimer_has_been_accepted
        store_disclaimer_return_location
        document = Disclaimer::Document.find_by_name(@disclaimer_document_name)
        redirect_to host_app_root_path + disclaimer.document_path(document)
      end
    end

    def disclaimer_has_been_accepted
      session[:disclaimer] && session[:disclaimer][@disclaimer_document_name] == Disclaimer::ACCEPTED
    end

    def store_disclaimer_return_location
      session[:disclaimer] ||= {}
      session[:disclaimer][@disclaimer_document_name] = url_for(request.parameters)
    end
    
    def disclaimer_exists?(document_name = nil)
      if document_name and Disclaimer::Document.exists?(:name => document_name)
        return true
      else
        Rails.logger.error "No disclaimer displayed as unable to find Disclaimer::Document with name '#{document_name || 'nil'}'"
        return false
      end
    end
    
    def host_app_root_path
      (Disclaimer.host_app_root_path || main_app.root_path).gsub(/\/$/, "")
    end

  end
end

module ActionController
  class Base < Metal

    def self.disclaimer(document_name, options = {})
      before_filter(options) {|c| c.redirect_to_disclaimer(document_name)}
    end

    def redirect_to_disclaimer(document_name)
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
    
    def host_app_root_path
      (Disclaimer.host_app_root_path || main_app.root_path).gsub(/\/$/, "")
    end

  end
end
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    add_flash_types :success, :danger

    protected
  
    def configure_permitted_parameters
      added_attrs = [ :name, :email, :password ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
end

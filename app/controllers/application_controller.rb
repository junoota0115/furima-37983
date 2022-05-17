class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'junjun' && password =='7777'
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:second_name,:first_name_kana,:second_name_kana,:birthday])
    end
  end
end

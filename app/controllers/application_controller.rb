class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    #protect_from_forgery with: :exception
    include UserAuth
    before_action :set_jbuilder_defaults
    before_action :set_locale

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
        { locale: I18n.locale }
    end
    def set_jbuilder_defaults
        @errors = []
        @current_user = current_user
    end

    def error!(message,status)
        @errors << message
        response.status = status
        render template: "api/v1/errors"
    end

    def error_array!(array,status)
        @errors = array
        response.status = status
        render template: "api/v1/errors"
    end

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end
end

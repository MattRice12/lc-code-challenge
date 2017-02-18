class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include HttpAcceptLanguage::AutoLocale

  before_action :set_locale

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end

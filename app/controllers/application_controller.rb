class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :resolve_layout


  private

  def resolve_layout
    case action_name
    when "new"
      "new_form_layout"
    else
      "application"
    end
  end
end

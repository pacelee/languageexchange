class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_before_action :authenticate_user!, only: [:home, :info]
  layout :layout_for_page

  private

  def info
  end

  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end
end

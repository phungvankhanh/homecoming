class ApplicationController < ActionController::Base
  before_action :notifications

  def notifications
    @notifications = Notification.where('created_at >= :one_hours_ago', :one_hours_ago  => Time.now - 1.hours).reverse
  end
end

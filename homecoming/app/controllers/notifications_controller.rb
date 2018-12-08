class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where('created_at >= :one_hours_ago', :one_hours_ago  => Time.now - 1.hours).reverse
  end
end

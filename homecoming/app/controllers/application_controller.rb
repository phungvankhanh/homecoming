class ApplicationController < ActionController::Base
  before_action :notifications

  def notifications
    @notifications = Notification.all.reverse
  end
end

class Notification < ApplicationRecord
  after_create_commit { NotificationBroadcastJob.perform_later(Notification.where('created_at >= :one_hours_ago', :one_hours_ago  => Time.now - 1.hours).reverse.count,self)}
end

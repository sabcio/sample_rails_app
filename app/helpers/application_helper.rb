module ApplicationHelper

  def database_working?
    ActiveRecord::Base.connection.active?
    "up"
  rescue PG::ConnectionBad
    "down"
  end

  def redis_working?
    !!Redis.new.ping
    "up"
  rescue Redis::CannotConnectError
    "down"
  end
end

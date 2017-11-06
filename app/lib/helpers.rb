module Pakyow::Helpers
  # define methods here that are available from routes, bindings, etc
  def redis
    Pakyow::Realtime.redis
  end
end

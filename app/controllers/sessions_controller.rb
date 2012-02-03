class SessionsController < Devise::SessionsController
  before_filter :hide_topbar
end

class Admin::BaseController < ApplicationController
  inherit_resources
  layout 'admin'
  before_filter :authenticate_user!
end
class ReportsController < ApplicationController
  main_nav_highlight :reports

  def index
  	@reports = current_user.reports
  end

  def edit
  	@report = current_user.reports.find(params[:id])
  end
end
class ReportController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @report = Report.new(report_param)
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocesable_entity
    end
  end
  def index
    @report = Report.all
    render json: @report
  end

  private
  def report_param
    params.required(:report).permit(:status, :description)
  end
end

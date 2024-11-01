class ReportController < ApplicationController
  def create
    @report = Report.new(report_param)
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end
  def index
    @report = Report.all
    render json: @report
  end
  def update
    @report = Report.find(params[:id])
    if @report.update(report_update_params)
      render json: { message: "Your report has been updated", data: @report }, status: :ok
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end
  def delete
    @report = Report.find(params[:id])
    if @report.delete
      render json: { message: "the report has been deleted", data: @report }, status: :ok
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end
  private
  def report_param
    params.require(:report.id).permit(:status, :description)
  end
  def report_update_params
    params.require(:report).permit(:status)
  end
end

class ReportsController < ApplicationController
  before_action :require_login

  def index
  end

  def new_employees
  end

  def generate_new_employees
    @start = params[:start]
    @end = params[:end]
    @employees = Employee.where("hired_date >= :start AND hired_date <= :end", start: @start, end: @end).order(hired_date: :asc)
    respond_to do |format|
      format.xlsx { 
        response.headers['Content-Disposition'] = "attachment; filename=\"Nuevos Ingresos #{@start.to_s} A #{@end.to_s}.xlsx\""
        render :new_employees
      }
    end
  end

  def candidates
  end

  def candidates_search
    @candidates = Candidate.all
    if !params[:deparment].blank?
      @candidate = @candidates.where()
    end
    puts params
  end
  
end

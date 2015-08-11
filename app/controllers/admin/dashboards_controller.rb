class Admin::DashboardsController < ApplicationController
  respond_to :json

  def index
    render :json => {
      :students => Student.all,
      :employees => Employee.all,
      :students_female_count => Student.where(:gender => "female").count,
      :students_male_count => Student.where(:gender => "male").count,
      :employees_govt_pay => Employee.joins(:paid_type).where(paid_types: { title: 'Government pay' }),
      :employees_section => Employee.joins(:section).where(sections: { title: 'Non-teaching' }),
      :expense => ExpenseReceipt.where("EXTRACT(DAY FROM created_at) = ?", Date.today.day).sum(:amount),
      :expense_current_month => ExpenseReceipt.where("EXTRACT(MONTH FROM created_at) = ?", Date.today.month).sum(:amount),
      :salary_expenses_last_month => EmployeeSalaryReceipt.joins(:salary_receipt).where("EXTRACT(MONTH FROM month) = ?", Date.today.month-1).sum(:salary),

      :today_fees_collection => Receipt.where("EXTRACT(DAY FROM created_at) = ?", Date.today.day).sum(:cash),
      :current_month_fees_collection => Receipt.where("EXTRACT(MONTH FROM created_at) = ?", Date.today.month).sum(:cash),
      :last_month_fees_collection => Receipt.where("EXTRACT(MONTH FROM created_at) = ?", Date.today.month-1).sum(:cash)
    }
  end
end

class EmployeesController < ApplicationController

def index
    @employees = Employee.all
end

def show
    @employee = Employee.find(params[:id])
end

def new 
    @employee = Employee.new
end

def edit
    @employee = Employee.find(params[:id])
end

def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
        flash[:success] = "New Employee Created"
        redirect_to employee_path(@employee)
    else
        flash[:errors] = @employee.errors.full_messages
        redirect_to new_employee_path
    end
end

def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employee_path(@employee)
end

private

def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
end

end

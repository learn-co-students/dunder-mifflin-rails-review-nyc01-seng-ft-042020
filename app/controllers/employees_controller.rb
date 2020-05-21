class EmployeesController < ApplicationController
# before_action :find_employee, only: [:show,:edit,:update]

    def index
        @employee = Employee.all
    end
    def show
        @employee = Employee.find(params[:id])
    end
    
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee.valid?
        redirect_to employee_path(@employee.id)
        else 
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end
    
    def update
        @employee = Employee.find(params[:id])
 
        @employee.update(employee_params)
        redirect_to employee_path(@employee.id)  
    end

def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
end

    private
    def employee_params
    params.require(:employee).permit(:first_name, :last_name,:title,:alias,:img_url,:dog_id)
    end


end

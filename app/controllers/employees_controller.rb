class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end
    
      def show
        @employee = Employee.find_by(id: params[:id])
      end
    
      def new
        @employee = Employee.new
       
      end
    
      def create
        @employee = Employee.new(employee_params)
    
        if @employee.valid?
            @employee.save
          redirect_to employee_path(@employee)
        else
            flash[:errors] = @employee.errors.full_messages
          redirect_to new_employee_path
        end

        
      end
    
      def edit
        @employee = Employee.find_by(id: params[:id])
      end
    
      def update
        @employee = Employee.find_by(id: params[:id])
        @employee.update(employee_params)
    
        if @employee.valid?
          redirect_to employee_path(@employee)
        else
          render :edit
        end
        
      end
    
      def destroy
        employee = Employee.find_by(id: params[:id])
        employee.destroy
        redirect_to employees_path
      end
    
      private
    
      def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id, dog_attributes: [:name, :breed, :age])
      end
end

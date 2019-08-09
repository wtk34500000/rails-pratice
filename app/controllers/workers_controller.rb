class WorkersController < ApplicationController

    def index
        @workers=Worker.all
    end

    def new 
        @worker=Worker.new
    end

    def create
        puts params
        @worker=Worker.new(worker_params)
        if @worker.save
            redirect_to "/workers"
        else
            render :new
        end
    end

    def show
        @worker=Worker.find(params[:id])
    end

    def destroy
        worker=Worker.find(params[:id])
        worker.destroy
        redirect_to "/workers"
    end

    private
    def worker_params
        params.require(:worker).permit(:name, :company_name, :email)
    end

end

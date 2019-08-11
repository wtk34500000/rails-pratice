class WorkersController < ApplicationController

    def index
        @workers=Worker.all
        # render :json => @workers
    end

    def new 
        @worker=Worker.new
        @orders=Order.all
    end

    def create
        order=Order.find(params[:worker][:order_id])
        if order.workers.length < 5
            @worker=Worker.new(worker_params)
            if @worker.save
                redirect_to "/workers"
            else
                render :new
            end

        else
            render :new
        end

    end

    def show
        @worker=Worker.find(params[:id])
        render :json => @worker
    end

    def destroy
        worker=Worker.find(params[:id])
        worker.destroy
        redirect_to "/workers"
    end

    private
    def worker_params
        params.require(:worker).permit(:name, :company_name, :email, :order_id)

    end

end

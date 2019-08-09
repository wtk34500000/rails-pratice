class OrdersController < ApplicationController

    def index
        @orders=Order.all
    end

    def new
        @order = Order.new
        @workers=Worker.all
    end

    def show
    end

    def create
        @order=Order.new(order_params)
        if @order.save
            redirect_to "/orders"
        else 
            render :new
        end
    end

    private
    def order_params
        params.require(:order).permit(:title, :description, :deadline, :workerId)
    end
end

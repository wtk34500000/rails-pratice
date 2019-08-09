class OrdersController < ApplicationController

    def index
        @orders=Order.all
    end

    def new
        @order = Order.new
        @workers=Worker.all
    end

    def show
        @order=Order.find(params[:id])
    end

    def update
        puts params
        @order=Order.find(params[:id])
        if @order.update(order_params)
            redirect_to "/orders"
        else 
            render :edit
        end
    end

    def edit
        @order=Order.find(params[:id])
        @workers=Worker.all

    end

    def create
        @order=Order.new(order_params)
        if @order.save
            redirect_to "/orders"
        else 
            render :new
        end
    end

    def destroy
        order=Order.find(params[:id])
        order.destroy
        redirect_to "/orders"
    end

    private
    def order_params
        params.require(:order).permit(:title, :description, :deadline, :workerId)
    end
end

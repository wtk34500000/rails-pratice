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
                @order = Order.new
                @workers=Worker.all
                render :new
            end
    end

    def destroy
        order=Order.find(params[:id])
        order.destroy
        redirect_to "/orders"
    end

    def api
        @orders=Order.all
        render :json => @orders
    end

    private
    def order_params
        params.require(:order).permit(:title, :description, :deadline)
    end
end

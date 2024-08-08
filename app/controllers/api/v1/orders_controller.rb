module Api 
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: [:show, :update_order_fields]

      def show
        @customer = @order&.customer
      end

      def update_order_fields
        if @order.update(update_params)
          @customer = @order.customer
          render :show
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end
    
      private

      def update_params
        {
          delivery_date: Date.today,
          delivery_time: Time.now,
          status: :delivered
        }
      end
    
      def set_order
        @order = Order.find(params[:id])
      end

    end
  end
end


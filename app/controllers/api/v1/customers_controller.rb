module Api 
  module V1
    class CustomersController < ApplicationController
      before_action :set_customer, only: [:show, :update]
    
      # GET /customers
      def index
        @customers = Customer.search(params[:query])
      end
    
      # GET /customers/:id
      def show
      end
    
      private
    
      def set_customer
        @customer = Customer.find(params[:id])
      end
    end
  end
end


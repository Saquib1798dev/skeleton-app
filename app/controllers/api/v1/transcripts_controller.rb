module Api 
  module V1
    class TranscriptsController < ApplicationController

      def create
        @transcript = Transcript.new(transcript_params)
        if @transcript.save
          render json: @transcript, status: :created
        else
          render json: @transcript.errors, status: :unprocessable_entity
        end
      end

      private 

      def transcript_params
        params.require(:transcript).permit(:customer_id, :content)
      end
    end
  end
end


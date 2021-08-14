module Api
  module V1
    class TestController < ApplicationController

      def index
        render json: Test.all
      end

      def create
        test = Test.new(test_param)

        if test.save
          render json: test, status: :created
        else
          render json: test.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Test.find(params[:id]).destroy!

        head :no_content
      end

      private

      def test_param
        params.require(:test).permit(:name, :address)
      end
    end
  end
end
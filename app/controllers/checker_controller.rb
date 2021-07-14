class CheckerController < ApplicationController
    def check_name
        @generated_name = Main.call(params[:name], params[:numeric])
        render action: :show
    end

    def show
    end
end

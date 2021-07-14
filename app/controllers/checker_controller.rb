class CheckerController < ApplicationController
  def check_name
    @generated_name = GitHub.call(params[:name], params[:numeric])
		render action: :show
  end

  def show; end
end

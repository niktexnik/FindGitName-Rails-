class CheckerController < ApplicationController
  helper_method :error_message
  def check_name
    begin
      @generated_name = GitHub.call(params[:name], params[:numeric])
    rescue Parser::ParseError => e
      @error_message = e.message
    end
		render action: :show
  end

  def show; 

  end

  private
  def error_message
    @error_message
  end
end

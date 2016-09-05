class MonstersController < ApplicationController
  
  def index
  	@emails = []
  	if current_user != nil
		@emails = inbox_emails
  	end
  end 

  def email
    index_number = params[:id].to_i
    @email = inbox_emails[index_number]
    render :email
  end

  def destroy
    index_number = params[:id].to_i
    @email = inbox_emails[index_number]
    puts '---------------------------------'
    # @email.delete!
    redirect_to root_path
  end

end

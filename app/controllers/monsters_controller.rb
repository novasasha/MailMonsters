class MonstersController < ApplicationController

  def index
  	@emails = []
  	if current_user != nil
		@emails = user_gmai_inbox
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
    @email.delete!
    redirect_to root_path
  end

end

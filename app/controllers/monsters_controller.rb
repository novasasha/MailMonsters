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
  end

end

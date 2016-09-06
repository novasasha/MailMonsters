class MailController < ApplicationController

  def index
    emails = []
    if current_user != nil
      inbox = user_gmail_location('inbox')
		  emails = location_emails(inbox)
    end
    render json: emails.to_json
  end

  def trash
    trash = user_gmail_location('trash')
    emails = []
    emails = location_emails(trash)
    render json: emails.to_json
  end

  def junk
    junk = user_gmail_location('junk')
    emails = []
    emails = location_emails(junk)
    render json: emails.to_json
  end

  def email
    index_number = params[:id].to_i
    inbox = user_gmail_location('inbox')
    email = location_emails(inbox)[index_number]
    render json: email.to_json
  end

  def compose
  end

  def send_email
    email_address = params[:address]
    email_subject = params[:subject]
    email_body = params[:body]

    email = user_gmail.compose do
      to      email_address
      subject email_subject
      body    email_body
    end
    email.deliver!
    redirect_to root_path
  end

  def destroy
    index_number = params[:id].to_i
    email = inbox_emails[index_number]
    email.delete!
    redirect_to root_path
  end

end

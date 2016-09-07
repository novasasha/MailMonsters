class EmailsController < ApplicationController

  def index
    if current_user != nil
      if current_user.monster_id == nil
        redirect_to monster_selector_path
      else
        redirect_to inbox_path
      end
    end
  end

  def monster_selector
  end

  def monster_choice
    monster = params[:commit].to_i
    current_user.monster_id = monster
    current_user.save
    redirect_to root_path
  end

  def inbox
    @emails = []
    inbox = user_gmail_mail_box('inbox')
    @emails = location_emails(inbox)
  end

  def trash
    trash = user_gmail_mail_box('trash')
    @emails = []
    @emails = location_emails(trash)
  end

  def junk
    junk = user_gmail_mail_box('junk')
    @emails = []
    @emails = location_emails(junk)
  end

  def email
    index_number = params[:id].to_i
    inbox = user_gmail_mail_box('inbox')
    @email = location_emails(inbox)[index_number]
    render :email
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
    @email = inbox_emails[index_number]
    @email.delete!
    redirect_to root_path
  end

end

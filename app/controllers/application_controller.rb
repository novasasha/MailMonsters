class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :user_gmail, :user_gmail_inbox, :inbox_emails, :sender_name, :sender_email_address, :email_subject, :email_recieved_date, :email_text_body, :list_all_labels, :create_label, :delete_label, :apply_label, :create_and_apply_label

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_gmail
  	user = current_user
	   gmail = Gmail.connect(:xoauth2, user.email, user.oauth_token)
  end

  def user_gmail_inbox
  	user_gmail.inbox
  end

  def inbox_emails
  	user_gmail_inbox.emails
  end

  def sender_name(email)
	name = email.sender.collect(&:name)
	name
  end

  def sender_email_address(email)
  	email_address = email.message.from[0]
  	email_address
  end

  def email_subject(email)
  	email.message.subject
  end

  def email_recieved_date(email)
  	email.message.date.strftime('%b %d')
  end

  def email_text_body(email)
  	email.message.text_part.body.decoded
  end

  def list_all_labels
    user_gmail.labels.all
  end

  def create_label(label)
    user_gmail.labels.new(label)
  end

  def delete_label(label)
    user_gmail.labels.delete(label)
  end

  def apply_label(email, label)
    email.label(label)
  end

  def create_and_apply_label(email, label)
    email.label!(label)
  end
end

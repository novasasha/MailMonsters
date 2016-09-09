class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :user_gmail, :user_gmail_inbox, :sender_name, :sender_email_address, :email_subject, :email_recieved_date, :email_text_body, :list_all_labels, :create_label, :delete_label, :apply_label, :create_and_apply_label, :reaction, :unread_message_check, :junk_check, :to_do_check

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_gmail
    user = current_user
	  @gmail ||= Gmail.connect(:xoauth2, user.email, user.oauth_token)
  end

  def user_gmail_mailbox(mailbox)
  	user_gmail.mailbox(mailbox)
  end

  #Displays emails from the last two weeks. The time_shift shifts that back another two weeks every time it's incremented by one
  def user_gmail_recent(mailbox, time_shift = 1)
    two_weeks_ago = Date.today - 14
    if time_shift = 1
      user_gmail.mailbox(mailbox).find(:after => two_weeks_ago)
    else
      start_date = two_weeks_ago - 14 * time_shift
      end_date = Date.today - 14 * time_shift
      user_gmail.mailbox(mailbox).find(:after => start_date, :before => end_date)
    end
  end

  def location_emails(mailbox)
  	mailbox.emails
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
    if email.message.text_part
  	   email.message.text_part.body.decoded
    else
      email.message.body.to_s.chomp
    end
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

  def reaction(monster)
    if unread_message_check #&& junk_check && to_do_check
      monster.positive_reactions.sample
    else
      monster.negative_reactions.sample
    end
  end

  def unread_message_check
    user_gmail.inbox.count(:unread) < 10
  end

  # def junk_check
  #   user_gmail.mailbox('junk').count < 10
  # end

  # def to_do_check
  #   if !user_gmail.labels.all.include?('todo')
  #     true
  #   else
  #     user_gmail.label('todo').emails.count < current_user.to_do_limit
  #   end
  # end

end

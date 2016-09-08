class EmailsController < ApplicationController

  #displays search results NOT SURE WHERE TO DISPLAY RESULTS
  def search
    if current_user != nil
    query = params[:query]
    @emails = user_gmail.inbox.emails(gm: query)
    else
      redirect_to root_path
    end
  end

# open a mail depending on what is supplied to as params eg inbox, trash junk
  def mailbox
    if current_user != nil
    @emails = []
    mailbox = params[:mailbox]
    @emails = user_gmail_recent(mailbox)
    else
      redirect_to root_path
    end
  end

# open a clicked on email
  def show
    if current_user != nil
      index_number = params[:id].to_i
      location = params[:mailbox]
      box = user_gmail_mailbox(location)
      @email = location_emails(box)[index_number]
    else
      redirect_to root_path
    end
  end

# links to a page to create a email
  def new
    if current_user != nil
    else
      redirect_to root_path
    end
  end


# sends the email
  def create
    if current_user != nil
      email_address = params[:address]
      email_subject = params[:subject]
      email_body = params[:body]

      email = user_gmail.compose do
        to      email_address
        subject email_subject
        body    email_body
      end
      email.deliver!
    else
    end
    redirect_to root_path
  end

# deletes the email from the inbox and moves it to the trash
  def destroy
    if current_user != nil
      index_number = params[:id].to_i
      @email = inbox_emails[index_number]
      @email.delete!
    else
    end
    redirect_to root_path
  end
end

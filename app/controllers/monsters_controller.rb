class MonstersController < ApplicationController

# determines if the user is logged in and if the user is a new user to this site
  def index
    if current_user != nil
      if current_user.monster_id == nil
        redirect_to monster_selector_path
      else
        redirect_to "/inbox"
      end
    end
  end

# links to the page the user can pick their monster
  def monster_selector
  end

# saves the monster as the users choice
  def monster_choice
    monster = params[:commit].to_i
    current_user.monster_id = monster
    current_user.save
    redirect_to root_path
  end
end

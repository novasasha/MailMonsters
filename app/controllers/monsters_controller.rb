class MonstersController < ApplicationController

# determines if the user is logged in and if the user is a new user to this site
  def index
    if current_user != nil
      redirect_to "/inbox"
    end
  end

# links to the page the user can pick their monster
  def monster_selector
    if current_user != nil
    else
      root_path
    end
  end

# saves the monster as the users choice
  def monster_choice
    if current_user != nil
      monster_name = params[:commit].downcase
      monster_object = Monster.find_by name: monster_name
      current_user.monster_id = monster_object.id
      current_user.save
    else
    end
    redirect_to root_path
  end
end

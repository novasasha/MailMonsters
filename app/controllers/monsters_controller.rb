class MonstersController < ApplicationController

  def index
    if current_user != nil
      if current_user.monster_id == nil
        redirect_to monster_selector_path
      else
        redirect_to "/inbox"
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
end

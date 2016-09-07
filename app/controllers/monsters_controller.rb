class MonstersController < ApplicationController

  def index
    if current_user != nil
      # if current_user.monster_id == nil
      #   redirect_to monster_selector_path
      # end
      redirect_to inbox_path
    end
  end

  def monster_selector
  end
end

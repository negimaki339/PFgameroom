class SearchsController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end
   private
  def search_for(model, content, method)
    if model == 'team_name'
      if method == 'perfect'
        Team.where(team_name: content)
      else
        Team.where('team_name LIKE ?', '%'+content+'%')
      end

    elsif model == 'game_name'
      if method == 'perfect'
        Team.where(game_name: content)
      else
        Team.where('game_name LIKE ?', '%'+content+'%')
      end
    end
  end
end

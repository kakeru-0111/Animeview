class ActorsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def new
    
        @actor = Actor.new
    
    end
    def index
        
        if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
            search = params[:search]
      
            @actors = Actor.joins(:user).where("anime_name LIKE ? OR company_name LIKE?", "%#{search}%", "%#{search}%").sort {|a,b| b.liked_users.count <=> a.liked_users.count}
            
        
        else
            @actors = Actor.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
      
        end
        @actors = Kaminari.paginate_array(@actors).page(params[:page]).per(10)
    end
    def create
        actor = Actor.new(actor_params)
        actor.user_id = current_user.id 
        if actor.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def show
        @actor = Actor.find(params[:id])
        @reviews = @actor.reviews
        @review =Review.new
    end

    def edit
        @actor = Actor.find(params[:id])
    end

    def update
        actor = Actor.find(params[:id])
        if actor.update(actor_params)
            redirect_to :action => "show", :id => actor.id
        else
            redirect_to :action => "new"
        end
    end
    
    
    def destroy
        anime = Anime.find(params[:id])
        anime.destroy
        redirect_to action: :index
    end
    private
    def actor_params
        params.require(:actor).permit(:actor, :character, :anime_name, :zimusho)
    end
end

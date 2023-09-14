class AnimesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    
    @anime = Anime.new
    
  end
  def index
    if params[:tag]
      Tag.create(name: params[:tag])
    end
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      
      @animes = Anime.joins(:user).where("anime_name LIKE ? OR genre LIKE?", "%#{search}%", "%#{search}%").sort {|a,b| b.liked_users.count <=> a.liked_users.count}.page(params[:page]).per(10)
      if params[:tag_ids]
        @animes = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_animes = Tag.find_by(name: key).animes
            @animes = @animes.empty? ? tag_animes : @animes & tag_animes
          end
        end
      end
    else
      @animes = Anime.all
      if params[:tag_ids]
        @animes = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_animes = Tag.find_by(name: key).animes
            @animes = @animes.empty? ? tag_animes : @animes & tag_animes
          end
        end
      end
    end
  end

  def popure

    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      
      @rank_animes = Anime.joins(:user).where("anime_name LIKE ? OR genre LIKE?", "%#{search}%", "%#{search}%").sort {|a,b| b.liked_users.count <=> a.liked_users.count}.page(params[:page]).per(3)

      if params[:tag_ids]
        @rank_animes = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_animes = Tag.find_by(name: key).animes
            @rank_animes = @rank_animes.empty? ? tag_animes : @rank_animes & tag_animes
          end
        end
      end
    else
      @rank_animes = Anime.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
      if params[:tag_ids]
        @rank_animes = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_animes = Tag.find_by(name: key).animes
            @rank_animes = @rank_animes.empty? ? tag_animes : @rank_animes & tag_animes
          end
        end
      end
    end
  end
    
  

  def create
    anime = Anime.new(anime_params)
    anime.user_id = current_user.id 
    if anime.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @anime = Anime.find(params[:id])
    @comments = @anime.comments
    @comment = Comment.new
  end

  

  def edit
    @anime = Anime.find(params[:id])
  end
    

  def update
    anime = Anime.find(params[:id])
    if anime.update(anime_params)
      redirect_to :action => "show", :id => anime.id
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
  def anime_params
    params.require(:anime).permit(:anime_name,:genre,:age, :overall, tag_ids: [])
  end
end

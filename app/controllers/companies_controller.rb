class CompaniesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def new
    
        @company = Company.new
    
    end
    def index
        
        if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
            search = params[:search]
      
            @companies = Company.joins(:user).where("anime_name LIKE ? OR company_name LIKE?", "%#{search}%", "%#{search}%").sort {|a,b| b.liked_users.count <=> a.liked_users.count}
            
        
        else
            @companies = Company.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
      
        end
        @companies = Kaminari.paginate_array(@companies).page(params[:page]).per(10)
        
    end
    def create
        company = Company.new(company_params)
        company.user_id = current_user.id 
        if company.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def company_show
        @company = Company.find(params[:id])
        @comments = @company.comments
        @comment = Comment.new
    end

    def edit
        @company = Company.find(params[:id])
    end

    def update
        company = Company.find(params[:id])
        if company.update(company_params)
            redirect_to :action => "show", :id => company.id
        else
            redirect_to :action => "new"
        end
    end
    
    
    def destroy
        company = Company.find(params[:id])
        company.destroy
        redirect_to action: :index
    end
    private
    def company_params
        params.require(:company).permit(:company, :anime_name)
    end
end
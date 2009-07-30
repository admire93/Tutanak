class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.xml
  def index
    @teams = Team.all
		unless session[:user_id] 
			redirect_to :controller => 'main', :action => 'login'
		end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.xml
  def show
    @team = Team.find_by_alias(params[:id])
    session[:team_id] = @team.id
    @is_joined = Team.is_user_join? session[:user_id], session[:team_id]
	  respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.xml
  def new
    @team = Team.new
		if session[:user_id]
			@session = session[:user_id]
			respond_to do |format|
			  format.html # new.html.erb
			  format.xml  { render :xml => @team }
    end
		else
			@session = nil
			redirect_to :controller => "main", :action => "login"
		end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find_by_alias(params[:id])
  end

  # POST /teams
  # POST /teams.xml
  def create
    @team = Team.new(params[:team])
		@teams_user = TeamsUser.new   
    
    @teams_user.user_id = session[:user_id]
    @teams_user.status = 1 
    respond_to do |format|
      if @team.save 
        @teams_user.team_id = @team.id
        if @teams_user.save
          flash[:notice] = 'Team was successfully created.'
          format.html { redirect_to :action => @team.alias }
          format.xml  { render :xml => @team, :status => :created, 
                               :location => @team 
                      }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.xml
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        flash[:notice] = 'Team was successfully updated.'
        format.html { redirect_to(@team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.xml
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to(teams_url) }
      format.xml  { head :ok }
    end
  end
	def search
		@teams = Team.find_by_sql "SELECT * FROM teams where alias like
		'%#{params[:search]}%' or title like '%#{params[:search]}%'"
	end
  def preference
    @team = Team.find_by_alias(params[:id])
    @reservation_users = []
    @update_path = '/teams_user/' + @team.id
    for ruser in @team.user
      if ruser.status.to_i == 3
        @reservation_users << ruser
      end
    end
  end
end

class TeamsUsersController < ApplicationController
  # GET /teams_users
  # GET /teams_users.xml
  def index
    @teams_users = TeamsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teams_users }
    end
  end

  # GET /teams_users/1
  # GET /teams_users/1.xml
  def show
    @teams_user = TeamsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teams_user }
    end
  end

  # GET /teams_users/new
  # GET /teams_users/new.xml
  def new
    @teams_user = TeamsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teams_user }
    end
  end

  # GET /teams_users/1:/edit
  def edit
    @teams_user = TeamsUser.find(params[:id])
  end

  # POST /teams_users
  # POST /teams_users.xml
  def create
    @teams_user = TeamsUser.new(params[:teams_user])
    @teams_user.team_id = session[:team_id]
    @teams_user.user_id = session[:user_id]
    @teams_user.status = false
    @team = Team.find_by_id(session[:team_id])
    @is_joined = Team.is_user_join? session[:user_id], session[:team_id]
    if @is_joined[0]
      flash[:notice] = 'you already join this team'
      redirect_to :controller => 'teams', :action => @team.alias
    else
      respond_to do |format|
        if @teams_user.save
          flash[:notice] = User.find_by_id(session[:user_id]).alias
          flash[:notice] += ' successfully joined'
          format.html { redirect_to(:controller => 'teams', 
                                    :action => @team.alias)}
          format.xml  { render :xml => @teams_user, :status => :created,
                               :location => @teams_user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @teams_user.errors, 
                               :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /teams_users/1
  # PUT /teams_users/1.xml
  def update
    @teams_user = TeamsUser.find(params[:id])

    respond_to do |format|
      if @teams_user.update_attributes(params[:teams_user])
        flash[:notice] = 'TeamsUser successfully updated'
        format.html { redirect_to(@teams_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teams_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_users/1
  # DELETE /teams_users/1.xml
  def destroy
    @teams_user = TeamsUser.find(params[:id])
    @teams_user.destroy

    respond_to do |format|
      format.html { redirect_to(teams_users_url) }
      format.xml  { head :ok }
    end
  end
end

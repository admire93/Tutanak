class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @user = User.all
    @team = @user.team

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find_by_alias(params[:id])
    @new_diary = @user.diaries.find(:all, :order => "created_at DESC")[0]
    @attachment = @user.attachment
    @update_team = []    
    for team in @user.team
      unless team.diaries.find(:last).nil?
        if team.diaries.find(:last).created_at.month == Time.now.month
          if team.diaries.find(:last).created_at.day >= Time.now.day-3
            @update_team << team
          end
        elsif team.diaries.find(:last).created_at.month == Time.now.month-1
          if Time.now.day+28 <= team.diaries.find(:last).created_at.day
            @update_team << team
          end
        else
          @update_team = nil
        end
      else
        @updat_team = nil
      end
    end
    
	  respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
		if session[:user_id]
			flash[:notice] = 'you cannot register'
			return
		end
    @user = User.new
  end
  def edit
    @user = User.find_by_alias(params[:id])
  end
  def update
    @users = User.find_by_alias(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Users was successfully updated.'
        format.html { redirect_to '/1' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = Users.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end

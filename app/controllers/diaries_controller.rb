class DiariesController < ApplicationController
  # GET /diaries
  # GET /diaries.xml
  def index
    @find = if user = User.find_by_alias(params[:user_id])
              user
            else
              Team.find_by_alias(params[:team_id])
            end
    @page = if params[:page] == 0 || params[:page].nil?
              params[:page] = 1
            elsif params[:page].grep(/[^0-9]/)
              params[:page] = 1
            else
              params[:page]
            end
    @diaries = @find.diaries.find(:all, :order => 'created_at DESC', :limit => @page*5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diaries }
    end
  end

  # GET /diaries/1
  # GET /diaries/1.xml
  def show
    if @team = Team.find_by_alias(params[:id])
      @diaries = @team.user.find_by_alias(params[:user_id]).diaries
      @diaries = @diaries.find(:all, :conditions => {:team_id => @team.id},
                              :order => 'created_at DESC')
    else
      flash[:notice] = '잘못된 Team alias를 입력하셨습니다' 
      @diaries = '' 
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diary }
    end
  end

  # GET /diaries/new
  # GET /diaries/new.xml
  def new
    @diary = Diary.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diary }
    end
  end
  # GET /diaries/1/edit
  def edit
    @diary = Diary.find(params[:id])
  end

  # POST /diaries
  # POST /diaries.xml
  def create
    @diary = Diary.new(params[:diary])
    @diary.user_id = session[:user_id]
    @diary.team_id = session[:team_id]
    respond_to do |format|
      if @diary.save
        flash[:notice] = 'Diary was successfully created.'
        format.html { redirect_to :controller => 'users',
                                  :action => @diary.user.alias,
                                  :id => '@'
                    }
        format.xml  { render :xml => @diary, :status => :created, :location => @diary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diaries/1
  # PUT /diaries/1.xml
  def update
    @diary = Diary.find(params[:id])

    respond_to do |format|
      if @diary.update_attributes(params[:diary])
        flash[:notice] = 'Diary was successfully updated.'
        format.html { redirect_to(@diary) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.xml
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy

    respond_to do |format|
      format.html { redirect_to(diaries_url) }
      format.xml  { head :ok }
    end
  end
end

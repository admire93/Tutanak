class DiariesController < ApplicationController
  # GET /diaries
  # GET /diaries.xml
  def index
    @diaries = Diary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diaries }
    end
  end

  # GET /diaries/1
  # GET /diaries/1.xml
  def show
    @diary = Diary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diary }
    end
  end

  # GET /diaries/new
  # GET /diaries/new.xml
  def new
    @diary = Diary.new
    @env = request.env.inspect
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
        format.html { redirect_to(@diary) }
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

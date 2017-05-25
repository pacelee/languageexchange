class ProfilesController < ApplicationController

  # GET /profiles
  # GET /profiles.json

  def index
    @users = User.all
    @profiles = Profile.all
    if params[:search]
    @profiles = Profile.search(params[:search]).order("created_at DESC")
  else
    @profiles = Profile.all.order("created_at DESC")
  end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user = current_user.id
    @profile = Profile.find_by user_id: @user
  end

  def profile
    @profile = Profile.find_by user_id: params[:id]
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @user = current_user.id
    @profile = Profile.find_by user_id: @user
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_url, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @user = current_user.id
    @profile = Profile.find_by user_id: @user
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to "/profiles", notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @user = current_user.id
      @profile = Profile.find_by user_id: @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:tutor, :teaching, :is_male, :teaching_regions, :currently, :online, :skype, :rate, :nature, :user_id, :learning, :avatar, :email)
    end
end

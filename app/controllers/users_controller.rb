class UsersController < ApplicationController
  before_filter :admin_access, except: [:new, :edit, :create, :update]
  before_filter :info_access, only: [:new, :edit, :create, :update]
 
  # GET /users/new
  # GET /users/new.json
  def new
    @hash = request.env['omniauth.auth']
    if @user = User.find_from_hash(@hash)
      self.current_user = @user
      good_redirect(request.env['HTTP_REFERER'])
    else
      @form_name = "New User"
      @user = User.new_user_from_hash(@hash)
      respond_to do |format|
        format.html # new.html.erb
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @form_name = "Edit User"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.number
      @user.number = params[:user][:number].gsub(/\D+/, '')
    end
    
    respond_to do |format|
      if @user.save
        self.current_user = @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new", user: @user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  protected
    helper_method :admin_access, :info_access
      def info_access
        if id = params[:id]
          redirect_to root_url unless id == @current_user.id.to_s
        end
      end

      def admin_access
          redirect_to root_url unless @current_user && @current_user.admin?
      end
end

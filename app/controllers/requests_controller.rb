class RequestsController < ApplicationController

  before_filter :signed_in_check, only: [:new]
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
    @requests.sort! { |a, b| a.date <=> b.date }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = @current_user.requests.build
    @form_name = "Submit a new request"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @form_name = "Edit request"
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = @current_user.requests.create(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])
    owner_check(request)
    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    owner_check(request)
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :ok }
    end
  end

  def search
    @requests = Request.search params[:search]
    if @requests == []
      flash[:notice] = "No matching requests found. Please try searching again."
    else
      flash[:notice] = "We found #{@requests.length} matching #{view_context.pluralize(@requests.length, 'request').split(" ")[1]}"
    end

    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @requests }
    end
  end

  protected

    helper_method :signed_in_check, :owner_check

    def owner_check(request)
      unless @current_user.requests.member? request
        redirect_to root_url
      end
    end

    def signed_in_check
      unless signed_in?
        redirect_to controller: "session", action: "intermediate"
      end
    end
    
end

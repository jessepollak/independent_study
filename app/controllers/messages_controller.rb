class MessagesController < ApplicationController

    def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def new
  	@message = Message.new
    @request = Request.find(params[:request_id])
  	respond_to do |format|
      format.html
      format.json { render json: @message }
    end
  end

  def create
    @message = Message.new(params[:message])
    @request = Request.find(@message.request_id)
    respond_to do |format|
      if @message.save
        UserMailer.send_message(@request.user, @message).deliver
        format.html { redirect_to @request, notice: 'Thank you! Your message has been sent.' }
        format.json { render json: @request, status: :created}
      else
          format.html { render template: 'requests/show' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @message }
    end
  end

    def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end

end
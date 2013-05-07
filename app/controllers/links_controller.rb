class LinksController < ApplicationController
	def show
	end
	
	def new
		@link = Link.new
	end
	
	def create
		@link = Link.new(params[:link])
		@link.user_id = current_user.id

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully submitted.' }
				format.js   {}
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
	end
end
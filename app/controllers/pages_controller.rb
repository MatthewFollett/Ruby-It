class PagesController < ApplicationController
	def index
		@links = Link.order('created_at DESC').page(params[:page]).per_page(25)
	end
end

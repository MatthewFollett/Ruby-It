class SearchController < ApplicationController
	def index
		@links = Link.search(:title => params[:q]).page(params[:page]).per_page(20)
		@search = (params[:q] != nil)
	end
end
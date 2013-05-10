class VotesController < ApplicationController
	def show
		@vote    = Vote.find(params[:id])
	end
	
	def new
		@vote = Vote.new
	end
	
	def create
		@vote = Vote.where(:link_id => params[:vote][:link_id], :user_id => current_user.id).first
		if @vote
			@vote.vote = params[:vote][:vote]
			@vote.save
		else
			@vote = current_user.votes.create(params[:vote])
		end
		redirect_to :back
	end
end
class MyPollController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create]
	def index
	end
	def new		
	end
end
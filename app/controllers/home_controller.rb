class HomeController < ApplicationController

	def index
		@docteurs = Docteur.all
		@hash = Gmaps4rails.build_markers(@docteurs) do |docteur, marker|
			marker.lat docteur.latitude
  			marker.lng docteur.longitude
		end
	end

end

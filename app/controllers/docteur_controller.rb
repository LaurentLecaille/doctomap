class DocteurController < ApplicationController

	def new
		unless @erreur.nil?
			raise @erreur.inspect
			
		end
		@docteur = Docteur.new
		@all_specialite = ["Anatomie et Cytologie Pathologiques", "Anesthésiologie-réanimation", "Biologie médicale", "Cardiologie et maladies vasculaires", "Dermatologie et vénérologie", "Endocrinologie et métabolismes", "Génétique médicale", "Gastro-entérologie et hépatologie", "Gynécologie médicale", "Hématologie : hématologie maladies du sang ou hématologie onco-hématologie", "Médecine générale", "Médecine du travail", "Médecine physique et de réadaptation", "Médecine interne", "Médecine nucléaire", "Néphrologie", "Neurologie", "Oncologie médicale et onco-hématologie", "Oncologie radiothérapique ou Radiothérapie", "Pédiatrie", "Pharmacologie", "Pneumologie", "Psychiatrie", "Rhumatologie", "Santé publique et médecine sociale", "Radiodiagnostic et Imagerie médicale", "Allergologie", "Andrologie", "Angéiologie ou angiologie", "Gériatrie", "Infectiologie", "Informatique Médicale et Technologies de l'Information", "Information Médicale DIM", "Médecine d'urgence", "Médecine hyperbare", "Médecine légale", "Médecine nutritionnelle"]
		
	end

	def create
		coordinates = Geocoder.coordinates(params[:docteur][:adresse])
		unless coordinates.nil?
			docteur = Docteur.new(:nom => params[:docteur][:nom], :prenom => params[:docteur][:prenom], :adresse => params[:docteur][:adresse], :latitude => coordinates.first, :longitude => coordinates.last, :specialite => params[:docteur][:specialite])
			if docteur.valid?
				docteur.save
				redirect_to root_path
			else	
				erreur = docteur.errors.messages
				redirect_to new_docteur_path(:erreur =>erreur.keys)
				
			end	
		else
			redirect_to new_docteur_path(:erreur =>["adresse"])
		end
		
		
	end
end

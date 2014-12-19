class Docteur < ActiveRecord::Base
	validates :nom, :prenom, :adresse, presence: true


end

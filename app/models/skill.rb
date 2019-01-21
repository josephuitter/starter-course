class Skill < ApplicationRecord

	alidates_presence_of :title, :percent_utilized
end

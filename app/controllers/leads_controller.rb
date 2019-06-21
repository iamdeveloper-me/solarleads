class LeadsController < ApplicationController
	before_action :find_roofs, only: [:new, :create] 
	before_action :find_electricity_provider, only: [:index, :new, :create]

	# GET /leads/new
	def new
		@lead = Lead.new
	end

	# POST /leads
	def create
		@lead = Lead.new(lead_params)
		if @lead.save
			flash[:success] = "Lead was successfully created."
			redirect_to leads_thankyou_path(lead_id: @lead.id)
		else
			render "new"
		end
	end

	# GET /leads/:id/confirm_email
	def confirm_email
		lead = Lead.find_by_confirm_token(params[:id])
		if lead
			lead.email_activate
			flash[:success] = "Your Email is verified."
			redirect_to thank_you_path
		else
			flash[:error] = "Requested Confirmation token does not exist."
			redirect_to root_url
		end
	end

	# GET /leads/thankyou
	def thankyou
		lead = Lead.find(params[:lead_id])
		# Total Calculation
		@total_calculation = lead.current_monthly_electricity_bill.to_i / lead.square_feet.to_i
		# Find Average Energy Cost
		@average_energy_cost = AverageEnergyCost.where('region_name LIKE ?', "#{lead.state}%").first
	end

	# GET /thank_you
	def email_thankyou;end

	# GET /leads/send_mobile_verification_code
	def send_mobile_verification_code
		country_code = params[:country_code]
		phone_number = params[:phone_number]
		full_phone = "+#{country_code.strip() + phone_number}"
		@verification_code = rand(10 ** 4)

		Twilio::SendMobileVerificationCode.new(full_phone, @verification_code).call

		respond_to do |format|
			format.js
		end
	end

	# GET /leads/verify_mobile_code
	def verify_mobile_code
		# TODO: create new field and update that phone number has been verified
		@is_valid = params[:verify_phone_code] === params[:original_code] ? true : false
		respond_to do |format|
			format.js
		end
	end

	private

	# White listing Lead parameters
	def lead_params
		params.require(:lead).permit(:name, :email, :phone_number, :zipcode, :address, :age_of_home, :average_age_of_appliances, :current_monthly_electricity_bill, :electricity_company_name,:country, :state, :city, :verify_later ,:email_verification_token, :email_verify_later, :phone_verification_token, :roof_type_id, :roof_shading_id, :roof_pitch_id, :electricity_provider_id, :new_thermostat, :age_of_roof, :roof_color, :roof_ventilation, :replaced_air_filters, :cold_and_warm_spots, :doors_randomly_slam, :obstructions_around_floor, :current_ac_unit, :ac_blow_warm, :ac_turn, :noise_comes_through, :colder_around, :leaks_or_condensation, :operate_smoothly, :chipped_or_cracked_frames, :discoloration_on_curtains, :square_feet)
	end

	def find_roofs
		@roof_pitches  = RoofPitch.all
		@roof_shadings = RoofShading.all
		@roof_types    = RoofType.all
	end

	def find_electricity_provider
		@electricity_providers = ElectricityProvider.all
	end
end

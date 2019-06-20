Rails.application.routes.draw do
	# Root path
	root "welcome#index"

	# custum routes
	get "leads/thankyou"
	get "thank_you", to: "leads#email_thankyou"
	get "email_verification_token", to: "leads#email_verification_token"

	# Add Resources
	resources :leads, only: [:new, :create] do
		member do
			get :confirm_email
		end

		collection do
			get :send_mobile_verification_code
			get :verify_mobile_code
		end
	end

	# Error handle for wrong routes
  get '*path' => redirect { |p, req| req.flash["error"] = "Please enter correct URL!"; "/" }
end

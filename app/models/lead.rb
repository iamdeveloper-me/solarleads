class Lead < ApplicationRecord
  # Association
  belongs_to  :roof_pitch
  belongs_to  :roof_shading
  belongs_to  :roof_type
  belongs_to  :electricity_provider, optional: true

  # Callbacks
  before_create :confirmation_token
  # TODO: remove multiple after_create
  after_create :send_email_confirmation

  #Enum
  enum status: { open: "open", closed: "closed" }

  # Validation
  validates :name, :email, :current_monthly_electricity_bill, :square_feet, presence: true
  validates :phone_number,
              presence: true,
              numericality: true,
              length: { minimum: 10, maximum: 15 }
  validates :email, :phone_number, uniqueness: {allow_blank: true}

  # Public Methods
  def email_activate
    self.email_confirmed = true
    self.save
  end

  # Private Methods
  private

  def confirmation_token
    self.confirm_token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Lead.where(confirm_token: random_token).exists?
    end
  end

  def send_email_confirmation
    # TODO: have to send this email using back-groud jobs
    # Send email confirmation link to Lead to verify thier Email Address
    LeadMailer.email_confirmation(self.email, self.confirm_token).deliver
  end
end

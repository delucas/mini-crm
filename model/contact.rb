class Contact

  attr_reader :id, :full_name, :address, :phone_number, :email

  def initialize(parameters)
    @id = parameters[:id]
    @full_name = parameters[:full_name]
    @address = parameters[:address]
    @phone_number = parameters[:phone_number]
    @email = parameters[:email]
  end

end 
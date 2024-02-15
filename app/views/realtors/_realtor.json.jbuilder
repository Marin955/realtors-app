json.extract! realtor, :id, :first_name, :last_name, :brokerage, :zipcode, :image_url, :created_at, :updated_at
json.url realtor_url(realtor, format: :json)

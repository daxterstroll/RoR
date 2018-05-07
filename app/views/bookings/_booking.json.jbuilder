json.extract! booking, :id, :cars_id, :start_dates, :end_dates, :created_at, :updated_at
json.url booking_url(booking, format: :json)

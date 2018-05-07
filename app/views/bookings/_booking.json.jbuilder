json.extract! booking, :id, :user_id, :items_id, :start_dates, :end_dates, :created_at, :updated_at
json.url booking_url(booking, format: :json)

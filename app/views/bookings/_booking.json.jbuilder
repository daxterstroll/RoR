# frozen_string_literal: true

json.extract! booking, :id, :user_id, :item_id, :started_at, :ended_on,
              :created_at, :updated_at
json.url booking_url(booking, format: :json)
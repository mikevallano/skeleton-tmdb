json.array!(@notes) do |note|
  json.extract! note, :id, :rating, :review, :seen, :user_id, :movie_id
  json.url note_url(note, format: :json)
end

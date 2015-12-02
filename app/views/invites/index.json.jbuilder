json.array!(@invites) do |invite|
  json.extract! invite, :id, :sender_id, :receiver_id, :token, :email
  json.url invite_url(invite, format: :json)
end

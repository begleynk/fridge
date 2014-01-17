json.array!(@steps) do |step|
  json.extract! step, :id, :description, :scenario_id
  json.url step_url(step, format: :json)
end

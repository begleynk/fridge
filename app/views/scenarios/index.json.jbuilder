json.array!(@scenarios) do |scenario|
  json.extract! scenario, :id, :description, :background, :feature_id
  json.url scenario_url(scenario, format: :json)
end

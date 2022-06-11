json.array! @bicycles do |bicycle|
  json.bicycle bicycle
  json.extract! bicycle, :name, :brand
end

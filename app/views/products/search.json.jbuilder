json.array! @childrens do |child|
  json.id child.id
  json.name child.name
end

json.array! @grandChilds do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end
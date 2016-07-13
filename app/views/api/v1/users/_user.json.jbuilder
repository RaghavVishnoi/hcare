json.first_name user.first_name
json.last_name user.last_name
json.contact_number user.contact_number
json.email user.email
json.token user.remember_token
json.created_at user.created_at
json.role user.roles.pluck(:name).join(',')
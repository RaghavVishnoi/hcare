json.result true
json.status ACCEPTED_SUCCESS_CODE
json.object do
	json.partial! "/api/v1/users/user",user: @user
end
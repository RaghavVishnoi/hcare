json.result true
json.status FETCH_SUCCESS_CODE
json.object do
	json.partial! "center",collection: @centers,as: :center
end
json.result true
json.status FETCH_SUCCESS_CODE
json.object do
	json.partial! "trainer",collection: @trainers,as: :trainer
end
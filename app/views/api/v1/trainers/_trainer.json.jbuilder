json.name trainer.name
json.personal_contact_number trainer.personal_contact_number
json.alternate_contact_number trainer.alternate_contact_number
json.gender trainer.gender
json.email trainer.email
json.bio trainer.bio
json.awards_and_certificates trainer.awards_and_certificates
json.category trainer.category
json.address trainer.address
json.rating Trainer.total_rating(trainer.id)
json.reviews TrainerReview.reviews(trainer.id)
json.likes Trainer.likes(trainer.id)
json.is_reqeusted Trainer.is_requested?(trainer.user_id,current_user.id)
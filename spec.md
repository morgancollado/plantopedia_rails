Using Ruby on Rails for the project
 X Include at least one has_many relationship User has many OwnedPlants 
 X Include at least one belongs_to relationship OwnedPlant belongs to a user 
 X Include at least two has_many through relationships A plant has many users through owned_plants, a user has many plants through owned_plants 
 X Include at least one many-to-many relationship see above  
 X The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other X than its foreign keys that can be submitted by the app's user owned_plants have a user submittable attribute of deathdate and seed date
 X Include reasonable validations for simple model objects User model validates username and email, plant validates uniqueness of scientific name, owned_plant validates presence of user_id and plant_id, plant_log validates presence of owned_plant and user
 X Include a class level ActiveRecord scope method You can scope which owned_plant is alive 
 X Include signup self written sign up logic
 X Include login self written login logic 
 X Include logout self written logout logic 
 X Include third party signup/login omniauth via github
 X Include nested resource show or index (URL e.g. users/2/owned_plants)
 X Include nested resource "new" form (URL e.g. plants/1/user/2/plant_log/new)
 X Include form display of validation errors my forms validate data and show the errors
Confirm:

X The application is pretty DRY
X Limited logic in controllers
X Views use helper methods if appropriate
X Views use partials if appropriate
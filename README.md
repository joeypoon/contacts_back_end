# Contacts API

get 'users/:lat/:lng/:id'<br>
get 'inbound/:id'<br>
get 'outbound/:id' => 'users#outbound'<br>
Example response:

    [
      {
        "id": 2,
        "name": "Maiya Yundt",
        "email": "branson.homenick@larson.info",
        "contact_info": {
          "id": 2,
          "phone": null,
          "company": null,
          "facebook": null,
          "instagram": null,
          "github": null,
          "linkedin": null,
          "twitter": null,
          "site": null,
          "user_id": "2",
          "created_at": "2015-07-10T00:55:41.126Z",
          "updated_at": "2015-07-10T00:55:41.126Z"
        }
      }
    ]

get 'profile/:id'
get 'contacts/:id' => 'users#contact_list'

post 'update' => 'users#update'

post 'share/:id/:user_id' => 'users#share'<br>
Example Request:

    {
      "contact_info": {
        "phone": false,
        "facebook": false,
        "instagram": false,
        "github": true,
        "linkedin": true,
        "twitter": true,
        "site": true,
      }
    }

post 'login' => 'users#login'<br>
Example Request:

    {
      "user": {
        "email": "example@gmail.com",
        "password": "password"
      }
    }

post 'users' => 'users#create'<br>
Example Request:

    {
      "user": {
        "name": "Joey F. Poon",
        "email": "example@gmail.com",
        "password": "password",
        "password_confirmation": "password"
      }
    }

delete 'inbound/:id/:user_id' => 'users#destroy_inbound'
delete 'outbound/:id/:user_id' => 'users#destroy_outbound'
delete 'contacts/:user_id' => 'users#destroy_contact'

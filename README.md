# Contacts API

get 'users/:lat/:long/:id'<br>
get '/:id/inbound' => 'users#inbound'<br>
get '/:id/outbound' => 'users#outbound'<br>
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

get '/:id/profile' => 'users#show'

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

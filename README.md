# Contacts API

get 'users/:id/:lat/:long'
Example response:

    [
      {
        "id": 2,
        "contact_info": {
          "id": 2,
          "name": "Maiya Yundt",
          "email": "branson.homenick@larson.info",
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

get '/:id/inbound' => 'users#inbound'

get '/:id/outbound' => 'users#outbound'

post 'share/:id/:user_id' => 'users#share'

post 'login' => 'users#login'

post 'users' => 'users#create'
Example Request

    {
        "user": {
            "password": "password",
            "password_confirmation": "password"
        },
        "contact_info": {
            "email": "eiawaaadaadh@gmail.com"
        }
    }

# go-gin-gonic-api

### Testing The API

#### Get all data users

```shell
curl --location --request GET 'http://localhost:8080/api/users' | jq .
```

Body response:

```json
{
  "response_key": "SUCCESS",
  "response_message": "Success",
  "data": [
    {
      "id": 2,
      "name": "wayne",
      "email": "wayne@mail.ic",
      "status": 0,
      "role": {
        "id": 1,
        "role": "ADMIN"
      }
    },
    {
      "id": 3,
      "name": "wayne",
      "email": "wayne@mail.ic",
      "status": 0,
      "role": {
        "id": 1,
        "role": "ADMIN"
      }
    }
  ]
}
```

#### create data user

```shell
curl --location --request POST 'http://localhost:8080/api/users' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Itadori Yuji",
    "email": "yuji@yopmail.com",
    "password": "S3cret",
    "role": {
        "id":1,
        "role":"admin"
    },
    "status": 1
}' | jq .
```

Then the response should be like this

```json
{
  "response_key": "SUCCESS",
  "response_message": "Success",
  "data": {
    "id": 8,
    "name": "Itadori Yuji",
    "email": "yuji@yopmail.com",
    "status": 0,
    "role_id": 1
  }
}
```

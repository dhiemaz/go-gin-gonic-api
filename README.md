# go-gin-gonic-api

### Testing The API

#### Get all data users

```shell
curl --location --request GET 'http://localhost:8080/api/user'
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
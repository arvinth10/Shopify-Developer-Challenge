# Shopify Developer Challenge

https://docs.google.com/document/d/1J49NAOIoWYOumaoQCKopPfudWI_jsQWVKlXmw1f1r-4/edit

Built using Ruby on the Rails, GraphQL, and Postgresql

# GraphiQL API Explorer

https://web-api-shopify.herokuapp.com/graphiql

# API Endpoint

https://web-api-shopify.herokuapp.com/graphql


# API Calls

## Get Products API

**Method:** POST

**Description:** Get product in database based on parameters given

**Optional parameters for allProducts:**

- title: String - Find product with similar title
  
- has_inventory: Boolean - Show products that only has inventory or does not have inventory based on flag
 
### Get All Products
#### Request Body
```
{
  allProducts() {
    id
    title
    price
    inventory_count
  }
}
```

#### Sample Response
```
{
  "data": {
    "allProducts": [
      {
        "id": "6",
        "title": "cup",
        "price": 3.49,
        "inventory_count": 10
      },
      {
        "id": "1",
        "title": "book",
        "price": 10.99,
        "inventory_count": 3
      }
    ]
  }
}
```
#### Curl Example
```
curl \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"query":"{ allProducts { id title  price inventory_count  }}","variables":null,"operationName":null}' \
  https://web-api-shopify.herokuapp.com/graphql
```
  

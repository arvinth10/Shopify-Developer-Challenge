# Shopify Developer Challenge

https://docs.google.com/document/d/1J49NAOIoWYOumaoQCKopPfudWI_jsQWVKlXmw1f1r-4/edit

Built using Ruby on the Rails, GraphQL, and Postgresql

# GraphiQL API Explorer

https://web-api-shopify.herokuapp.com/graphiql


# API Calls

## API Endpoint

https://web-api-shopify.herokuapp.com/graphql

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
   "query":"query {  allProducts {    id    title    price    inventory_count }}",
   "variables":null
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
        "inventory_count": 0
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
  --data '{"query":"{ allProducts { id title  price inventory_count  }}","variables":null}' \
  https://web-api-shopify.herokuapp.com/graphql
```
  
### Get Only Products That Have Inventory

#### Request Body
```
{  
   "query":"query ($has_inventory: Boolean){  allProducts (has_inventory: $has_inventory) {    id    title    price    inventory_count  }}",
   "variables":{  
      "has_inventory":true
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
  --data '{"query":"query ($has_inventory: Boolean){  allProducts (has_inventory: $has_inventory) {    id    title    price    inventory_count  }}","variables":{"has_inventory":true}}' \
  https://web-api-shopify.herokuapp.com/graphql
```


### Get Products By Title

Note: This is currently case sensitive

#### Request Body
```
{  
   "query":"query ($title: String){  allProducts (title: $title) {    id    title    price    inventory_count  }}",
   "variables":{  
      "title":"apple"
   }
}
```

#### Sample Response
```
{  
   "data":{  
      "allProducts":[  
         {  
            "id":"3",
            "title":"apple",
            "price":1.99,
            "inventory_count":10
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
  --data '{"query":"query ($title: String){  allProducts (title: $title) {    id    title    price    inventory_count  }}","variables":{"title":"apple"}}' \
  https://web-api-shopify.herokuapp.com/graphql
```

## Add Products

**Method:** POST

**Description:** Add a new product to the system

**Required parameters for createProduct:**

- title: String - Title of product
  
- price: Float - Price of product

- inventory_count: Int - Inventory of product

#### Request Body

```
{  
   "query":"mutation ($title: String!, $price: Float!, $inventory_count:Int!){  createProduct(title: $title, price: $price, inventory_count: $inventory_count) {   id    title    price    inventory_count  }}",
   "variables":{  
      "title":"light",
      "price":4.99,
      "inventory_count":5
   }
}
```

#### Sample Respone

```
{
  "data": {
    "createProduct": {
      "id": "8",
      "title": "light",
      "price": 4.99,
      "inventory_count": 5
    }
  }
}
```

#### Curl Example
```
curl \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"query":"mutation ($title: String!, $price: Float!, $inventory_count:Int!){  createProduct(title: $title, price: $price, inventory_count: $inventory_count) {   id    title    price    inventory_count  }}","variables":{"title":"light","price":4.99,"inventory_count":5}}' \
  https://web-api-shopify.herokuapp.com/graphql
```

## Purchase Product


**Method:** POST

**Description:** Purchase product

**Required parameters for purchaseProduct:**

- id: ID - Unique ID of product, which can be obtained from above Get Product calls
  
- quantity: Int - Quantity of product being purchase

#### Request Body
```
{  
   "query":"mutation ($id: ID!, $quantity: Int!){  purchaseProduct(id: $id, quantity:$quantity) {   id   title   price   inventory_count  }}",
   "variables":{  
      "id":1,
      "quantity":1
   }
}
```

#### Sample Response When Purchase Successful
```
{
  "data": {
    "purchaseProduct": {
      "id": "2",
      "title": "book",
      "price": 10.99,
      "inventory_count": 9
    }
  }
}
```

#### Sample Response When Purchase Not Successful
```
{
  "data": {
    "purchaseProduct": null
  }
}
```

#### Curl Example

```
curl \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"query":"mutation ($id: ID!, $quantity: Int!){  purchaseProduct(id: $id, quantity:$quantity) {   id   title   price   inventory_count  }}","variables":{"id":1,"quantity":1}}' \
  https://web-api-shopify.herokuapp.com/graphql
```

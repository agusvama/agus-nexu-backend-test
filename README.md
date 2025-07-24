# Nexu Backend Challenge 🚗

This is a backend developed using Ruby on Rails as part of a technical assesment for Nexu.
It exposes an API with two tables, Brands and Models.
I included a Postman collection for easily testing on production. Find it in this repository's root (NexuBackendTestProd.postman_collection.json)

## Coverage
- [ ] Endpoints
    - [x] GET /brands
    - [x] GET /brands/:id/models
    - [x] GET /models
    - [x] POST /brands
    - [ ] POST /brands/:id/models
    - [ ] PUT /models/:id
- [x] Unit tests for implemented endpoints
- [x] Linted code
- [x] Unique brand's names
- [x] Brand's average price is the average of their models' average prices
- [x] Database populated with the sample json
- [x] Bonus: App deployed -> https://agus-nexu-backend.onrender.com

## Feedback

This was a nice exercise to code. I enjoyed the time I put into writing each part of it. I had fun and I'm proud of the result.
I consider it a good chanllenge to apply for the software engineer position at Nexu.

If I had more time I'd:
- [ ] Fix the Rubocop offenses. I consider they are not too heavy, just a matter of aligning to a standard code base.
- [ ] Add a validation layer for requests authentication.
- [ ] Implement a callback to update a brand's new average price when a new model is added.

## 🛠  Stack

- Ruby on Rails (7.1.5.1)
- PostgreSQL (v15)
- FactoryBot + RSpec
- Rubocop
- Render.com (app host)

## Deploy

This app is available at [Render](https://render.com/).

## Available Endpoints

Base URL: https://agus-nexu-backend.onrender.com

### `GET /brands`

Lists all brands.

[Brands](https://agus-nexu-backend.onrender.com/brands)

---

### `GET /brands/:id/models`

Lists all models from the solicited brand.

[Brand's Models](https://agus-nexu-backend.onrender.com/brands/7/models) <- example for Brand: Chevrolet

---

### `GET /models`

Lists all models.

[Models](https://agus-nexu-backend.onrender.com/models)

---

### `POST /brands`

Creates a new Brand. Name must be unique.

#### Body (JSON):

```json
{
  "name": "BYD",
  "average_price": 1000000
}
```

It returns an error message if the brand already exists.

```json
{
    "errors": [
        "Name has already been taken"
    ]
}
```

## Tests

```bash
bundle exec rspec
```

## Local execution

Install dependencies
- Ruby 3.2.2
- Postgres 15

Install gems
```
bundle install
```

Create, migrate and populate the database
```
rails db:create
rails db:migrate
rails db:seed
```

Run the server and go to localhost:3000. You should see a welcoming page. You can either visit the endpoints from your browser or use the Postman collections included in this repository.
```
rails server
```

Built with love by: [Agus](https://github.com/agusvama)

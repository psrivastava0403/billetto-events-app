# 🎟️ Billetto Events App

A Ruby on Rails application that fetches events from the Billetto API and allows authenticated users to upvote/downvote events using an event-driven architecture.

---

## 🚀 Features

* Fetch events from Billetto API
* Display event list (title, date, image, description)
* User authentication using Clerk
* Upvote / Downvote functionality
* Event-driven voting system
* Prevent duplicate voting per user
* RSpec test coverage

---

## 🛠️ Tech Stack

* Ruby on Rails 7
* PostgreSQL
* Clerk (Authentication)
* Rails Event Store
* RSpec

---

## ⚙️ Setup Instructions

### 1. Clone Repository

git clone <your-repo-url>
cd billetto-events-app

---

### 2. Install Dependencies

bundle install

---

### 3. Setup Database

rails db:create
rails db:migrate

---

## 🔑 Billetto API Setup

1. Go to https://billetto.com
2. Create an Organizer account
3. Go to Developer / API section
4. Generate your API Key

### Add API Key in Project

Create `.env` file:

BILLETTO_API_KEY=your_api_key_here

Use in code:

ENV['BILLETTO_API_KEY']

⚠️ Do NOT commit `.env` file

---

## 🔐 Clerk Authentication Setup

1. Go to https://clerk.com
2. Create a new application
3. Copy your Publishable Key

### Add Clerk to Rails App

File: app/views/layouts/application.html.erb

<script  
  defer  
  crossorigin="anonymous"  
  data-clerk-publishable-key="YOUR_PUBLISHABLE_KEY"  
  src="https://YOUR_DOMAIN/npm/@clerk/clerk-js@6/dist/clerk.browser.js">  
</script>  

---

### Clerk Dashboard Configuration

Development Host:
http://localhost:3000

Sign In / Sign Up:
Use Account Portal

Signing Out:
/

---

## ▶️ Run Application

rails s

Open in browser:
http://localhost:3000

---

## 🗳️ Voting System (Event-Driven)

* Votes are NOT stored as counters
* Each vote creates an event:

  * EventUpvoted
  * EventDownvoted
* Events are stored in Rails Event Store
* Vote count is calculated dynamically

---

## 🧠 Design Decisions

* Used Event Store instead of DB counters
* Used Clerk for authentication
* Prevented duplicate voting
* Simple Rails ERB UI

---

## ⚠️ Assumptions

* API returns valid data
* Clerk handles auth
* One user = one vote

---

## 🧪 Testing

Run tests:

bundle exec rspec

Covered:

* Models
* Services
* Event Store
* Requests

---

## 📌 Future Improvements

* Pagination
* Better UI
* Caching
* Background jobs

---

## 📦 Submission

This repo includes:

* Full Rails app
* API integration
* Auth system
* Event-driven voting
* Tests
* Documentation

---

## 👨‍💻 Author

Prashant Srivastava

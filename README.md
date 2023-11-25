Original App Design Project 
===

# FitFolio

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

FitFolio is more than just a fitness tracker; it's an all-in-one solution for better nutrition, enhanced workouts, and improved sleep.


### App Evaluation

- **Category:** Health and Fitness
- **Mobile:**  App includes a camera that allows users to scan barcodes or pictures of their meal, sensors for tracking physical activity and sleep 
- **Story:** Helps everyone to improve their health. This app offers personalized insights into nutrition, exercise, and sleep, enabling users to make informed decisions for a healthier lifestyle
- **Market:** This app caters to all people of all age groups. Everyone eats, exercises and sleeps. Health enthusiasts or people who are looking to make positive changes to their diet, exercise routine or sleeping habits can use this app
- **Habit:** Encourages regular tracking and goal monitering. Users inputs their meals, exercises and sleep. Users consume and create by reviewing their data and creating goals
- **Scope:** Users inputs their meals, exercises and sleep

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can log their daily meals including details such as food, quantity, nutritional info, log their workouts including exericse type and duration and log their sleep hours
* Users can view an overview of their progress in nutrition, exercise, and sleep.
* Users can login
* Users can create a new account

**Optional Nice-to-have Stories**

* Allow users to see a graph of their data and input goals.
* Provide users with workout sessions, meal suggestions and sleep recommendations 
* Users can connect with friends sharing achievements and progress

### 2. Screen Archetypes

- [x] Login Screen
* Users can login

- [x] Registration Screen
* Users can create an account

- [x] Stream
* Users can view the nutrition, exercise, and sleep tabs.

- [x] Creation
* Users can log their daily meals including details such as food, calories, log their workouts  and log their sleep hours.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Dashboard 
* Nutrition Tab
* Exercise Tab
* Sleep Tab

**Flow Navigation** (Screen to Screen)

- [x] Login Screen
* => Dashboard

- [x] Registration Screen
* => Dashboard

- [x] Creation Screen
* => Dashboard
 
## Wireframes

<blockquote class="imgur-embed-pub" lang="en" data-id="GjNekJK"><a href="https://imgur.com/GjNekJK">WireFrame</a></blockquote>
Part 1:
https://www.loom.com/share/608601728f1f482cb105a0443d4ef26a

Part 2:
https://www.loom.com/share/cce7542da7b442c4818d5847fe1fc4c5
### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

```swift
struct Task: 
{
    // name of food, null if other option is selected
    var title: String
    
    // calories or hours
    var note: String?
    
    // food or sleep or excerise
    var option: Int
    
    // The due date by which the task should be completed
    var dueDate: Date
```


### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

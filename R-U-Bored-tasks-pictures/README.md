Original App Design Project - README Template
===

# R U BORED?

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
R U BORED? is an iOS mobile application that helps users maintain a high level of productivity by suggesting tasks they can do when they are bored. The application also helps users decide what tasks to do if they have a list of tasks but can't decide what to do first. The app also has reminders that users can implement to remind them to do a task. 
### App Evaluation
- Category: Productivity 
- Mobile: While the app may be viable on a computer, the mobile version of the app would still provide a unique and valuable experience for users. The app could utilize push notifications to remind users about tasks they need to complete, even when they are not actively using the app. Overall, while the app may not rely on sensors, audio, or other advanced mobile features, it still has unique mobile features that make it more than just a glorified website.
- Story: R U BORED app's story is compelling as it offers a solution to a common problem of productivity and decision making. The app's ability to suggest tasks to users when they are bored and help them prioritize their to-do list is a clear value proposition. The app aims to enhance the productivity of its users and make their lives easier by simplifying their decision-making process.
- Market: R U BORED app has a broad target audience. Friends and peers who often find themselves having trouble deciding what to do next could find the app helpful. The app's reminders feature could also appeal to users who struggle with procrastination and forgetfulness.
- Habit: The app is habit-forming. It's designed to be used as often as the user wants, depending on their social life and interests. The app focus on providing suggestions and reminders to help users be more productive. It can provide value when they use it.
Scope: First, we require the users to enter their tasks, then return a random task in that list. The challenging technical aspect of this would be to create an algorithm to return a random task.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User goes to login page and upon logging in go to the home page.(DONE)
* User navigates to the easy task page and clicks a button that triggers a random task to display. (DONE)
* User navigates to the specific task page and inputs different tasks they want to accomplish. Then when they finish they get a random order of those tasks. 
* User goes back to delegated task and is able to document whether they have completed it or not. 



**Optional Nice-to-have Stories**

*  User navigates to easy task page and picks certain tasks to Russian Roulette 
*  User can make and save different specific task lists so they don't have to type all of the same specific tasks. User goes to a page of saves task lists. 
*  User is met with a visualization or total count of all of the tasks they have completed, 

### 2. Screen Archetypes

* Login Screen
    * User is prompted to log-in or make an account, and upon either of those two, the homescreen is automatically rendered. (IN PROGRESS)
* Home Screen 
   * This screen displays options to navigate to teh Random Task Screen, Specific Task Screen, or and Saved Tasked Screen. 
* Random Task Screen
   * User is prompted to press a button called task generator that then displays the written task they must complete. It then shows them a button they can press to document that they completed it
   * Once they complete it, some kind of fun image to say good job for completing the task is rendered. 
* Specific Task Screen
    * User is prompted to write in certain tasks into a bar. They must write a title for the tasks. As they press enter the task comes up in a list. A button saying save list and another saying generate tasks is there. 
    * Once the user is done writing in tasks, they press the "generate tasks" button and then a random order of the tasks is generated.
    * User is done writing in tasks and they want to save it so the press "save list". Upon tapping this a text bubble saying "list saved" appears. Nothing else happens. They can press "generate tasks" to then get a random order of the tasks they just wrote in. 
* Saved Task Screen 
    * Every tasks list's title is displayed as a button to be pressed. Upon picking one, the user is then presented with a random order of the tasks in that saved list. 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Random 
* Specific Tasks
* Saved Tasks


**Flow Navigation** (Screen to Screen)
* Login/create an account >> HomePage 
* Specific Tasks >> displays information input bars 
* Saved Tasks >> displayed the ordered list of the tasks in the tasks the user picks
* Random >> displays random task

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://imgur.com/a/MNb2iTw.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

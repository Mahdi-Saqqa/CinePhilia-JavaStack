# Cinephilia

Welcome to CinePhilia, The Ultimate Movie App! CinePhilia is an online movie database that allows users to explore captivating films, check ratings, and share their own reviews. It aims to address the challenges users face in finding diverse film recommendations and accessing reliable movie data.

## Key Features
• User Authentication: 

CinePhilia ensures secure access and user authentication through a robust system. Users can create accounts, log in securely, and enjoy personalized features.

• CRUD Operations: 

Users can perform Create, Read, Update, and Delete operations on specific entities within the system. They can view existing data, write reviews, rate movies, update their reviews, and delete their own reviews. Admins have additional privileges.

• Integration with TMDB API: 

CinePhilia seamlessly integrates with the TMDB (The Movie Database) API, providing users with comprehensive and up-to-date movie information, including posters, overviews, ratings, genres, and cast information.

• Responsive Design: 

CinePhilia is designed with a responsive user interface that adapts to different screen sizes, ensuring a consistent and optimized experience across desktops, tablets, and mobile devices.

• Secure Access: 

CinePhilia leverages Spring Security to ensure secure user authentication and access, safeguarding user data and protecting against unauthorized access.



## Collaborators

The development of CinePhilia was a collaborative effort by the following team members:

 Mahdi Saqqa https://github.com/Mahdi-Saqqa
 
 Taleen Khoury https://github.com/TaleenMusa
 
 Shatha Morales https://github.com/ShathaMorales
 
 Khalid Hassouneh https://github.com/KhalidHassouna

 
 
## ERD Diagram

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/a7386251-bf4f-4949-932a-20d2a2a7e014.png" >

## Relationships
Many To Many Realationships

1- User & Movie  

2- Movie & Review

3- Movie & Rate

4- Movie & Genre

5- User & Role (Admin/User)



## Security and Validation
Control Access for website page using Spring Security.

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/57ac0354-6fe1-4a2a-aa1c-60c6929b1afe.png" >

Login & Logout Validation

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/8b1a4a1d-81e3-4c6a-bf05-1c4b9d3e0624.png" >

### Website pages

1- View the list of Movies available (through the path of the main page)

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/64599aa6-34ef-40e2-8d32-90f7cc30a7e8.png" >

2- Check full Movie information from the HTTP service GET : http://localhost:8080/(our path)"

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/5aab6da1-37cd-4380-a4f7-b111429b9926.png" >

3- Add Reviews and Ratings to the movie

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/7cf47fc6-edd1-41be-bfd1-0e7815087161.png" >

4- Wishlist 

5- Adimn page 

6- Discover


## Technologies Used:

CinePhilia was developed using the following technologies:
•	Java

•	IntelliJ IDEA

•	JavaScript

•	CSS3

•	HTML5

•	Bootstrap

•	MySQL

• Bcrypt

• PostMan

. AJAX

• JQuery

These technologies were utilized to create a robust and user-friendly movie app, ensuring seamless functionality, responsive design, and secure data management.

CinePhilia aims to revolutionize the way movie enthusiasts interact with films and engage with a community of like-minded individuals. By offering an immersive movie-watching experience, comprehensive information, and a platform for sharing reviews, CinePhilia strives to become the go-to app for all movie lovers.

# Cinephilia

Welcome to CinePhilia, the ultimate movie app! CinePhilia is an online Database of Information related to Movies. 

Explore captivating films, Check Ratings, and share your own Reviews! Immerse yourself in curated movies from various genres. Make informed decisions with comprehensive information and ratings. Join a vibrant community and express your thoughts through reviews.

Users struggle to find diverse film recommendations and face challenges in accessing reliable movie data. CinePhilia, aims to address these challenges by providing a centralized platform with a wide range of features.


KeyFeatures

 User Authentication
CinePhilia ensures secure access and user authentication through a robust user authentication system. This allows users to create accounts, log in securely, and enjoy personalized features.

 CRUD Operations
Users have the ability to perform Create, Read, Update, and Delete operations on specific entities within the system. They can view existing data, write new reviews, rate movies, update their reviews, and have the ability to delete their own reviews. 

Admins have extra privileges, they can delete their own reviews, logged-in memebers' reviews, and delete movies from the database.
Admins can also update movie-related data.

 Integration with TMDB API
CinePhilia seamlessly integrates with the TMDB (The Movie Database) API, allowing users to access relevant movie data such as the film Poster, Title Overview, ratings, genres, cast information, and more. This integration enhances the app's functionality and provides users with comprehensive and up-to-date information.

 Responsive Design
The CinePhilia app is designed with a responsive user interface that adapts to different screen sizes. Whether users access the app from desktops, tablets, or mobile devices, they can enjoy a consistent and optimized user experience.

 Secure Access
CinePhilia leverages Spring Security to ensure secure user authentication and access to the application, safeguarding user data and protecting against unauthorized access.


## Team Members
 Mahdi Saqqa https://github.com/Mahdi-Saqqa
 
 Taleen Khoury https://github.com/TaleenMusa
 
 Shatha Morales https://github.com/ShathaMorales
 
 Khalid Hassouneh https://github.com/KhalidHassouna
 
Our team utilized modern technologies and frameworks to bring CinePhilia to life. We leveraged Spring Security for user authentication and secure access. 
The integration with the TMDB API provided a rich source of movie data. We focused on building a Responsive web design using HTML, CSS, and JavaScript frameworks such as Bootstrap.

 
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

Login & Logout validation

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/8b1a4a1d-81e3-4c6a-bf05-1c4b9d3e0624.png" >

### Website pages

1- View the list of Movies available (put the path for the main page)

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/64599aa6-34ef-40e2-8d32-90f7cc30a7e8.png" >

2- Check complete Movie information from the HTTP service GET : http://localhost:8080/(our path)"

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/5aab6da1-37cd-4380-a4f7-b111429b9926.png" >

3- Add Reviews and Ratings to the movie

<img src="https://github.com/Mahdi-Saqqa/CinePhilia/assets/126386351/7cf47fc6-edd1-41be-bfd1-0e7815087161.png" >

4- Wishlist 

5- Adimn page 

6- Discover

## Technologies Used:
•	Java

•	IntelliJ IDEA

•	JavaScript

•	CSS3

•	HTML5

•	Bootstrap

•	MySQL


CinePhilia aims to revolutionize the way movie enthusiasts interact with films and engage with a community of like-minded individuals. By offering an immersive movie-watching experience, comprehensive information, and a platform for sharing reviews, CinePhilia strives to become the go-to app for all movie lovers.



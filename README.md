# Comic heroes app

App developed in flutter which queries Marvels API. It is developed following clean architecture principles and MVVM pattern.
State Management is done with Provider and ChangeNotifiers

## Running

In order to run the app a .env file must be added to the root of the project.
This file should contain the following data without curly brackets

    PUBLIC_KEY={Your marvel api public key}
    PRIVATE_KEY={Your marvel api private key}
    BASE_URL=https://gateway.marvel.com/v1/public/
    
## Demo 


https://user-images.githubusercontent.com/35939695/226208929-64442a6f-bb80-4202-9b92-5355b3f0d091.mp4


## Roadmap after MVP

This version of the app is a MVP version, some changes, refactors and improvements are pending:
* Animations for images when loading
* Image Placeholders for comic images 
* Loading UI state for events, stories, comics
* Pagination/"See more" for events, stories, comics 
* Usecase layer for business logic (Currently the app doesn't have much business logic)
* Consider moving events, stories, comics to separate repositories
* Building a thorough Theme

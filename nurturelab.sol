pragma solidity >=0.4.0<0.7.0;
contract nurturelab{
    
    uint public movieCount =0;
    uint public actorCount =0;
    uint[] public moviesbyactors;
    uint[] public actorsbymovies;
    
    
    
    
    // a structure which contains the details of the Movies such as movieID and movieName.
    struct Actors
    {
        uint ActorID;
        string ActorName;
        bool isValue;
        uint[]  moviesbyactor;
    
        
        
    }
    
    struct Movies
    {
        uint movieID;
        string movieName;
        bool isValue;
        uint[] actorsbymovie;
        
        
    }
    //a sturcture which contains the details of the Actors such as actorID and actorName.
    
    mapping(uint => Movies) public Movie;
    
    // An array of sturcture which stores the object of Structure Movies against the movieID.
    
    event MoviesAdded(uint256 movieID, string movieName);
    
    //it gives notifcation to user that movie is added in the movie section.
    
    mapping(uint => Actors) public Actor;
    
     // An array of sturcture which stores the object of Structure Actors against the ActorID.
     
    mapping(uint=>bytes32[] ) public moviebyactor;
    
    //An array which stores the name of movies correspoding to the id of Actor
     
    event ActorsAdded(uint ActorID, string ActorName);
    
    //it gives notification to user that actor is added in the actor list.
    
    function addMovie(string memory _movieName) public{
        movieCount++;
        Movie[movieCount]= Movies(movieCount,_movieName,true, moviesbyactors );
        emit MoviesAdded(movieCount,_movieName);
    }
    
    //it is a userdefined function, which adds the movie to the array of Movie.
    
    function addActor(string memory _ActorName) public{
        actorCount++;
        Actor[actorCount]= Actors(actorCount,_ActorName,true, moviesbyactors );
        emit ActorsAdded(actorCount,_ActorName);
    } 
    
//it allows users to add the movies list to the actor.
    
    function addMovietoActor(uint ID, uint MovieID) public  {
        if((Actor[ID].isValue) && (Movie[ID].isValue))
        {
            Actor[ID].moviesbyactor.push(MovieID);
        }
    
    }
//it allows users to add actors to the movies
    
    function addActortoMovie(uint ID, uint ActorID) public  {
        if((Actor[ID].isValue) && (Movie[ID].isValue))
        {
            Movie[ID].actorsbymovie.push(ActorID);
        }
    
    }
//it get all the movies done by a actor.
     function getAllmoviesbyActor(uint idA) public view returns (uint[] memory){
         if(Actor[idA].isValue)
         {
             return Actor[idA].moviesbyactor;
         }
        
    } 
//it get all the actors who were in movie.
    function getAllactorsbymovies(uint idM) public view returns (uint[] memory){
         if(Movie[idM].isValue)
         {
             return Movie[idM].actorsbymovie;
         }
        
    }   
}
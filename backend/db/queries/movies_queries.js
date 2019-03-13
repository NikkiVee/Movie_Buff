const { db } = require('../index.js');

const getOneMovie = (req, res, next) => {
  const id = Number(req.params.id);
  db.any(
    'SELECT  movies.id, movies.title, movies.img_url, JSON_AGG(comments.body) AS comments, ratings FROM movies JOIN comments ON movies.id = comments.movie_id FULL JOIN(SELECT movie_id, AVG(stars) AS ratings FROM ratings GROUP BY movie_id) AS ratings ON movies.id = ratings.movie_id WHERE movies.id = $1 GROUP BY movies.id, ratings.ratings',
    id
  )
    .then(data => {
      res.status(200).json({
        status: 'Success',
        data: data,
        messsage: 'Received ONE movie',
      });
    })
    .catch(err => next(err));
};

const getAllMovies = (req, res, next) => {
  db.any(
    'SELECT movies.id, title, img_url, name, AVG(ratings.stars) FROM movies JOIN genres ON movies.genre_id = genres.id JOIN ratings ON movies.id = ratings.movie_id GROUP BY movies.id, movies.genre_id, genres.name ORDER BY title'
  )
    .then(data => {
      res.status(200).json({
        status: 'Success',
        data: data,
        message: 'Received ALL movies',
      });
    })
    .catch(err => next(err));
};

const getMoviesByGenre = (req, res, next) => {
  db.any(
    'SELECT movies.*, AVG(ratings.stars), genres.* FROM movies JOIN ratings ON movies.id = ratings.movie_id JOIN genres ON movies.genre_id = genres.id GROUP BY movies.id, movies.title, movies.img_url, genres.id ORDER BY title'
  )
    .then(data => {
      res.status(200).json({
        status: 'Success',
        data: data,
        messsage: 'Received ALL movies BY GENRE',
      });
    })
    .catch(err => next(err));
};

module.exports = { getOneMovie, getAllMovies, getMoviesByGenre };

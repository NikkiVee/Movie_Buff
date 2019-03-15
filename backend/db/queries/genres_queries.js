const { db } = require('../index.js');

const getAllGenres = (req, res, next) => {
  db.any(
    'SELECT * FROM genres'
  )
    .then(data => {
      res.status(200).json({
        status: 'Success',
        data: data,
        message: 'Received ALL genres',
      });
    })
    .catch(err => next(err));
};

const getOneGenre = (req, res, next) => {
  [Number(req.params.id)];
  db.any('SELECT movies.id, title, genre_id, img_url, name FROM movies JOIN genres ON movies.genre_id=genres.id WHERE movies.genre_id=$1',
  [Number(req.params.id)])
  .then(data => {
    res.status(200).json({
      status: 'success',
      data: data,
      message: 'Received ONE GENRE',
    });
  })
  .catch(err => next(err));
};

module.exports = { getAllGenres, getOneGenre };

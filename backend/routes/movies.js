const express = require('express');
const router = express.Router();

const { getOneMovie, getAllMovies, getMoviesByGenre } = require('../db/queries/movies_queries.js');

router.get('/:id', getOneMovie);
router.get('/', getAllMovies);
router.get('/byGenre', getMoviesByGenre);

module.exports = router;

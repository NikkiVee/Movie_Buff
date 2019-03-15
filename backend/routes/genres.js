const express = require('express');
const router = express.Router();

const { getAllGenres, getOneGenre } = require('../db/queries/genres_queries.js');

router.get('/', getAllGenres);
router.get('/:id', getOneGenre);

module.exports = router;

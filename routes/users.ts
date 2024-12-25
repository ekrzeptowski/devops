import express from 'express';
const router = express.Router();

/* GET users listing. */
export default router.get('/', function(req, res) {
  res.send('respond with a resource');
});
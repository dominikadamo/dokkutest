import express from 'express'

const app = express()

const router = express.Router()

router.get('/api/test', (req, res) => {
  return res.send('okok')
})

app.use(router)

app.listen(4000, () => {
  console.log('server is listening on port 4000')
})
# app
express = require('express')
app = express()

# config
app.configure ->
  app.use(express.static("#{__dirname}/public"))
  app.set('env', process.env.NODE_ENV or 'development')
  app.set('port', process.env.PORT or 3000)

# listen
app.listen(app.get('port'))

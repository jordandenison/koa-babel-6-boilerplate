import bluebird from 'bluebird'

import koa from 'koa'
import middleware from './middleware/middleware'
import routes from './routes/routes'
import errors from './services/errors'

process.on('uncaughtException', errors.uncaughtExceptionHandler)
bluebird.onPossiblyUnhandledRejection(errors.onPossiblyUnhandledRejectionHandler)

const app = koa()

middleware.init(app)
routes.init(app)

const port = process.env.PORT || 8080
const server = app.listen(port, () => console.log('server listening on port: %s', port))

module.exports = server

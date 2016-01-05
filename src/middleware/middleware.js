import cors from 'kcors'
import bodyParser from 'koa-bodyparser'
import errors from '../services/errors'
import jwt from 'koa-jwt'

const limit = '1mb'
const path = '/'
const secret = new Buffer(process.env.JWT || 'test', 'base64')

const middleware = {
  init (app) {
    app.use(cors({
      allowHeaders: 'Origin, X-Requested-With, Content-Type, Accept, Authorization',
      credentials: true
    }))
    app.use(errors.serverErrorHandler())
    app.use(bodyParser({ limit }))
    app.use(jwt({ secret }).unless({ path }))
  }
}

module.exports = middleware
